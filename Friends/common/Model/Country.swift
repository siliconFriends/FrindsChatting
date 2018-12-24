//
//  Country.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
import ObjectMapper
class Country :Mappable {
    var id: Int?
    var countryCode: String?
    var countryEnName: String?
    var countryArName: String?
    var phoneCode:String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        countryCode <- map["country_code"]
        countryEnName <- map["country_enName"]
        countryArName <- map["country_arName"]
        phoneCode <- map["phonecode"]
    }
}
