//
//  RegisterationViewController.swift
//  Friends
//
//  Created by Ahmed Nasser on 10/21/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import UIKit

class RegisterationViewController: UIViewController {

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
    let countryPicker = UIPickerView()
    override func viewDidLoad() {
        super.viewDidLoad()
        ViewUtils.roundImage(image: codeImage)
        ViewUtils.roundImage(image: passImage)
        ViewUtils.roundImage(image: locImage)
        ViewUtils.roundImage(image: phoneImage)
        ViewUtils.roundImage(image: sendPhoneButton)
        loginButton.layer.cornerRadius = 10

        countryTextField.inputView = countryPicker
        countryPicker.delegate = self
        countryPicker.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func loginAction(_ sender: Any) {
    }
    @IBAction func sendAction(_ sender: Any) {
    }
    
}
extension RegisterationViewController :UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    
}
