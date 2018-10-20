//
//  ApiHelper.swift
//  Setio
//
//  Created by Ahmed on 6/1/17.
//  Copyright © 2017 Fekra. All rights reserved.
//

import Foundation
class ApiHelper {

    static func getBaseBody(token :String) -> [String :Any] {
            return ["token": token]
    }

    static func getRegistrationBody(name:String , password :String,phone:String,user_type:String,city_id:String,pntoken:String) -> [String :Any] {
        
        return ["name" :name ,"password" :password ,"phone":phone ,"user_type" :user_type , "firebasetoken":pntoken,"city_id" :city_id]
    }
    
    static func getLoginBody(password :String,email:String,customerType:String,userNameType:Int,pntoken:String) -> [String :Any] {
            if userNameType == 1 {
                //email
                return ["email" :email ,"password" :password ,"user_type" :customerType ,"firebasetoken":pntoken]
            }
            //phone
            return ["phone" :email ,"password" :password  ,"user_type" :customerType ,"firebasetoken":pntoken]


    }
    
    static func getEditProfileBody(token:String , name:String,phone:String,image :String,userType:String,cityId:String) -> [String :Any] {
            return ["name" :name ,"phone":phone , "token":token,"user_type" :userType , "image":image,"city_id":cityId]
    }
   
    
    

}
