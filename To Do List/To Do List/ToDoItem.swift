//
//  ToDoItem.swift
//  To Do List
//
//  Created by Randhir Kumar on 2/21/16.
//  Copyright © 2016 @Randhir Kumar. All rights reserved.
//

import UIKit

class ToDoItem: NSObject, NSCoding {
    
    // A text description of this item.
    var text: String
    
    // A Boolean value that determines the completed state of this item.
    var completed: Bool
    
    // Returns a ToDoItem initialized with the given text and default completed value.
    init(text: String) {
        self.text = text
        self.completed = false
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let text = aDecoder.decodeObjectForKey("text") as! String
        self.init(text: text)

    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "text")
        aCoder.encodeObject(completed, forKey: "completed")
    }


}
