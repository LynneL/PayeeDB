//
//  DoneViewController.swift
//  PayeeDB
//
//  Created by Lynn on 10/1/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {
    
    @IBOutlet weak var confirmLabel: UILabel!
    @IBOutlet weak var confirmImage: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confirmLabel.textColor = UIColor(displayP3Red: 13/255.0, green: 101/255.0, blue: 155/255.0, alpha: 1)
        doneButton.layer.cornerRadius = 5
        doneButton.backgroundColor = UIColor(displayP3Red: 13/255.0, green: 101/255.0, blue: 155/255.0, alpha: 1)
    }

    @IBAction func done(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}
