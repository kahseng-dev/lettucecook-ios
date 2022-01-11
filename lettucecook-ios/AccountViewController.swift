//
//  AccountViewController.swift
//  lettucecook-ios
//
//  Created by Mac on 11/1/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class AccountViewController : UIViewController {
    
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBAction func logoutButton(_ sender: Any) {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            logoutButton.isEnabled = false
            title = "Hello"
        }
        catch {
            // An error occurred, cannot sign out.
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let user = FirebaseAuth.Auth.auth().currentUser
        
        if user != nil {
            logoutButton.isEnabled = true
            
            displayUsername(userID: user!.uid)
        }
        
        else {
            logoutButton.isEnabled = false
        }
    }
    
    func displayUsername(userID:String) {
        let ref = Database.database(url: Constants.Firebase.databaseURL).reference()
        ref.child("users/\(userID)/username").getData(completion: { error, snapshot in
            
            if error != nil {
                return
            }
            
            let username = snapshot.value as? String ?? "Unknown"
            self.title = "Hello \(username)!"
        })
    }
}
