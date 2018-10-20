//
//  FriendsTextField.swift
//  Friends
//
//  Created by Ahmed Nasser on 10/21/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import UIKit

class FriendsTextField: UITextField {
    @IBInspectable var placeholderTxt :String = "" {
        didSet{
            self.attributedPlaceholder = NSAttributedString(string: LanguageHandler.sharedInstance.stringForKey(key: placeholderTxt), attributes: [NSAttributedStringKey.foregroundColor :#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            if LanguageHandler.sharedInstance.currentLanguage == .ARABIC {
                self.font = UIFont(name: "GESSTwoBold-Bold", size: (self.font?.pointSize)!)
            }

        }
    }

}
