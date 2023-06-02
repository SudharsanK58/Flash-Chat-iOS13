//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    var messages: [MessageModel] = [
        MessageModel(sender: "Zusan", body: "Hai"),
        MessageModel(sender: "Zusan", body: "Come on"),
        MessageModel(sender: "Zusan", body: "guys"),
        MessageModel(sender: "Zusan", body: "IRMessaging Remote Notifications proxy enabled, will swizzle remote notification receiver handlers. If you'd prefer to manually integrate Firebase Messaging, add FirebaseAppDelegateProxyEnabled to your Info.plist,")
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🍮ZusanChat🍮"
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
    }
    

    @IBAction func logOut(_ sender: UIBarButtonItem) {
        do {
          try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
}
extension ChatViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReusableCell", for: indexPath)
            as! MessageCell
        cell.messageBodyText.text = messages[indexPath.row].body
        return cell
    }
}
