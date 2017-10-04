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
    @IBOutlet weak var tpBtn: UIButton!
    @IBOutlet weak var dbBtn: UIButton!
    
    var item:Payees!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Payee"
        companyLabel.text = StorageManager.items.last!.companyName
        nameLabel.text = StorageManager.items.last!.contactName
        addressLabel.text = StorageManager.items.last!.address + " " + StorageManager.items[0].zip
        phoneLabel.text = StorageManager.items.last!.phone
        paymentLabel.text = StorageManager.items.last!.payment
        tpBtn.layer.cornerRadius = 5
        tpBtn.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        tpBtn.layer.borderWidth = 1
        dbBtn.layer.cornerRadius = 5
        dbBtn.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        dbBtn.layer.borderWidth = 1
        let item = UIBarButtonItem(title: "ADD",
                                   style: .plain,
                                   target: self,
                                   action: #selector(addUser))
        navigationItem.rightBarButtonItem = item
    }
    
    @IBAction func startEnteringTaxID(_ sender: UIButton) {
        DBTextField.resignFirstResponder()
        raxIDTextField.becomeFirstResponder()
    }
    
    @IBAction func startEnteringDB(_ sender: UIButton) {
        raxIDTextField.resignFirstResponder()
        DBTextField.becomeFirstResponder()
    }
    
    @objc private func addUser(){
        
    }
}

extension IDViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(displayP3Red: 13/255.0, green: 101/255.0, blue: 155/255.0, alpha: 1).cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string != ""{
            if range.location == 3 {
                textField.text! += "-" + string
                return false
            }else if range.location == 9 {
                textField.text! += "-" + string
            }else if range.location > 11 {
                textField.resignFirstResponder()
                return false
            }
        }else{
            if range.location == 4 {
                let index = textField.text!.index(textField.text!.startIndex, offsetBy: 3)
                textField.text = String(textField.text![..<index])
                return false
            }else if range.location == 9 {
                let index = textField.text!.index(textField.text!.startIndex, offsetBy: 8)
                textField.text = String(textField.text![..<index])
                return false
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        if textField.tag == 0 {
            item.taxID = raxIDTextField.text!
            DBTextField.becomeFirstResponder()
        }else {
            textField.resignFirstResponder()
        }
        return true
    }
}
