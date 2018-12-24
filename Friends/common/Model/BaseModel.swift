//
//  BaseModel.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
import ObjectMapper
class  BaseModel :Mappable {
    var responseCode :String?
    var errorMessage :String?
    required init?(map: Map) {
    }
    func mapping(map: Map) {
        responseCode <- map["response_code"]
        errorMessage <- map["error_msg"]
    }
}
