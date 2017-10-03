//
//  DetailViewController.swift
//  PayeeDB
//
//  Created by Lynn on 10/2/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var companyLabel: UILabel!
    @IBOutlet weak var secondImage: UIImageView!
    @IBOutlet weak var firstImage: UIImageView!
    @IBOutlet weak var secondChooseButton: UIButton!
    @IBOutlet weak var firstChooseButton: UIButton!
    @IBOutlet weak var foundPhoneLabel: UILabel!
    @IBOutlet weak var foundAddressLabel: UILabel!
    @IBOutlet weak var foundLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var paymentLabel: UILabel!
    
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
        foundLabel.text = Card.items[0].name
        foundAddressLabel.text = Card.items[0].address
        foundPhoneLabel.text = Card.items[0].phone
    }
    
    func buttonUISetup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Confirm", style: .plain, target: self, action: #selector (toConfirm))
        firstChooseButton.layer.borderWidth = 0.3
        firstChooseButton.layer.borderColor = UIColor.black.cgColor
        secondChooseButton.layer.borderWidth = 0.3
        secondChooseButton.layer.borderColor = UIColor.black.cgColor
        //firstImage.image =
        //secondImage.image =
    }
    
    @IBAction func chooseFirst(_ sender: UIButton) {
        firstChooseButton.backgroundColor = UIColor(displayP3Red: 52/255.0, green: 100/255.0, blue: 8/255.0, alpha: 1)
        firstImage.isHidden = false
        secondChooseButton.backgroundColor = UIColor.clear
    }
    
    @IBAction func chooseSecond(_ sender: UIButton) {
        secondChooseButton.backgroundColor = UIColor(displayP3Red: 52/255.0, green: 100/255.0, blue: 8/255.0, alpha: 1)
        secondImage.isHidden = false
        firstChooseButton.backgroundColor = UIColor.clear
    }
    
    @objc func toConfirm() {
        let story = UIStoryboard(name: "Payee", bundle: nil)
        let toContact = story.instantiateViewController(withIdentifier: "CVC")
        navigationController?.pushViewController(toContact, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
