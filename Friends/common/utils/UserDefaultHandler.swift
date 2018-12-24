//
//  UserDefaultHandler.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
class UserDefaultHandler {
    static func save(_ value :String ,key:Constans) {
        UserDefaults.standard.set(value, forKey: key.rawValue)
    }
    static func getValue(for key:Constans) -> String {
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
}
