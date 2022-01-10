//
//  SignUpViewController.swift
//  lettucecook-ios
//
//  Created by Mac on 10/1/22.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var signUpUsernameField: UITextField!
    
    @IBOutlet weak var signUpEmailField: UITextField!
    
    @IBOutlet weak var signUpPasswordField: UITextField!
    
    @IBOutlet weak var signUpConfirmPasswordField: UITextField!
    
    @IBAction func createAccountButton(_ sender: Any) {
        print("Test")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
