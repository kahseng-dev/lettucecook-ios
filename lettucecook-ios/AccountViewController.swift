//
//  AccountViewController.swift
//  lettucecook-ios
//
//  Created by Mac on 11/1/22.
//

import UIKit
import FirebaseAuth

class AccountViewController : UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            logoutButton.isEnabled = false
        }
        catch {
            print("An error occurred, cannot sign out.")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            logoutButton.isEnabled = true
        }
        
        else {
            logoutButton.isEnabled = false
        }
    }
}
