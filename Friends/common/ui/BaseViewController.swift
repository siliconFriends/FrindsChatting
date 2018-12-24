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
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back_icon")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back_icon")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
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
    func showError(errorMessage: String) {
        //DialogeCreator.alertWithTittlMessage(title: "خطأ", message: errorMessage, viewController: self)
    }
    func showSuccess(message: String) {
        //DialogeCreator.alertWithTittlMessage(title: "تم", message: message, viewController: self)
    }
    func checkEmpty(text :String?) ->Bool {
        if text != nil {
            return text  != ""
        }
        return false 
    }
//    func navigateTo(viewController :String){
//        
//    }
}
extension BaseViewController :mainView {
    func startLoading() {
        self.showProgress()
    }
    
    func finishLoading() {
        self.hideProgress()
    }
    
    func error(error: String) {
        self.showError(errorMessage: error)
    }
    
    func success(message: String) {
        self.showSuccess(message: message)
    }

}
