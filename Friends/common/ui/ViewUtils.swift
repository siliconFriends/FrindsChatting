//
//  ViewUtils.swift
//  Health
//
//  Created by Ahmed on 5/31/17.
//  Copyright © 2017 Health. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
class ViewUtils{
    static func loadRoundImage(url :String ,imageView :UIImageView){
        imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "register_logo"))
        ViewUtils.roundImage(image: imageView)
    }
    static func loadButtonImage(url :String ,button :UIButton){
        button.sd_setBackgroundImage(with: URL(string: url), for: .normal, completed: nil)
        ViewUtils.roundImage(image: button)
    }
    static func loadImageNormal(url :String ,imageView :UIImageView){
        imageView.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "register_logo"))
    }
    static func printFonts () {
        UIFont.familyNames.forEach({ familyName in
            let fontNames = UIFont.fontNames(forFamilyName: familyName)
            print(familyName, fontNames)
        })
    }
    //--------- Round image ---------
    
    public static func roundImage(image :UIView){
        image.layer.borderWidth = 0
        image.layer.masksToBounds = false
        image.layer.cornerRadius = image.frame.height/2
        image.clipsToBounds = true
    }
    //===========  Image to base64 ===========
    static func toBase64(image :UIImage) ->String{
        //Now use image to create into NSData format
        let imageData:NSData = image.jpeg(.lowest)!
        
        
        let imageSize: Int = imageData.length
        print("size of image in KB: %f ", Double(imageSize) / 1024.0)
        return imageData.base64EncodedString(options: [])
        
    }
    //===========  current visible controller  ===========
    static func getTopController() ->UIViewController? {
        return UIApplication.shared.keyWindow?.currentViewController()
    }
    //===========  content View's sub View full screen   ===========
    static func addSubView(contentView :UIViewController,toView :UIViewController,containerView :UIView)  {
        
        toView.addChildViewController(contentView)
        contentView.view.translatesAutoresizingMaskIntoConstraints = false
        // remove sub views
        for suview in containerView.subviews{
            suview.removeFromSuperview()
        }
        containerView.addSubview((contentView.view)!)
        
        // add constraint to subview
        NSLayoutConstraint.activate([
            (contentView.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0)),
            (contentView.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 0)),
            (contentView.view.topAnchor.constraint(equalTo: containerView.topAnchor)),
            (contentView.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor))
            ])
        
        contentView.didMove(toParentViewController: toView)
    }
    
    
}
// handling image qulity
extension UIImage {
    enum JPEGQuality: CGFloat {
        case lowest  = 0
        case low     = 0.25
        case medium  = 0.5
        case high    = 0.75
        case highest = 1
    }
    
    /// Returns the data for the specified image in PNG format
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the PNG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    var png: Data? { return UIImagePNGRepresentation(self) }
    
    /// Returns the data for the specified image in JPEG format.
    /// If the image object’s underlying image data has been purged, calling this function forces that data to be reloaded into memory.
    /// - returns: A data object containing the JPEG data, or nil if there was a problem generating the data. This function may return nil if the image has no data or if the underlying CGImageRef contains data in an unsupported bitmap format.
    func jpeg(_ quality: JPEGQuality) -> NSData? {
        return UIImageJPEGRepresentation(self, quality.rawValue) as NSData?
    }
}
public extension UIWindow {
    
    /** @return Returns the current Top Most ViewController in hierarchy.   */
    public func topMostWindowController()->UIViewController? {
        
        var topController = rootViewController
        
        while let presentedController = topController?.presentedViewController {
            topController = presentedController
        }
        
        return topController
    }
    
    /** @return Returns the topViewController in stack of topMostWindowController.    */
    public func currentViewController()->UIViewController? {
        
        var currentViewController = topMostWindowController()
        
        while currentViewController != nil && currentViewController is UINavigationController && (currentViewController as! UINavigationController).topViewController != nil {
            currentViewController = (currentViewController as! UINavigationController).topViewController
        }
        
        return currentViewController
    }
}

