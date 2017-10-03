//
//  Card.swift
//  PayeeDB
//
//  Created by Lynn on 10/1/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import Foundation

struct Card {
    private(set) static var items:[Content] = []
    
    static func add(Item item:Content) {
        if Card.items.count == 0{
            items.append(item)
        }
    }
    
    static func remove(Item item:Content){
        items.removeAll()
    }
}
