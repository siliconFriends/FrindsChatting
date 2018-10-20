//
//  AppUtils.swift
//  Health
//
//  Created by Ahmed on 5/30/17.
//  Copyright © 2017 Health. All rights reserved.
//

import Foundation
import KeychainAccess
import MapKit
class AppUtils {

    static let userDefaults = UserDefaults.standard
    static func getTimeZone () -> String {
        if let timeZone = TimeZone.current.abbreviation() {
            let index  = timeZone.index(timeZone.startIndex, offsetBy: 3)
            return timeZone.substring(from: index) + "00"
        }
        return "+2"
    }
    
    //GET DEVICE ID
    static func getDeviceId() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
    static func saveToken(token :String?){
        let keychain = Keychain(service: "App")
        keychain["token"] = token
    }
    static func validateNumber(value: String) -> Bool {
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
    
    static func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    static func formatDate(from:String,format:String,zone:String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        dateFormatter.timeZone = TimeZone(abbreviation: zone) //Current time zone
        return dateFormatter.date(from:from) //according to date format your date string
        //datde = datde?.addingTimeInterval(3*60*60)
        
    }
//
//    //CHECK USER TYPE
//    public static func isUser() ->Bool{
//        return getUser().userType == "2"
//
//    }
    // GET TIME ZONE
   
    
    //SAVE JourneyId

    
    //        static func getToken() ->String {
    //            let keychain = Keychain(service: "App")
    //            if let token = keychain["token"] {
    //                print(token)
    //                return token
    //            }
    //            return ""
    //    }
    
    //SAVE USER
//    static func saveUser(user :User){
//        var arr = [User]()
//        arr.append(user)
//        let encodedData = NSKeyedArchiver.archivedData(withRootObject: arr)
//        userDefaults.set(encodedData, forKey: "user")
//        userDefaults.synchronize()
//    }
//    static func getUser() -> User {
//        if let data = UserDefaults.standard.data(forKey: "user"),
//            let customerArr = NSKeyedUnarchiver.unarchiveObject(with: data) as? [User] {
//            return customerArr[0]
//        } else {
//            print("There is an issue")
//        }
//        return User()
//
//    }
//
//    //SAVE Info
//    static func saveInfo(user :Info){
//        var arr = [Info]()
//        arr.append(user)
//        let encodedData = NSKeyedArchiver.archivedData(withRootObject: arr)
//        userDefaults.set(encodedData, forKey: "info")
//        userDefaults.synchronize()
//    }
//    static func getInfo() -> Info {
//        if let data = UserDefaults.standard.data(forKey: "info"),
//            let customerArr = NSKeyedUnarchiver.unarchiveObject(with: data) as? [Info] {
//            return customerArr[0]
//        } else {
//            print("There is an issue")
//        }
//        return Info()
//
//    }
    
    //utlity
    // number validation
//    //location data
//    //get locationdata
//    static func getLocationData (location :CLLocation,completion :@escaping ( _ response :String)->Void) {
//        // Add below code to get address for touch coordinates.
//        let geoCoder = CLGeocoder()
//
//        geoCoder.reverseGeocodeLocation(location, completionHandler: { (placemarks, error) -> Void in
//
//            // Place details
//            var placeMark: CLPlacemark!
//            placeMark = placemarks?[0]
//            // Address dictionary
//            print(placeMark.addressDictionary as Any)
//
//            // Location name
//            if let locationName = placeMark.addressDictionary!["Name"] as? NSString {
//                completion(locationName as String)
//            }
//            // Street address
//            if let street = placeMark.addressDictionary!["Thoroughfare"] as? NSString {
//                print(street)
//
//            }
//            // City
//            if let city = placeMark.addressDictionary!["City"] as? NSString {
//                print(city)
//            }
//            // Zip code
//            if let zip = placeMark.addressDictionary!["ZIP"] as? NSString {
//                print(zip)
//            }
//            // Country
//            if let country = placeMark.addressDictionary!["Country"] as? NSString {
//                print(country)
//            }
//
//        })
//    }
    //format date
}
