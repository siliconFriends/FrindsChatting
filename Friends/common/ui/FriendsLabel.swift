//
//  FriendsLabel.swift
//  Friends
//
//  Created by Ahmed Nasser on 10/20/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
import UIKit
class FriendsLabel :UILabel {
    @IBInspectable var txt :String = "" {
        didSet{
            self.text = LanguageHandler.sharedInstance.stringForKey(key: txt)
            if LanguageHandler.sharedInstance.currentLanguage == .ARABIC {
                self.font = UIFont(name: "GESSTwoBold-Bold", size: (self.font?.pointSize)!)
            }
        }
    }
}
