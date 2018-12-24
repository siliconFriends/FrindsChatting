//
//  RegisterModel.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
import ObjectMapper
class RegisterModel :BaseModel {
    var accessToken :String?
    var user : UserModel?
    override func mapping(map: Map) {
        super.mapping(map: map)
        accessToken <- map["access_token"]
        user <- map["user"]

    }
}
class UserModel :Mappable {
    var name: String?
    var mobile: String?
    var username: String?
    var birthdate: String?
    var gender: String?
    var country:Country?
    
    required init?(map: Map) {
    }
    
     func mapping(map: Map) {
        name <- map["name"]
        mobile <- map["mobile"]
        username <- map["username"]
        birthdate <- map["birthdate"]
        gender <- map["gender"]
        country <- map["country"]

    }

}

