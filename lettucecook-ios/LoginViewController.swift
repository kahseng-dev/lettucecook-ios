//
//  LoginViewController.swift
//  lettucecook-ios
//
//  Created by Mac on 10/1/22.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var loginErrorLabel: UILabel!
    
    @IBOutlet weak var loginEmailField: UITextField!
    
    @IBOutlet weak var loginPasswordField: UITextField!
    
    @IBAction func loginButton(_ sender: Any) {
        guard let email = loginEmailField.text, !email.isEmpty,
              let password = loginPasswordField.text, !password.isEmpty else {
                  showError(error: "Please fill in every field.")
                  return
              }
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email,
                                        password: password,
                                        completion: { result, error in
            if error != nil {
                self.showError(error: error!.localizedDescription)
                return
            }
            
            self.transitionToMain()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        loginErrorLabel.isHidden = true
    }
    
    func showError(error:String) {
        loginErrorLabel.text = error
        loginErrorLabel.isHidden = false
    }
    
    func transitionToMain() {
        let storyboard = UIStoryboard(name: Constants.Storyboard.main, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.Storyboard.main) as UIViewController
        vc.modalPresentationStyle = .fullScreen // try without fullscreen
        present(vc, animated: true, completion: nil)
    }
}
