//
//  APIServiceAgent.swift
//  5dmax
//
//  Created by Huy Nguyen on 1/4/17.
//  Copyright © 2017 Huy Nguyen. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

/*
 *  APIServiceAgent takes responsible for 
 *  - Convert DataResponse<Any> to JSON object
 *  - Detect and handle application errors such as: token expired, version not support...
 */

let statusCodeSuccess   = "success"
let statusCodeFail      = "fail"

class APIServiceAgent: NSObject {
    /*
     *  perform request
     *  param:
     *  - request: DataRequest
     *  - completion block (JSON, NSError?)
     */
    func startRequest(_ request: DataRequest, completion: @escaping(JSON, NSError?) -> Void) {
        print("startRequest: \(request)")
        request
            .validate()
            .responseJSON { (_ response: DataResponse<Any>) in
                switch response.result {
                case .success:
                    let json            = JSON(response.result.value!)
                    let status          = json["status"].stringValue
                    _                   = json["message"].stringValue
                    //let responseCode    = json["responseCode"].intValue
                    
                    if statusCodeSuccess == status {
                        completion(json["data"] as JSON, nil)
                    } else {
                        //let error = NSError.init()
                        completion(json, nil)
                    }
                    break
                case .failure(let error as NSError):
                    if error.code == NSURLErrorNotConnectedToInternet || error.code == NSURLErrorNetworkConnectionLost {
                        //let error = NSError.errorWith(code: error.code, message: String.internetConnectionLost)
                        completion(JSON.null, error)
                    } else {
                        completion(JSON.null, error)
                    }
                    break
                default:
                    break
                }
        }
    }
}
