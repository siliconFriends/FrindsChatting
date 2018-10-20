//
//  FriendsButton.swift
//  Friends
//
//  Created by Ahmed Nasser on 10/21/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import UIKit

class FriendsButton: UIButton {
    @IBInspectable var txt :String = "" {
        didSet{
            setTitle(LanguageHandler.sharedInstance.stringForKey(key: txt), for: .normal)
            if LanguageHandler.sharedInstance.currentLanguage == .ARABIC {
                self.titleLabel?.font = UIFont(name: "GESSTwoBold-Bold", size: (self.titleLabel?.font.pointSize)!)!
            }
        }
    }
}
