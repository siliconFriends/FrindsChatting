//
//  RegisterServices.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
import ObjectMapper
class RegisterServices {
    func getCountries(completion:@escaping (_ countries:[Country])->()) {
        RequestBuilder.request(method:.get,url: ApiLinks.serverLink + "country", parmters: nil) { (response, Error) in
            if let countries = Mapper<Country>().mapArray(JSONObject: response) {
                completion(countries)
            }
        }
    }
    func getMobileInUse(mobileNumber :String,completion:@escaping (_ inUse:Bool)->()) {
        RequestBuilder.request(method:.get,url: ApiLinks.userLink + "validate-mobile-not-inuse", parmters: ["mobileNumber":mobileNumber]) { (response, error) in
            if error == "" {
                let inUse = response["inUse"] as? Bool
                completion(inUse ?? false)
            }
        }
    }
    func sendVerficationCode(mobileNumber :String,completion:@escaping (_ sent:Bool)->()) {
        RequestBuilder.request(method:.get,url: ApiLinks.userLink + "send-verification-code", parmters: ["mobileNumber":mobileNumber]) { (response, error) in
            if error == "" {
                let sent = response["send"] as? Bool
                completion(sent ?? false)
            }
        }
    }
    func validateVerficationCode(mobileNumber :String,code :String,completion:@escaping (_ valid:Bool)->()) {
        RequestBuilder.request(method:.get,url: ApiLinks.userLink + "validate-verification-code", parmters: ["mobileNumber":mobileNumber,"code":code]) { (response, error) in
            if error == "" {
                let valid = response["valid"] as? Bool
                completion(valid ?? false)
            }
        }
    }
    func checkUserInUse (useName :String,completion:@escaping (_ inUse:Bool)->()) {
        RequestBuilder.request(method:.get,url: ApiLinks.userLink + "validate-username-not-inuse", parmters: ["username":useName]) { (response, error) in
            if error == "" {
                let inUse = response["inUse"] as? Bool
                completion(inUse ?? false)
            }
        }
    }
    func register(mobileNumber :String,country :String,userName :String,birthDate :String,gender :String,password :String,completion:@escaping (_ inUse:UserModel)->()) {
        RequestBuilder.request(method:.post,url: ApiLinks.userLink + "register", parmters: ["country": country,"mobile": mobileNumber, "username": userName,"birthdate": birthDate,"gender": gender, "password":password]){ (response, error) in
            if error == "" {
                if let registerModel = Mapper<RegisterModel>().map(JSONObject: response) {
                    UserDefaultHandler.save(registerModel.accessToken!, key: .CurrentUser)
                    completion(registerModel.user!)
                }
            }
        }
    }
}
