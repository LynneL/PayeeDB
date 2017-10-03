//
//  Payees.swift
//  PayeeDB
//
//  Created by Lynn on 9/30/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import Foundation
struct Payees {
    let name:String
    let amount:String
    let transaction:String
    
    init(name:String, amount:String, transaction:String) {
        self.name = name
        self.amount = amount
        self.transaction = transaction
    }
}
