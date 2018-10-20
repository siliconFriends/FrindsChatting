//
//  MainTableViewController.swift
//  MalakiSwift
//
//  Created by AHMED NASSER on 9/22/17.
//  Copyright © 2017 Nobala. All rights reserved.
//

import UIKit
import PKHUD

class MainTableViewController: UITableViewController {

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
//        
//        // DialogeCreator.alertWithTittlMessage(title: "خطأ", message: errorMessage, viewController: self)
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let view = sb.instantiateViewController(withIdentifier: "dialoge") as! MarasilDialogeViewController
//        view.messag = errorMessage
//        view.titl = "تنويه"
//        //view.color = UIColor.red
//        DialogeCreator.viewControllerDialoge(view: self, contenView: view, height: 200)
//    }
//    func success(message: String) {
//        //DialogeCreator.alertWithTittlMessage(title: "تم", message: message, viewController: self)
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let view = sb.instantiateViewController(withIdentifier: "dialoge") as! MarasilDialogeViewController
//        view.messag = message
//        view.titl = "تم"
//        DialogeCreator.viewControllerDialoge(view: self, contenView: view, height: 200)
//    }
   
}
