//
//  LoginViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        if let email = emailTextfield.text , let password = passwordTextfield.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                guard self != nil else { return }
                // ...
                if let err = error{
                    print(err.localizedDescription)
                    AlertHelper.showAlert(message: err.localizedDescription){
                        print("OK button tapped on login screen")
                    }
                }else{
                    self!.performSegue(withIdentifier: "loginToChat", sender: self)
                }
            }
        }
    }
    
}
