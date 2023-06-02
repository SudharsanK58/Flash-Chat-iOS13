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
    let db =  Firestore.firestore()
    var messages: [MessageModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🍮ZusanChat🍮"
        navigationItem.hidesBackButton = true
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MessageCell", bundle: nil), forCellReuseIdentifier: "ReusableCell")
        loadMessages()
    }
    
    func loadMessages() {
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { (querySnapshot, err) in
            self.messages = []
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
                
                for document in querySnapshot!.documents {
                    let data = document.data()
                    if let messageSender = data[K.FStore.senderField] as? String,
                       let messageData = data[K.FStore.bodyField] as? String,
                       let timestamp = data[K.FStore.dateField] as? Timestamp {
                        
                        let date = timestamp.dateValue()
                        let dateString = dateFormatter.string(from: date)
                        
                        let newMessage = MessageModel(sender: messageSender, body: messageData, date: dateString)
                        self.messages.append(newMessage)
                        
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
                }
            }
        }
    }

    
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let message = messageTextfield.text , let sender = Auth.auth().currentUser?.email{
            let timestamp = Date()
            db.collection(K.FStore.collectionName).addDocument(data: [
                K.FStore.senderField: sender,
                K.FStore.bodyField: message,
                K.FStore.dateField: timestamp
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID:")
//                    self.loadMessages()
                    self.messageTextfield.text = ""
                }
            }
        }
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
        print(messages[indexPath.row].date)
        if messages[indexPath.row].sender == Auth.auth().currentUser?.email{
            cell.leftMessegerImage.isHidden = true
            cell.messagerImage.isHidden = false
            cell.messageBodyView.backgroundColor = UIColor.systemGreen
        }
        else{
            cell.leftMessegerImage.isHidden = false
            cell.messagerImage.isHidden = true
            cell.messageBodyView.backgroundColor = UIColor.systemTeal
        }
        return cell
    }
}

