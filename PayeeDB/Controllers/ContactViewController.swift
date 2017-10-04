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

    private func labelText() {
        companyLabel.text = StorageManager.items[0].companyName
        nameLabel.text = StorageManager.items[0].contactName
        addressLabel.text = StorageManager.items[0].address + " " + StorageManager.items[0].zip
        phoneLabel.text = StorageManager.items[0].phone
        paymentLabel.text = StorageManager.items[0].payment
        taxLabel.text = StorageManager.items[0].taxID
    }
    
    private func buttonUISetup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Confirm",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector (toAdd))
        contactButton.backgroundColor = UIColor(displayP3Red: 13/255.0,
                                                green: 101/255.0,
                                                blue: 155/255.0,
                                                alpha: 1)
        contactButton.layer.cornerRadius = 5
    }
    
    @objc private func toAdd() {
        navigationItem.rightBarButtonItem?.title = "Add"
        serviceLabel.isHidden = false
        messageLabel.isHidden = false
        contactButton.isHidden = false
    }
}
