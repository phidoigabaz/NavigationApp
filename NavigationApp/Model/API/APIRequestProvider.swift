//
//  APIRequestProvider.swift
//  5dmax
//
//  Created by Huy Nguyen on 1/4/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Mapbox

let kClientVersionHeaderField = "os_version_code"
let kClientOSHeaderField = "os_type"


let baseURL = "https://api.mapbox.com/geocoding" //-> mopbox URL
let baseURL_Google = "https://maps.googleapis.com/maps/api" // -> google map URL
let apiVersion = "/v5"
let apiVersion_Google = "/place"

/*
 *  APIRequestProvider takes responsible for build and provide request for service objects
 *  default header for request will be defined here
 */
class APIRequestProvider: NSObject {

    //mark: SINGLETON
    static var shareInstance: APIRequestProvider = {
        let instance = APIRequestProvider()
        return instance
    }()

    //mark: DEFAULT HEADER & REQUEST URL
    private var _headers: HTTPHeaders = [:]
    var headers: HTTPHeaders {
        set {
            _headers = headers
        }
        get {
            let headers: HTTPHeaders = [
                "Authorization": "",
                "Accept": "application/json",
                "Content-Type": "application/x-www-form-urlencoded",
            ]

            return headers
        }
    }
    
//    private var _headersSpot: HTTPHeaders = [:]
//    var headersSpot: HTTPHeaders {
//        set {
//            _headersSpot = headersSpot
//        }
//        get {
//            let imei = UIDevice.current.identifierForVendor?.uuidString
//            let authorization = "Bearer " + imei!
//            let headersSpot: HTTPHeaders = [
//                "Authorization": authorization,
//                "Accept": "application/json",
//                "Content-Type": "application/x-www-form-urlencoded"
//            ]
//
//            return headersSpot
//        }
//    }

    func commonParam() -> [String: String] {
        let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as! String
        let deviceOS = "ios"
        var param = [String: String]()
        param[kClientVersionHeaderField] = version
        param[kClientOSHeaderField] = deviceOS
        return param
    }
    
    //Mapbox
    private var _requestURL: String = baseURL
    var requestURL: String {
        set {
            _requestURL = requestURL
        }
        get {
            var url = _requestURL
            url.append("\(apiVersion)/")
            return url
        }
    }
    
    //GOOGLE MAP
    private var _requestURL_Google: String = baseURL_Google
    var requestURL_Google: String {
        set {
            _requestURL_Google = requestURL_Google
        }
        get {
            var url = _requestURL_Google
            url.append("\(apiVersion_Google)/")
            return url
        }
    }

    var alamoFireManager: SessionManager

    override init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForResource = 30 // seconds for testing

        alamoFireManager = SessionManager(configuration: configuration)
    }

    //mark: -- Authorization Requests
    
    func getPlaceNearYou(lat: CLLocationDegrees,lng: CLLocationDegrees) -> DataRequest {
        let urlString = requestURL.appending("mapbox.places/\(lat),\(lng).json")
        var param = commonParam()
        param["access_token"] = Constants.MAPBOX_ACESS_TOKEN
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: nil)
    }
    
    func searchPlace(_ searchText: String) -> DataRequest {
        let urlString = requestURL.appending("mapbox.places/\(searchText).json")
        var param = commonParam()
        param["access_token"] = Constants.MAPBOX_ACESS_TOKEN
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: nil)
    }
    
    
    //Google map
    func getNearBySearch(lat: CLLocationDegrees,lng: CLLocationDegrees,radius: Int) -> DataRequest {
        let urlString = requestURL_Google.appending("nearbysearch/json?location=\(lat),\(lng)")
        var param = commonParam()
        param["key"] = Constants.GOOGLE_API_KEY
        param["radius"] = String(radius)
        param["sensor"] = "true"
        return alamoFireManager.request(urlString,
                                        method: .get,
                                        parameters: param,
                                        encoding: URLEncoding.queryString,
                                        headers: nil)
    }
}
