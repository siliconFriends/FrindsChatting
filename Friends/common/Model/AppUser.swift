//
//  AppUser.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
class AppUser {
    static var sharedInstance = AppUser()
    var user:UserModel?
    var sig:String?
}
