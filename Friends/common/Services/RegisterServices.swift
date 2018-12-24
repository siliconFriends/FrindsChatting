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
        RequestBuilder.request(method:.get,url: ApiLinks.serverLink + "country", parmters: nil) { (responseArray,error) in
            if let countries = Mapper<Country>().mapArray(JSONObject: responseArray) {
                completion(countries)
            }
        }
    }
    func getMobileInUse(mobileNumber :String,completion:@escaping (_ inUse:Bool)->(),errorResponse:@escaping (_ error:String)->()) {

        RequestBuilder.request(method:.get,url: ApiLinks.userLink + "validate-mobile-not-inuse", parmters: ["mobileNumber":mobileNumber],completion:  { (response, error) in
            if error == "" {
                let inUse = response["inUse"] as? Bool
                completion(inUse ?? false)
            }else{
                errorResponse(error)
            }
        })
    }
    func sendVerficationCode(mobileNumber :String,completion:@escaping (_ sent:Bool)->(),errorResponse:@escaping (_ error:String)->()) {
        RequestBuilder.request(method:.get,url: ApiLinks.userLink + "send-verification-code", parmters: ["mobileNumber":mobileNumber],completion:{ (response, error) in
            if error == "" {
                let sent = response["send"] as? Bool
                completion(sent ?? false)
            }else{
                errorResponse(error)
            }
        })
    }
    func validateVerficationCode(mobileNumber :String,code :String,completion:@escaping (_ valid:Bool)->(),errorResponse:@escaping (_ error:String)->()) {
        RequestBuilder.request(method:.get,url: ApiLinks.userLink + "validate-verification-code", parmters: ["mobileNumber":mobileNumber,"code":code],completion:{ (response, error) in
            if error == "" {
                let valid = response["valid"] as? Bool
                completion(valid ?? false)
            }else{
                errorResponse(error)
            }
        })
    }
    func checkUserInUse (useName :String,completion:@escaping (_ inUse:Bool)->(),errorResponse:@escaping (_ error:String)->()) {
        RequestBuilder.request(method:.get,url: ApiLinks.userLink + "validate-username-not-inuse", parmters: ["username":useName],completion: { (response, error) in
            if error == "" {
                let inUse = response["inUse"] as? Bool
                completion(inUse ?? false)
            }else{
                errorResponse(error)
            }
        })
    }
    func register(mobileNumber :String,country :String,userName :String,birthDate :String,gender :String,password :String,completion:@escaping (_ inUse:UserModel)->(),errorResponse:@escaping (_ error:String)->()) {
        RequestBuilder.request(method:.post,url: ApiLinks.userLink + "register", parmters: ["country": country,"mobile": mobileNumber, "username": userName,"birthdate": birthDate,"gender": gender, "password":password],completion:{ (response, error) in
            if error == "" {
                if let registerModel = Mapper<RegisterModel>().map(JSONObject: response) {
                    UserDefaultHandler.save(registerModel.accessToken!, key: .CurrentUser)
                    completion(registerModel.user!)
                }
            }else{
                errorResponse(error)
            }
        })
    }
}
