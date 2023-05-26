//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "⚡️ZusanChat"
        animateTitleLabel()
    }
    
    private func animateTitleLabel() {
        titleLabel.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        titleLabel.alpha = 0.0
        
        UIView.animate(withDuration: 3.0, delay: 0.0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseInOut, animations: {
            self.titleLabel.transform = CGAffineTransform.identity
            self.titleLabel.alpha = 1.0
        }, completion: nil)
    }
}

