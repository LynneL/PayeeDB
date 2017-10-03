//
//  Content.swift
//  PayeeDB
//
//  Created by Lynn on 10/1/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import Foundation

struct Content {
    let relatedInfo:String
    let address:String
    let name:String
    var payment:String = "ACH"
    var phone:String = "(415 834-1987)"
    var taxID:String = "xxx-xxxx-xxx"
    var zip:String = "94608"
    
    init(relatedInfo:String, address:String, name:String) {
        self.relatedInfo = relatedInfo
        self.address = address
        self.name = name
    }
}
