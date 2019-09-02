//
//  ToDoItem.swift
//  DTimer
//
//  Created by Nino Liner on 02.09.19.
//  Copyright © 2019 Nino Liner. All rights reserved.
//

import Foundation

class ToDoItem {
    var name: String
    
    public init(title: String)
    {
        self.name = title
    }
    

}

extension ToDoItem
{
    public class func getAllItems() -> [ToDoItem] {
        
        return [
            ToDoItem(title: "chocolate"),
            ToDoItem(title: "chewing gum"),
            ToDoItem(title: "Haribo")
        ]
        
    }
}
