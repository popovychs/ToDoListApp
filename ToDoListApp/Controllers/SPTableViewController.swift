//
//  SPTableViewController.swift
//  ToDoListApp
//
//  Created by popovychs on 28.04.16.
//  Copyright © 2016 popovychs. All rights reserved.
//

import UIKit

class SPTableViewController: UITableViewController {
    
    //var item : SPModel?
    
    var items = [SPModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = editButtonItem()
        
    }
 
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! SPTableViewCell
        
        let item = items[indexPath.row]
        
        cell.cellLabel.text = item.itemName
        
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "ShowDetail" {
            let detailVC = segue.destinationViewController as! SPDetailViewController
            
            // Det the cell that generated this segue
            if let selectedCell = sender as? SPTableViewCell {
            let indexPath = tableView.indexPathForCell(selectedCell)!
                let selectedItem = items[indexPath.row]
                detailVC.item = selectedItem
            }
        } else if segue.identifier == "addItem" {
            
        }
    }
    
    @IBAction func unwindToList(sender: UIStoryboardSegue) {
        
        let scrViewCon = sender.sourceViewController as? SPDetailViewController
        let item = scrViewCon?.item
        
        if scrViewCon != nil && item?.itemName != "" {
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existingitem
                items[selectedIndexPath.row] = item!
                tableView.reloadRowsAtIndexPaths([selectedIndexPath], withRowAnimation: .None)
            } else {
                // Add new item
                let newIndexPath = NSIndexPath(forRow: items.count, inSection: 0)
                items.append(item!)
                tableView.insertRowsAtIndexPaths([newIndexPath], withRowAnimation: .Bottom)
            }
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            items.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        } else if editingStyle == .Insert {
            
        }

    }
    
}