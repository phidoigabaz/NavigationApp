//
//  HomeViewController.swift
//  NavigationApp
//
//  Created by GEM on 4/12/19.
//  Copyright © 2019 dattt. All rights reserved.
//

import UIKit
import Mapbox

@objc class HomeViewController: BaseViewController, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var currentLocationView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var whereGoLabel: UILabel!
    @IBOutlet weak var timeStandLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    
    let settingService = SettingService()
    var sizingCell: HomeItemCollectionViewCell? = nil
    var placeNearView = PlaceNearView()
    var presenter: HomePresenter?
    var nearByModel: [NearByModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
    }
    
    //MARK: METHODS
    override func setupView() {
        LocationManager.shared.isLocationServiceEnabled ? setupUserLocation() : ()
        menuView.setRadiusView(currentLocationView.frame.size.height/2)
        currentLocationView.setRadiusView(currentLocationView.frame.size.height/2)
        whereGoLabel.text = "Where are you going \ntoday?"
        timeStandLabel.text = timeStandLabel.text?.getDateTimeCurrent()
        baseDataModel.parseHomeData()
        collectionView.register(UINib(nibName: HomeItemCollectionViewCell.nibName(), bundle: nil),
                                forCellWithReuseIdentifier: HomeItemCollectionViewCell.nibName())

        DispatchQueue.main.async {
            self.collectionLayout.estimatedItemSize = CGSize(width: 50, height: 25)
            self.collectionLayout.itemSize = UICollectionViewFlowLayout.automaticSize
//            self.bottomView.addColorGradientLayerInBackground(frame: CGRect(x: 0, y: 0, width: Constants.iWidth,
//                                                                       height: self.collectionView.bounds.size.height),
//                                                         colors: [.clear, .white])
            self.collectionView.reloadData()
        }
    }
    
    func setupUserLocation() {
        mapView.tintColor = .currentLocationColor
        mapView.delegate = self
        mapView.showsUserLocation = true
    }
    
    func getData() {
        if let userLocation = mapView.userLocation?.coordinate {
            presenter?.getDataSuccess(userLocation.latitude, userLocation.longitude, 1500)
        }
    }
    
    func getUserLocation() {
        if let location = mapView.userLocation {
            LocationManager.shared.userLocation = location
        }
    }
    
    func loadNib() -> PlaceNearView {
        let infoWindow = PlaceNearView.instanceFromNib()
        return infoWindow
    }
    
    func pushPlaceNearView() {
        self.bottomView.isHidden = true
        self.placeNearView.removeFromSuperview()
        self.placeNearView = self.loadNib()
        self.placeNearView.backgroundColor = .clear
        self.placeNearView.delegate = self
        getUserLocation()
        DispatchQueue.main.async {
            self.getData()
            //self.placeNearView.nearbyModel = self.nearByModel
            self.placeNearView.collectionView.reloadData()
            self.placeNearView.frame = CGRect(x: 0, y: Constants.iHeight - self.placeNearView.containerView.bounds.height - Constants.appDelegate.getHeightSafeArea(),
                                              width: Constants.screenWidth,
                                              height: self.placeNearView.containerView.bounds.height)
            let transition = CATransition()
            transition.type = CATransitionType.push
            transition.subtype = CATransitionSubtype.fromRight
            self.placeNearView.layer.add(transition, forKey: nil)
            self.view.addSubview(self.placeNearView)
        }
    }
    
    //MARK: ACTIONS
    
    @IBAction func onCurrentLocationAction(_ sender: Any) {
        mapView.setCenter((mapView.userLocation?.coordinate)!, zoomLevel: 14.0, animated: true)
    }
    
    @IBAction func onMenuAction(_ sender: Any) {
        let menuVC = MenuViewController.initWithDefaultNib()
        present(menuVC, animated: true, completion: nil)
    }
    
    @IBAction func onSearchAction(_ sender: Any) {
        let searchVC = SearchViewController.initWithDefaultNib()
        present(searchVC, animated: true, completion: nil)
    }
}

extension HomeViewController: MGLMapViewDelegate {
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        return true
    }
    
    func mapViewDidFinishLoadingMap(_ mapView: MGLMapView) {
        mapView.setCenter((mapView.userLocation?.coordinate)!, zoomLevel: 14.0, animated: true)
    }
}

//
extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return baseDataModel.sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeItemCollectionViewCell.nibName(),
                                                      for: indexPath) as! HomeItemCollectionViewCell
        cell.titleLabel.text = baseDataModel.sections[indexPath.row].title
        cell.thumbaiImageView.image = baseDataModel.sections[indexPath.row].image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            pushPlaceNearView()
        case 1:
            let router = RouteViewController.initWithDefaultNib()
            navigationController?.pushViewController(router, animated: true)
        default:
            break
        }
    }
}

extension HomeViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedAlways:
            LocationManager.shared.currentLocation = mapView.userLocation?.location
            setupMapView()
        case .authorizedWhenInUse:
            LocationManager.shared.currentLocation = mapView.userLocation?.location
            setupMapView()
        default:
            break
        }
    }
}

extension HomeViewController: PresenterToHomeViewProtocol {
    func showData(_ list: [NearByModel]) {
        nearByModel = list
    }
}

extension HomeViewController: PlaceNearViewDelegate {
    @objc func onDismissView(_ view: PlaceNearView,_ sender: Any) {
        view.removeFromSuperview()
        bottomView.isHidden = false
    }
}
