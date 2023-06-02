//
//  MessageCell.swift
//  Flash Chat iOS13
//
//  Created by Sudharsan on 01/06/23.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageBodyText: UILabel!
    @IBOutlet weak var messageBodyView: UIView!
    @IBOutlet weak var messagerImage: UIImageView!
    @IBOutlet weak var leftMessegerImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        messageBodyView.layer.cornerRadius = 10
        // Initialization code 
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
