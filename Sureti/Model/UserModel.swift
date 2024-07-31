//
//  UserModel.swift
//  Sureti
//
//  Created by Hamza's Mac on 23/09/2021.
//

import SwiftyJSON

struct UserModel : Codable  {
    let ssnstatus                 : String
    let lastName                  : String
    let ssnexpiry                 : String
    let apartmentno               : String
    let firstName                 : String
    let role                      : String
    let userCellNo                : String
    let idbackURL                 : String
    let hassignedinonce           : Bool
    let ssn                       : String
    let idstatus                  : String
    let idexpiry                  : String
    let cansubmitacheck           : Bool
    let token                     : String
    let email                     : String
    let noOfCheckCollabboratingIn : String
    let emailVerified             : Bool
    let idfrontURL                : String
    let joiningDate               : String
    let mailingAddress            : String
    let customerStatus            : String
    let profilePicture            : String
    let id                        : Int
    let proprofilecompletionpercentage : Int
    
    init(json : JSON) {
        ssnstatus                 = json["ssnstatus"]      .stringValue
        lastName                  = json["lastName"]       .stringValue
        ssnexpiry                 = json["ssnexpiry"]      .stringValue
        apartmentno               = json["apartmentno"]    .stringValue
        firstName                 = json["firstName"]      .stringValue
        role                      = json["role"]           .stringValue
        userCellNo                = json["userCellNo"]     .stringValue
        idbackURL                 = json["idbackURL"]      .stringValue
        hassignedinonce           = json["hassignedinonce"].boolValue
        ssn                       = json["ssn"]            .stringValue
        idstatus                  = json["idstatus"]       .stringValue
        idexpiry                  = json["idexpiry"]       .stringValue
        cansubmitacheck           = json["cansubmitacheck"].boolValue
        token                     = json["token"]          .stringValue
        email                     = json["email"]          .stringValue
        noOfCheckCollabboratingIn = json["noOfCheckCollabboratingIn"].stringValue
        emailVerified             = json["emailVerified"] .boolValue
        idfrontURL                = json["idfrontURL"]    .stringValue
        joiningDate               = json["joiningDate"]   .stringValue
        mailingAddress            = json["mailingAddress"].stringValue
        customerStatus            = json["customerStatus"].stringValue
        profilePicture            = json["profilePicture"].stringValue
        id                        = json["id"].intValue
        proprofilecompletionpercentage = json["proprofilecompletionpercentage"].intValue
    }
}
