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
        registerService.getMobileInUse(mobileNumber: phone) { (inUse) in
            if inUse {
                self.registerView?.error(error: "phoneInUse".localize)
            }else{
                self.registerView?.finishLoading()
                self.sendVerificationCode(phone: phone)
            }
        }
    }
    fileprivate func sendVerificationCode(phone:String) {
        registerView?.startLoading()
        registerService.sendVerficationCode(mobileNumber: phone) { (sent) in
            self.registerView?.finishLoading()
            if sent {
                self.registerView?.success(message: "message")
            }else{
                self.registerView?.error(error: "Ops!".localize)
            }
        }
    }
    func validateVerficationCode(code:String,phone:String,completion:@escaping (_ valid:Bool)->()) {
        registerView?.startLoading()
        registerService.validateVerficationCode(mobileNumber: phone, code: code) { (valid) in
            if valid {
                completion(valid)
            }else{
                self.registerView?.finishLoading()
                self.registerView?.error(error: String(format: "notValid".localize, "code".localize))
            }
        }
    }
    func register(code :String,mobileNumber :String,country :String,userName :String,birthDate :String,gender :String,password :String) {
        registerView?.startLoading()
        self.validateVerficationCode(code: code, phone: mobileNumber) { (valid) in
            self.registerService.register(mobileNumber: mobileNumber, country: country, userName: userName, birthDate: birthDate, gender: gender, password: password, completion: { (user) in
                self.registerView?.finishLoading()
                self.registerView?.userRegisterd(user: user)
            })
        }
    }
    
}
