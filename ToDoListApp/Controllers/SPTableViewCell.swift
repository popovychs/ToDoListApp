//
//  SPTableViewCell.swift
//  ToDoListApp
//
//  Created by popovychs on 28.04.16.
//  Copyright © 2016 popovychs. All rights reserved.
//

import UIKit

class SPTableViewCell: UITableViewCell {

    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet var saveButton: UIButton!
    
    override func awakeFromNib() {
        
        saveButton.layer.cornerRadius = 5
    }
    
}