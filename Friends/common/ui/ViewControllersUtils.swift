//
//  ViewControllersUtils.swift
//  Setio
//
//  Created by Ahmed on 5/16/17.
//  Copyright © 2017 Fekra. All rights reserved.
//

import Foundation
import UIKit
class ViewControllersUtils {
    //--------- PARENT HOME CONTROLLERS ---------
     public static func navigateToParent(){
        let storyboard = UIStoryboard(name: "Parent", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "home_main") as UIViewController
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = controller
    }
    
    //--------- SITTER HOME CONTROLLERS ---------

     public static func navigateToSitter(){
        let storyboard = UIStoryboard(name: "Sitter", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "home_main") as UIViewController
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = controller
    }
    
    //--------- Round image ---------
    
     public static func roundImage(image :UIView){
        image.layer.borderWidth = 0
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    // ---------  show user image ---------
    static func showUserImage (image :UIImageView ,id :String){
        let imageurl = "http://setioapi.fekracomputers.com/files/users/\(id).png"
        print(imageurl)
        let url = URL(string: imageurl)
     //   image.kf.setImage(with: url)
    }
    // ---------  show alert View controller  ---------
     static func showAlertViewController(toView :UIViewController ,controller:UIViewController ) {
        let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle: UIAlertControllerStyle.actionSheet)
    
        alertController.addChildViewController(controller)
        alertController.view.addSubview((controller.view)!)
        
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 150)
        alertController.view.addConstraint(height);
        
        DispatchQueue.main.async {
            
            toView.present(alertController, animated: true, completion:nil)
            
            
        }
    }
    
}
