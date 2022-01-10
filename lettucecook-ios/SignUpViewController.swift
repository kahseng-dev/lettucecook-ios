//
//  SignUpViewController.swift
//  lettucecook-ios
//
//  Created by Mac on 10/1/22.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpUsernameField: UITextField!
    
    @IBOutlet weak var signUpEmailField: UITextField!
    
    @IBOutlet weak var signUpPasswordField: UITextField!
    
    @IBOutlet weak var signUpConfirmPasswordField: UITextField!
    
    @IBAction func signUpButton(_ sender: Any) {
        
        let username = signUpUsernameField.text!
        let email = signUpEmailField.text!
        let password = signUpPasswordField.text!
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email,
                                            password: password,
                                            completion: {[weak self] result, error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                return
            }
            
            strongSelf.transitionToMain()
        })
        
        
        // TODO: Implement sign up confirm password
        // TODO: Bug Register button does not move up for text input and click on small screens
    }
    
    func transitionToMain() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Main") as UIViewController
        vc.modalPresentationStyle = .fullScreen // try without fullscreen
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
