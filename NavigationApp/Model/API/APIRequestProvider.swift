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
let apiVersion = "/v5"

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
                //"access_token": Constants.MAPBOX_ACESS_TOKEN
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
}
