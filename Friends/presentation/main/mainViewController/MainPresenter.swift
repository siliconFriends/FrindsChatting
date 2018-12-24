//
//  MainPresenter.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
import  ObjectMapper
import FacebookLogin
import FBSDKLoginKit
import FacebookCore

class MainPresenter:BasePresenter {
    fileprivate let registerService:RegisterServices
    weak fileprivate var socialView : mainView?
    
    init(registerSerives:RegisterServices) {
        self.registerService = registerSerives
    }
    func attachView(_ socialView:mainView) {
        self.socialView = socialView
    }
    func detachView() {
        self.socialView = nil
    }
    
    // Mark : FaceBook Login
    func FaceBookAuthLogin () {
        let loginManager = LoginManager()
        loginManager.logIn(readPermissions:[.publicProfile, .email ], viewController: nil) { (result) in
            switch result{
            case .cancelled:
                print("Cancel button click")
            case .success:
                let params = ["fields" : "id, name, first_name, last_name, picture.type(large), email "]
                let graphRequest = FBSDKGraphRequest.init(graphPath: "/me", parameters: params)
                let Connection = FBSDKGraphRequestConnection()
                Connection.add(graphRequest) { (Connection, result, error) in
                    let info = result as! [String : AnyObject]
                    print(info["name"] as! String)
                }
                Connection.start()
            default:
                print("??")
            }
        }
        
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    //everything works print the user data
                    print(result)
                }
            })
        }
    }
    
    
    
}
