//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

      
class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        if let email = emailTextfield.text , let password =  passwordTextfield.text{
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                // ...
                if let err = error{
                    print(err.localizedDescription)
                    self.showAlert(message: err.localizedDescription)
                }else{
                    self.performSegue(withIdentifier: "registerToChat", sender: self)
                }
            }
        }
    }
    
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            // Handle OK button action
            print("OK button tapped")
        }
        
        alertController.addAction(okAction)
        
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            rootViewController.present(alertController, animated: true, completion: nil)
        }
    }
    
}
