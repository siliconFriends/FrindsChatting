//
//  MainViewController.swift
//  MalakiSwift
//
//  Created by AHMED NASSER on 9/19/17.
//  Copyright © 2017 Nobala. All rights reserved.
//

import UIKit
import PKHUD
class BaseViewController: UIViewController {
    let NO_ERROR = "1" ;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PKHUD.sharedHUD.contentView = PKHUDProgressView()

    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func showProgress(){
        HUD.show(.progress)
    }
    func hideProgress(){
        HUD.hide()
    }
//    func error(errorMessage: String) {
//        DialogeCreator.alertWithTittlMessage(title: "خطأ", message: errorMessage, viewController: self)
//    }
//    func success(message: String) {
//        DialogeCreator.alertWithTittlMessage(title: "تم", message: message, viewController: self)
//    }
//    func navigateTo(viewController :String){
//        
//    }
}
