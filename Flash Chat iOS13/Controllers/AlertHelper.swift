//
//  AlertHelper.swift
//  Flash Chat iOS13
//
//  Created by Sudharsan on 31/05/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

import UIKit

class AlertHelper {
    static func showAlert(message: String, completion: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            // Call the completion closure if provided
            completion?()
        }
        
        alertController.addAction(okAction)
        
        if let rootViewController = UIApplication.shared.windows.first?.rootViewController {
            rootViewController.present(alertController, animated: true, completion: nil)
        }
    }
}

