//
//  LocationManager.swift
//  NavigationApp
//
//  Created by GEM on 4/17/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Mapbox
import MapKit

protocol LocationManagerDelegate: class {
    
    func updateLocation(newLocation: CLLocation)
}

class LocationManager: NSObject {
    // MARK: - Varialbes
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    var delegate: LocationManagerDelegate?
    var userLocation: MGLUserLocation?
    
    var isLocationServiceEnabled: Bool {
        return CLLocationManager.locationServicesEnabled()
    }
    
    // MARK: - Singleton
    static let shared = LocationManager()
    
    // MARK: - Init
    override init() {
        super.init()
    }
    
    func startBackgroundLocationUpdates() {
        //        self.locationManager?.delegate = self
        self.locationManager?.startUpdatingLocation()
    }
    
    fileprivate var getCurrentLocationCallback: ((CLLocation?, CLAuthorizationStatus) -> Void)?
    // MARK: - Public methods
    func startUpdateHeading() {
        locationManager?.startUpdatingHeading()
    }
    
    func getCurrentLocation(completion: ((_ location: CLLocation?, _ status: CLAuthorizationStatus) -> Void)?) {
        if isLocationServiceEnabled == false {
            completion?(CLLocation(latitude: 0, longitude: 0), CLAuthorizationStatus.denied)
        } else {
            self.getCurrentLocationCallback = completion
            self.startStandardUpdates()
        }
    }
    
    func stopGetCurrentLocation() {
        self.getCurrentLocationCallback = nil
        self.locationManager?.stopUpdatingLocation()
    }
    
    fileprivate func startStandardUpdates() {
        if isLocationServiceEnabled == false {
            self.getCurrentLocationCallback?(CLLocation(latitude: 0, longitude: 0), .denied)
        } else {
            if self.locationManager == nil {
                self.locationManager = CLLocationManager()
                //                self.locationManager?.requestAlwaysAuthorization()
                self.locationManager?.delegate = self
                self.locationManager?.requestWhenInUseAuthorization()
                self.locationManager?.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
                self.locationManager?.pausesLocationUpdatesAutomatically = true
                self.locationManager?.activityType = CLActivityType.fitness
                self.locationManager?.allowsBackgroundLocationUpdates = true
                self.locationManager?.distanceFilter = 5.0
            }
            self.startBackgroundLocationUpdates()
        }
    }
    
    fileprivate func stopStandardUpdates() {
        self.locationManager?.stopUpdatingLocation()
        self.locationManager?.delegate = nil
        self.locationManager = nil
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // check status
        switch status {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
            break
        case .restricted:
            getCurrentLocationCallback?(nil, status)
            break
        case .denied:
            getCurrentLocationCallback?(nil, status)
            break
        case .authorizedAlways:
            getCurrentLocationCallback?(nil, status)
            break
        case .authorizedWhenInUse:
            startStandardUpdates()
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // get location
        if let latestLocation = locations.last {
            self.currentLocation = latestLocation
            self.getCurrentLocationCallback?(latestLocation, CLAuthorizationStatus.authorizedWhenInUse)
            self.stopStandardUpdates()
            self.locationManager?.allowsBackgroundLocationUpdates = true
            if let delegate = self.delegate {
                delegate.updateLocation(newLocation: latestLocation)
            }
        } else {
            self.startStandardUpdates()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.getCurrentLocationCallback?(nil, CLAuthorizationStatus.authorizedWhenInUse)
    }
}
