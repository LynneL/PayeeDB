//
//  StorageManager.swift
//  PayeeDB
//
//  Created by Lynn on 10/1/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import Foundation

struct StorageManager {
    
    private(set) static var items:[Payees] = [Payees(name: "Starbucks", amount: "$20,000", transaction: "32"),
                                              Payees(name: "Sam's Cleaners", amount: "$30,000", transaction: "16"),
                                              Payees(name: "Office Supplies", amount: "$10,400", transaction: "3"),
                                              Payees(name: "Blue Shield", amount: "$207,000", transaction: "32"),
                                              Payees(name: "Safeway", amount: "$30,000", transaction: "16"),
                                              Payees(name: "JetBlue", amount: "$473,400", transaction: "3"),
                                              Payees(name: "Safeway", amount: "$30,000", transaction: "16"),
                                              Payees(name: "JetBlue", amount: "$473,400", transaction: "3")]
    
    static let fakeInfo = [Payees(relatedInfo: "OFFICE DEPOT", address: "1400 Park Avenue, Emeryville, CA", name: "Josh Murray"),
                           Payees(relatedInfo: "OFFICE MAX", address: "608 Corwin St. Tillmanborough, TN", name:"Bob Harvey"),
                           Payees(relatedInfo: "THE OFFICE", address: "025 Yundt Squares, Williamsburg, VA", name: "Sasha Gordon"),
                           Payees(relatedInfo: "SAM'S OFFICE CO.", address: "80 Langworth Path, Los Angeles, CA", name: "Pete Thompson")]
    
    static func add(item:Payees) {
        items.append(item)
    }
    
    static func remove(Item item:Payees){
        items.removeAll()
    }
}
