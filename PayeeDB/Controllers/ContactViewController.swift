//
//  ContactViewController.swift
//  PayeeDB
//
//  Created by Lynn on 10/2/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController {
    @IBOutlet weak var companyLabel: UILabel!
    
    @IBOutlet weak var contactButton: UIButton!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var serviceLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelText()
        buttonUISetup()
    }

    func labelText() {
        companyLabel.text = Card.items[0].relatedInfo
        nameLabel.text = Card.items[0].name
        addressLabel.text = Card.items[0].address + " " + Card.items[0].zip
        phoneLabel.text = Card.items[0].phone
        paymentLabel.text = Card.items[0].payment
        taxLabel.text = Card.items[0].taxID
    }
    
    func buttonUISetup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Confirm", style: .plain, target: self, action: #selector (toAdd))
        contactButton.backgroundColor = UIColor(displayP3Red: 13/255.0, green: 101/255.0, blue: 155/255.0, alpha: 1)
        contactButton.layer.cornerRadius = 5
    }
    
    @objc func toAdd() {
        navigationItem.rightBarButtonItem?.title = "Add"
        serviceLabel.isHidden = false
        messageLabel.isHidden = false
        contactButton.isHidden = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
