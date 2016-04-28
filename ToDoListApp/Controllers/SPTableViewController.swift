//
//  SPTableViewController.swift
//  ToDoListApp
//
//  Created by popovychs on 28.04.16.
//  Copyright © 2016 popovychs. All rights reserved.
//

import UIKit

class SPTableViewController: UITableViewController {
    
    var items = [SPModel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "- = ToDo List = -"
        
    }
 
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
}