//
//  RegisterationViewController.swift
//  Friends
//
//  Created by Ahmed Nasser on 10/21/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import UIKit

class RegisterationViewController: BaseViewController {

    @IBOutlet weak var codeImage: UIImageView!
    @IBOutlet weak var passImage: UIImageView!
    @IBOutlet weak var locImage: UIImageView!
    @IBOutlet weak var phoneImage: UIImageView!
    @IBOutlet weak var countryTextField: FriendsTextField!
    @IBOutlet weak var phoneTextField: FriendsTextField!
    @IBOutlet weak var sendPhoneButton: FriendsButton!
    @IBOutlet weak var passTextField: FriendsTextField!
    @IBOutlet weak var codeTextField: FriendsTextField!
    @IBOutlet weak var loginButton: FriendsButton!
    @IBOutlet weak var CountryLabel: FriendsLabel!
    let countryPicker = UIPickerView()
    var presenter = RegisterationPresenter(registerSerives: RegisterServices())
    var countries = [Country]()
    var selectedCountry :Country? {
        didSet{
            CountryLabel.txt = ((LanguageHandler.sharedInstance.currentLanguage == .ARABIC) ? selectedCountry?.countryArName :selectedCountry?.countryEnName) ?? ""
        }
    }
    var selectedMobileNumber  = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attachView(self)
        presenter.getCountries()
    }
    func initViews () {
        ViewUtils.roundImage(image: codeImage)
        ViewUtils.roundImage(image: passImage)
        ViewUtils.roundImage(image: locImage)
        ViewUtils.roundImage(image: phoneImage)
        ViewUtils.roundImage(image: sendPhoneButton)
        loginButton.layer.cornerRadius = 10
        countryTextField.inputView = countryPicker
        countryPicker.delegate = self
        countryPicker.dataSource = self
        countryPicker.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    // Mark : Actions
    @IBAction func registerAction(_ sender: Any) {
        if checkEmpty(text: phoneTextField.text){
            self.showError(errorMessage: String(format: "emptyField".localize, "phone".localize))
            return
        }
        if checkEmpty(text: CountryLabel.text){
            self.showError(errorMessage: String(format: "emptyField".localize, "country".localize))
            return
        }
        if checkEmpty(text: passTextField.text){
            self.showError(errorMessage: String(format: "emptyField".localize, "password".localize))
            return
        }
        if checkEmpty(text: codeTextField.text){
            self.showError(errorMessage: String(format: "emptyField".localize, "code".localize))
            return
        }
        if !Validator.validateNumber(value: phoneTextField.text!) || phoneTextField.text! != selectedMobileNumber  {
            self.showError(errorMessage: String(format: "notValid".localize, "phone".localize))
        }else{
            presenter.register(code: codeTextField.text!, mobileNumber: selectedMobileNumber, country: "\(selectedCountry?.id ?? 0)", userName: "", birthDate: "", gender: "", password: passTextField.text!)
        }
    }
    @IBAction func sendAction(_ sender: Any) {
        if checkEmpty(text: phoneTextField.text){
            self.showError(errorMessage: String(format: "emptyField".localize, "phone".localize))
            return
        }
        if Validator.validateNumber(value: phoneTextField.text!) {
            presenter.checkPhoneinUse(phone: "\(selectedCountry?.phoneCode ?? "")\(phoneTextField.text!)")
        }else{
            self.showError(errorMessage: String(format: "notValid".localize, "phone".localize))
        }
    }
}
extension RegisterationViewController :UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countries.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if LanguageHandler.sharedInstance.currentLanguage == .ARABIC {
            return countries[row].countryArName
        }
        return countries[row].countryEnName
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCountry = countries[row]
    }
    
}
// Mark : Network
extension RegisterationViewController:RegisterView {
    func showCountries(countries: [Country]) {
        self.countries = countries
        self.selectedCountry = countries[0]
        countryPicker.reloadAllComponents()
    }
    func phoneSent(mobileNumber: String) {
        self.selectedMobileNumber = mobileNumber
    }
    func userRegisterd(user: UserModel) {
        
    }
}
