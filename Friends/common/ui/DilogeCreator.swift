//
//  DilogeCreator.swift
//  Health
//
//  Created by Ahmed on 5/20/17.
//  Copyright © 2017 Health. All rights reserved.
//

import Foundation
import UIKit
class DialogeCreator {
    /*
     -------------------
     Regular alert message
     -------------------
     */
//    static func alertWithTittlMessage(title: String! , message: String , viewController : UIViewController){
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let view = sb.instantiateViewController(withIdentifier: "dialoge") as! MarasilDialogeViewController
//        view.messag = message
//        view.titl = title
//        DialogeCreator.viewControllerDialoge(view: viewController, contenView: view, height: 200)
//
//    }
//    /*
//     -------------------
//     action alert message
//     -------------------
//     */
//    static func alertLogout(title: String! , message: String ,viewController : UIViewController,action :@escaping ()->Void ){
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let view = sb.instantiateViewController(withIdentifier: "logout") as! LogoutDialogeViewController
//        view.action = action
//        view.text = message
//        DialogeCreator.viewControllerDialoge(view: viewController, contenView: view, height: 200)
//
//    }
//    /*
//     -------------------
//     one action alert message
//     -------------------
//     */
//    static func alertWithOneAction(title: String! , message: String ,viewController : UIViewController,actionTitle :String ,action :@escaping ()->Void ){
//
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        let view = sb.instantiateViewController(withIdentifier: "dialoge") as! MarasilDialogeViewController
//        view.messag = message
//        view.titl = title
//        view.action = action
//        DialogeCreator.viewControllerDialoge(view: viewController, contenView: view, height: 200)
//
//    }
//    /*
//     -------------------
//     one action alert message
//     -------------------
//     */
//    static func alertWithTwoActions(title: String! , message: String ,viewController : UIViewController,actionTitle :String ,action :@escaping ()->Void, action2Title :String ,action2 :@escaping ()->Void){
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let action = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default,handler: {_ in
//            action()
//            alert.dismiss(animated: true, completion: nil)
//        });
//        let action2 = UIAlertAction(title: action2Title, style: UIAlertActionStyle.default,handler: {_ in
//            action2()
//            alert.dismiss(animated: true, completion: nil)
//        });
//        alert.addAction(action2)
//        alert.addAction(action)
//
//        viewController.present(alert, animated: true, completion:nil)
//        
//    }
//    /*
//     -------------------
//     one and cancelaction alert message
//     -------------------
//     */
//    static func alertWithOneCancelAction(title: String! , message: String ,viewController : UIViewController,actionTitle :String ,action :@escaping ()->Void ){
//        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let cancel = UIAlertAction(title: "الغاء", style: UIAlertActionStyle.cancel,handler: nil);
//
//        let action = UIAlertAction(title: actionTitle, style: UIAlertActionStyle.default,handler: {_ in
//            action()
//            alert.dismiss(animated: true, completion: nil)
//        });
//        alert.addAction(cancel)
//
//        alert.addAction(action)
//        viewController.present(alert, animated: true, completion:nil)
//        
//    }
       /*
     -------------------
     choose image dialoge
     -------------------
     */
    static func chooseImage (imagePicker :UIImagePickerController, viewController :UIViewController){
        let alertController = UIAlertController(title: "Choose photos from", message: "", preferredStyle: .actionSheet)
        
        let defaultAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        viewController.present(alertController, animated: true, completion: nil)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
            action in
            imagePicker.sourceType = .camera
            //AppUtils.main?.push(viewController: imagePicker)
})
        
        let photoAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
            action in
            imagePicker.sourceType = .photoLibrary
            
           // AppUtils.main?.push(viewController: imagePicker)
        }
           // viewController.present(imagePicker, animated: true, completion: nil)}
        
        )
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoAction)
        alertController.addAction(defaultAction)
    }
    /*
     -------------------
     choose image dialoge
     -------------------
     */
    static func chooseNormalImage (imagePicker :UIImagePickerController, viewController :UIViewController){
        let alertController = UIAlertController(title: "Choose photos from", message: "", preferredStyle: .actionSheet)
        
        let defaultAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        
        viewController.present(alertController, animated: true, completion: nil)
        
        let cameraAction = UIAlertAction(title: "Camera", style: .default, handler: {
            action in
            imagePicker.sourceType = .camera
            viewController.present(imagePicker, animated: true, completion: nil)})
        
        let photoAction = UIAlertAction(title: "Photo Library", style: .default, handler: {
            action in
            imagePicker.sourceType = .photoLibrary
            viewController.present(imagePicker, animated: true, completion: nil)})
        
        alertController.addAction(cameraAction)
        alertController.addAction(photoAction)
        alertController.addAction(defaultAction)
    }

    /*
     -------------------
     view controller dialoge
     -------------------
     */
    static func viewControllerDialoge(view :UIViewController,contenView :UIViewController,height :Int) {
        
        let alertController = UIAlertController(title: "\n\n\n\n\n\n", message: nil, preferredStyle:.alert)
        
    
        
        alertController.addChildViewController(contenView)
        alertController.view.addSubview((contenView.view)!)
        
        
        let height:NSLayoutConstraint = NSLayoutConstraint(item: alertController.view, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: CGFloat(height))
        alertController.view.addConstraint(height)
        
        
        DispatchQueue.main.async {
            
            view.present(alertController, animated: true, completion:nil)
            
        }
    }

    
}
