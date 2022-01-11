//
//  SignUpViewController.swift
//  lettucecook-ios
//
//  Created by Mac on 10/1/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var signUpErrorLabel: UILabel!
    
    @IBOutlet weak var signUpUsernameField: UITextField!
    
    @IBOutlet weak var signUpEmailField: UITextField!
    
    @IBOutlet weak var signUpPasswordField: UITextField!
    
    @IBAction func signUpButton(_ sender: Any) {
        
        guard let username = signUpUsernameField.text, !username.isEmpty,
              let email = signUpEmailField.text, !email.isEmpty,
              let password = signUpPasswordField.text, !password.isEmpty else {
                  showError(error: "Please fill in every field.")
                  return
              }
        
        FirebaseAuth.Auth.auth().createUser(withEmail: email,
                                            password: password,
                                            completion: { result, error in
            
            if error != nil {
                self.showError(error: error!.localizedDescription)
                return
            }
            
            self.saveUser(userID: result!.user.uid, username: username, email: email)
            self.transitionToMain()
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        signUpErrorLabel.isHidden = true
    }
    
    func saveUser(userID:String, username:String, email:String) {
        let ref = Database.database(url:Constants.Firebase.databaseURL).reference()
        ref.child("users/\(userID)").setValue(["username": username, "email": email])
    }
    
    func showError(error:String) {
        signUpErrorLabel.text = error
        signUpErrorLabel.isHidden = false
    }
    
    func transitionToMain() {
        let storyboard = UIStoryboard(name: Constants.Storyboard.main, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: Constants.Storyboard.main) as UIViewController
        vc.modalPresentationStyle = .fullScreen // try without fullscreen
        present(vc, animated: true, completion: nil)
    }
}
