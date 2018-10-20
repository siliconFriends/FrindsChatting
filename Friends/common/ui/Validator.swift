//
//  Validator.swift
//  Health
//
//  Created by Ahmed on 5/20/17.
//  Copyright © 2017 Health. All rights reserved.
//

import Foundation
class Validator {
    //functio to validate email address
    static func validateEmail(enteredEmail:String) -> Bool {
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)
        
    }
    //functio to validate email address
    static func validatePassword(password:String) -> Bool {
        return password.characters.count >= 6
        
    }
    static func validateNumber(value: String) -> Bool {
        if value == ""  {
            return false
        }
       
        var digitsAndDots = NSMutableCharacterSet.decimalDigits
        digitsAndDots.insert(charactersIn: ".")
        let notDigitsNorDots = digitsAndDots.inverted
        if (value.rangeOfCharacter(from: notDigitsNorDots) == nil)  {
            //NUMBER
            return true
        }else{
            return false
        }
    }
    static func validatePhoneNumber(value: String) -> Bool {
        if value == "" || value.characters.count > 9 {
            return false
        }
        if value[0] == "0" || value [0] == "+" || value[0...2] == "966"{
            return false
        }
        var digitsAndDots = NSMutableCharacterSet.decimalDigits
        digitsAndDots.insert(charactersIn: ".")
        let notDigitsNorDots = digitsAndDots.inverted
        if (value.rangeOfCharacter(from: notDigitsNorDots) == nil)  {
            //NUMBER
            return true
        }else{
            return false
        }
    }
}
extension String {
    subscript (i: Int) -> Character {
        return self[self.characters.index(self.startIndex, offsetBy: i)]
    }
    
    subscript (i: Int) -> String {
        return String(self[i] as Character)
    }
    
    subscript (r: Range<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start..<end])
    }
    
    subscript (r: ClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: r.lowerBound)
        let end = index(startIndex, offsetBy: r.upperBound)
        return String(self[start...end])
    }
}
