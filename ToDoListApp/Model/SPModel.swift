//
//  SPModel.swift
//  ToDoListApp
//
//  Created by popovychs on 28.04.16.
//  Copyright © 2016 popovychs. All rights reserved.
//

import Foundation

class SPModel: NSObject, NSCoding {
    
    //MARK: - Class constants
    
    static let Dir = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    
    static let archiveURL = Dir.URLByAppendingPathComponent("items")
    
    //MARK: -  Instance properties
    
    var itemName : String
    
    init?(name: String){
        
        self.itemName = name
        super.init()
    }
    
    //MARK: -  Persist Data
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(itemName, forKey: "name")
    }
    
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey("name") as! String
        self.init(name: name)
        
    }
    
}