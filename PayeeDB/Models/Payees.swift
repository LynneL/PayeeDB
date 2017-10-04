//
//  Payees.swift
//  PayeeDB
//
//  Created by Lynn on 9/30/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import Foundation

class Payees:NSObject {
    let companyName:String
    var amount:String = "$0"
    var transaction:String = "0"
    var contactName:String = ""
    var address:String = "1400 Park Avenue, Emeryville, CA"
    var payment:String = "ACH"
    var phone:String = "(415)834-1987"
    var taxID:String = "xxx-xxxx-xxx"
    var zip:String = "94608"
    
    init(name:String, amount:String, transaction:String) {
        self.companyName = name
        self.amount = amount
        self.transaction = transaction
        super.init()
    }
    
    init(relatedInfo:String,address:String, name:String) {
        self.companyName = relatedInfo
        self.address = address
        self.contactName = name
        super.init()
    }
    
    init(company:String,contact:String,phone:String,zip:String) {
        self.companyName = company
        self.contactName = contact
        self.phone = phone
        self.zip = zip
        super.init()
    }
}
