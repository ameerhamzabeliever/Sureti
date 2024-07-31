//
//  Constants.swift
//  Sureti
//
//  Created by Hamza's Mac on 21/09/2021.
//

import Foundation
import Alamofire

struct Constants {
    /* MARK:- Singleton struct initilization */
    static var sharedInstance : Constants = Constants()
    
    var httpHeaders           : HTTPHeaders {
        get {
            return [
                "Authorization" : UserDefaults.standard.string(forKey: Constants.userDefaults.HTTP_HEADERS) ?? ""
            ]
        }
    }
    /* MARK:- View Controllers */
    struct VCNibs {
        static let SIGN_IN = "SigninVC"
        static let SIGN_UP = "SignupVC"
        static let Home    = "HomeVC"
    }
    
    /* MARK:- End Points */
    struct endPoints {
        static let CHECK_EMAIL = "/Mobile/doesUserExist"
        static let CHECK_LOGIN = "/Mobile/UserLogin"
    }
    
    /* MARK:- User Defaults */
    struct userDefaults {
        static let HTTP_HEADERS       = "httpHeaders"
    }
}
