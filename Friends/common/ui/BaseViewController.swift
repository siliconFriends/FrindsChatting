//
//  MainViewController.swift
//  MalakiSwift
//
//  Created by AHMED NASSER on 9/19/17.
//  Copyright © 2017 Nobala. All rights reserved.
//

import UIKit
import KVNProgress
class BaseViewController: UIViewController {
    let NO_ERROR = "1" ;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.backIndicatorImage = #imageLiteral(resourceName: "back_icon")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = #imageLiteral(resourceName: "back_icon")
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func showProgress(){
        KVNProgress.show()
    }
    func hideProgress(){
        KVNProgress.dismiss()
    }
    func showError(errorMessage: String) {
        DialogeCreator.alertWithOneCancelAction(title: "Error!".localize, message: errorMessage, viewController: self)
    }
    func showSuccess(message: String) {
      DialogeCreator.alertWithOneCancelAction(title: "", message: message, viewController: self)
        
    }
    func checkEmpty(text :String?) ->Bool {
        if text != nil {
            return text  == ""
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
