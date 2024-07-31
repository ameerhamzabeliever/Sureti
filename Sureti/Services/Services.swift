//
//  Services.swift
//  Sureti
//
//  Created by Hamza's Mac on 22/09/2021.
//

import Alamofire

extension NetworkManager{
    func checkEmail(
        param       : [String:Any],
        completion  : @escaping (DataResponse<String>) -> ()
    ) {
        Helper.debugLogs(any: param, and: "CHECK EMAIL PARAM")
        sendPostRequest(
            endPoint   : Constants.endPoints.CHECK_EMAIL,
            parameters : param,
            completion : completion
        )
    }
    func checkLogin(
        param       : [String:Any],
        completion  : @escaping (DataResponse<String>) -> ()
    ) {
        Helper.debugLogs(any: param, and: "CHECK LOGIN PARAM")
        sendPostRequest(
            endPoint   : Constants.endPoints.CHECK_LOGIN,
            parameters : param,
            completion : completion
        )
    }
}
