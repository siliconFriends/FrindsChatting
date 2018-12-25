//
//  MainViewController.swift
//  Friends
//
//  Created by Ahmed Nasser on 10/20/18.
//  Copyright © 2018 Ahmed Nasser. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class MainViewController: BaseViewController {

    @IBOutlet weak var facebookLoginButton: UIButton!
    @IBOutlet weak var label: UILabel!
    var presenter = MainPresenter(registerSerives: RegisterServices())

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.attachView(self)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func facebookLogin(_ sender: Any) {
        presenter.FaceBookAuthLogin()
     
    }
    
}

