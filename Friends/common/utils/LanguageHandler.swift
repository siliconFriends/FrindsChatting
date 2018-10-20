//
//  LanguageHandler.swift
//  Friends
//
//  Created by Ahmed Nasser on 10/20/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
import UIKit
enum LanguageType :Int {
    case ENGLISH = 0
    case ARABIC = 1
}
enum DirectionType :Int {
    case LTR = 0
    case RTL = 1
}
class LanguageHandler :NSObject {
    static var sharedInstance = LanguageHandler()
    var currentBundle :Bundle?
    var currentLanguage :LanguageType = .ARABIC {
        didSet {
            if oldValue != currentLanguage || currentBundle == nil {
                let sharedDefaults = UserDefaults(suiteName: Constans.LanguageSuite)
                sharedDefaults?.set(currentLanguage.rawValue, forKey: Constans.CurrentLanguage)
                sharedDefaults?.synchronize()
                self.adjustBundle()
            }
        }
    }
    var currentDirection : DirectionType?{
        didSet{
            let sharedDefaults = UserDefaults(suiteName: Constans.LanguageSuite)
            sharedDefaults?.set(currentDirection?.rawValue, forKey: Constans.CurrentDirection)
            sharedDefaults?.synchronize()
        }
    }
    func setDirection (direction:DirectionType ,lang:LanguageType) {
            currentDirection = direction
            currentLanguage = lang
    }
    func stringForKey(key:String) -> String{
        let result = currentBundle?.localizedString(forKey: key, value: key, table: nil)
        return result ?? key
    }
    func adjustBundle(){
        var lang = ""
        switch currentLanguage {
        case .ENGLISH:
             lang = "en"
            break
        case .ARABIC:
            lang = "Base"
            break
        }
        let bundlePath = Bundle(for: type(of: self)).path(forResource: lang, ofType: "lproj")
        currentBundle = Bundle(path: bundlePath!)
        if currentLanguage == .ARABIC {
            UIView.appearance().semanticContentAttribute = .forceLeftToRight
        }else{
            UIView.appearance().semanticContentAttribute = .forceRightToLeft
        }
    }
    func setDefaultAppSettings() {
//        let language = Locale.preferredLanguages.first
        let language = "ar"
        if language == "ar" {
            setDirection(direction: .RTL, lang: .ARABIC)
        }else{
            setDirection(direction: .LTR, lang: .ENGLISH)
        }
    }
    override init() {
        super.init()
        let sharedDefaults = UserDefaults(suiteName: Constans.LanguageSuite)
        let language = sharedDefaults?.object(forKey: Constans.CurrentLanguage)
        if language == nil {
            self.setDefaultAppSettings()
        }else{
            let direction = sharedDefaults?.object(forKey: Constans.CurrentDirection)
            self.setDirection(direction: DirectionType(rawValue: direction as! Int)!, lang: LanguageType(rawValue: language as! Int)!)
        }
    }
}
