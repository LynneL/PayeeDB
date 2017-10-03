//
//  IDViewController.swift
//  PayeeDB
//
//  Created by Lynn on 10/1/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class IDViewController: UIViewController {
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var DBTextField: UITextField!
    @IBOutlet weak var raxIDTextField: UITextField!
    @IBOutlet weak var companyLabel: UILabel!
    var item:Content!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        companyLabel.text = Card.items[0].relatedInfo
        nameLabel.text = Card.items[0].name
        addressLabel.text = Card.items[0].address + " " + Card.items[0].zip
        phoneLabel.text = Card.items[0].phone
        paymentLabel.text = Card.items[0].payment
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension IDViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(displayP3Red: 13/255.0, green: 101/255.0, blue: 155/255.0, alpha: 1).cgColor
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            item.taxID = raxIDTextField.text!
            DBTextField.becomeFirstResponder()
        }else {
            textField.resignFirstResponder()
        }
        return true
    }
}
