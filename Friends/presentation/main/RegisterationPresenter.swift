//
//  RegisterationPresenter.swift
//  Friends
//
//  Created by Ahmed Nasser on 12/24/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import Foundation
protocol RegisterView:mainView {
    func showCountries(countries:[Country])
    func phoneSent(mobileNumber :String)
    func userRegisterd(user :UserModel)
}
class RegisterationPresenter :BasePresenter {
    fileprivate let registerService:RegisterServices
    weak fileprivate var registerView : RegisterView?

    init(registerSerives:RegisterServices) {
        self.registerService = registerSerives
    }
    func attachView(_ registerView:RegisterView) {
        self.registerView = registerView
    }
    func detachView() {
        self.registerView = nil
    }
    func getCountries() {
        registerView?.startLoading()
        registerService.getCountries { (countries) in
            self.registerView?.finishLoading()
            self.registerView?.showCountries(countries: countries)
        }
    }
    func checkPhoneinUse(phone:String) {
        registerView?.startLoading()
        registerService.getMobileInUse(mobileNumber: phone, completion: { (inUse)  in
            if inUse {
                self.registerView?.error(error: "phoneInUse".localize)
            }else{
                self.registerView?.finishLoading()
                self.sendVerificationCode(phone: phone)
            }
        }){ (error)  in
            self.registerView?.finishLoading()
            self.registerView?.error(error: error)
        }
    }
    fileprivate func sendVerificationCode(phone:String) {
        registerView?.startLoading()
        registerService.sendVerficationCode(mobileNumber: phone,completion:  { (sent) in
            self.registerView?.finishLoading()
            if sent {
                self.registerView?.success(message: "message")
            }else{
                self.registerView?.error(error: "Ops!".localize)
            }
        }){ (error)  in
            self.registerView?.finishLoading()
            self.registerView?.error(error: error)
            
        }
    }
    func validateVerficationCode(code:String,phone:String,completion:@escaping (_ valid:Bool)->()) {
        registerView?.startLoading()
        registerService.validateVerficationCode(mobileNumber: phone, code: code,completion: { (valid) in
            if valid {
                completion(valid)
            }else{
                self.registerView?.finishLoading()
                self.registerView?.error(error: String(format: "notValid".localize, "code".localize))
            }
        }){ (error)  in
            self.registerView?.finishLoading()
            self.registerView?.error(error: error)
        }
    }
    func register(code :String,mobileNumber :String,country :String,userName :String,birthDate :String,gender :String,password :String) {
        registerView?.startLoading()
        self.validateVerficationCode(code: code, phone: mobileNumber) { (valid) in
            self.registerService.register(mobileNumber: mobileNumber, country: country, userName: userName, birthDate: birthDate, gender: gender, password: password, completion: { (user) in
                self.registerView?.finishLoading()
                self.registerView?.userRegisterd(user: user)
            }){ (error)  in
                self.registerView?.finishLoading()
                self.registerView?.error(error: error)
            }
        }
    }
    
}
