//
//  AppApi.swift
//  Setio
//
//  Created by Ahmed on 5/29/17.
//  Copyright © 2017 Fekra. All rights reserved.
//

import Foundation
import Alamofire

class RequestBuilder {
   static var sharedInstance = RequestBuilder()
    static  func request(method :HTTPMethod,url :String,parmters : [String:Any]?,completion :@escaping ( _ response :[String: Any],_ connectionError :String)->Void){
        if !isIntnetAvailable() {
            completion([String: Any](),"checkInternet".localize)
            return
        }
        Alamofire.request(url, method: method, parameters: parmters, encoding: JSONEncoding.default, headers: nil).responseJSON{ response in
            
            switch response.result{
            case .success( _):
                let jsonResponse = response.result.value!
                print(jsonResponse)
                if let dictionary = jsonResponse as? [String: Any] {
                    completion(dictionary,"")
                }else {
                    completion([String: Any](),"Ops!".localize)
                }
                
                break
                
            case .failure(let error):
                print(error.localizedDescription)
                completion([String: Any](),"Ops!".localize)
                break
                
            }

        }
    }
 
    
    static func isIntnetAvailable() ->Bool {
        var reachability :Reachability?
        reachability = Reachability(hostName: "www.apple.com")
        guard let r = reachability else { return false  }
        if r.isReachable  {
            return true
        }
        return false
    }
}
