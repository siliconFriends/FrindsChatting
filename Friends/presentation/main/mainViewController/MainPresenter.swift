//
//  MainPresenter.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
import  ObjectMapper
import FBSDKLoginKit
import FBSDKCoreKit

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
        let loginManager = FBSDKLoginManager()
        loginManager.logIn(withReadPermissions: ["public_profile", "email"], from: self.socialView as? UIViewController) { (result, error) in

            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                    return
                }
                if(fbloginresult.grantedPermissions.contains("email"))
                {
                    self.getFBUserData()
                }
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
