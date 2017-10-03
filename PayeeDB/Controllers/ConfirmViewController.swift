//
//  ConfirmViewController.swift
//  PayeeDB
//
//  Created by Lynn on 10/1/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var foundView: UIView!    
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var trustView: UIView!
    @IBOutlet weak var historyView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPayUISetup()
        companyLabel.text = Card.items[0].relatedInfo
        nameLabel.text = Card.items[0].name
        addressLabel.text = Card.items[0].address + " " + Card.items[0].zip
        phoneLabel.text = Card.items[0].phone
        paymentLabel.text = Card.items[0].payment
        //Card.remove(Item: Card.items[0])
        

    }

    func addPayUISetup() {
        foundView.layer.cornerRadius = foundView.frame.size.width / 2
        historyView.layer.cornerRadius = historyView.frame.size.width / 2
        trustView.layer.cornerRadius = trustView.frame.size.width / 2
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  

}
