//
//  SPDetailViewController.swift
//  ToDoListApp
//
//  Created by popovychs on 28.04.16.
//  Copyright © 2016 popovychs. All rights reserved.
//

import UIKit

class SPDetailViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet var itemName: UILabel!
    @IBOutlet var itemTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    // MARK: - Properties
    
    var item = SPModel?()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let item = item {
            itemTextField.text = item.itemName
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if saveButton === sender {
            let name = itemTextField.text ?? ""
            item = SPModel(name: name)
        }
    }
    
    @IBAction func cancel(sender: UIBarButtonItem) {
        
        let isInAddMode = presentingViewController is UINavigationController
        
        if isInAddMode {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            navigationController!.popViewControllerAnimated(true)
        }
        
    }
    
}