//
//  PayeeCell.swift
//  PayeeDB
//
//  Created by Lynn on 9/30/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class PayeeCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!    
    @IBOutlet weak var transactionLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
