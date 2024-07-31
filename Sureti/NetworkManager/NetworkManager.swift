//
//  NetworkManager.swift
//  Sureti
//
//  Created by Hamza's Mac on 22/09/2021.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager{
    static let sharedInstance =  NetworkManager()
    
    func sendPostRequest(
        endPoint    : String,
        parameters  : Parameters,
        completion  : @escaping (DataResponse<String>) -> Void
    ){
        Alamofire.request(
            SERVER_ENV[ENV]! + endPoint,
            method      : .post,
            parameters  : parameters,
            encoding    : URLEncoding.default
        ).responseString { (response) in
            completion(response)
        }
    }
    
    func sendPostRequestHeaders(
        endPoint    : String,
        parameters  : Parameters,
        completion  : @escaping (DataResponse<String>) -> Void
    ){
        let headers = Constants.sharedInstance.httpHeaders
        Helper.debugLogs(
            any: headers,
            and: "HTTP HEADERS"
        )
        Alamofire.request(
            SERVER_ENV[ENV]! + endPoint,
            method      : .post,
            parameters  : parameters,
            encoding    : URLEncoding.default,
            headers     : headers
        ).responseString { (response) in
            completion(response)
        }
    }
}
