//
//  SettingServices.swift
//  PamZ
//
//  Created by admin on 10/30/18.
//  Copyright © 2018 admin. All rights reserved.
//

import Foundation
import Mapbox

class SettingService: APIServiceObject {
    func getPlaceNearYou(lat: CLLocationDegrees,lng: CLLocationDegrees,completion: @escaping((NSError?)-> Void)) {
        let request = APIRequestProvider.shareInstance.getPlaceNearYou(lat: lat, lng: lng)
        self.serviceAgent.startRequest(request) { (json, err) in
            if err == nil {
                print(json)
            } else {
                
            }
        }
    }
    
    func searchPlace(_ searchText: String, completion: @escaping(([SearchModel],NSError?) -> Void)) {
        let request = APIRequestProvider.shareInstance.searchPlace(searchText)
        self.serviceAgent.startRequest(request) { (json, err) in
            if err == nil {
                var models = [SearchModel]()
                for i in json["features"].arrayValue {
                    let dto = SearchDTO(i)
                    let model = SearchModel(dto)
                    models.append(model)
                }
                completion(models, nil)
            } else {
                completion([SearchModel](),err)
            }
        }
        addToQueue(request)
    }
    
    func getNearBySearch(lat: CLLocationDegrees,lng: CLLocationDegrees,radius: Int,completion: @escaping(([NearByModel],NSError?)-> Void)) {
        let request = APIRequestProvider.shareInstance.getNearBySearch(lat: lat, lng: lng, radius: radius)
        self.serviceAgent.startRequest(request) { (json, err) in
            print(json)
            if err == nil {
                var models = [NearByModel]()
                for i in json["results"].arrayValue {
                    let dto = NearByDTO(i)
                    let model = NearByModel(dto)
                    models.append(model)
                }
                completion(models, nil)
            } else {
                completion([NearByModel](),err)
            }
        }
        addToQueue(request)
    }
}
