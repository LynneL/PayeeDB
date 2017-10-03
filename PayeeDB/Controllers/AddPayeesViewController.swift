//
//  AddPayeesViewController.swift
//  PayeeDB
//
//  Created by Lynn on 9/30/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class AddPayeesViewController: UIViewController {
  
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var zipText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var companyText: UITextField!
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foundView: UIView!    
    @IBOutlet weak var trustView: UIView!
    @IBOutlet weak var historyView: UIView!
    var item:Content!
    
    var contents =
        [Content(relatedInfo: "OFFICE DEPOT", address: "1400 Park Avenue, Emeryville, CA", name: "Josh Murray"),
         Content(relatedInfo: "OFFICE MAX", address: "608 Corwin St. Tillmanborough, TN", name:"Bob Harvey"),
         Content(relatedInfo: "THE OFFICE", address: "025 Yundt Squares, Williamsburg, VA", name: "Sasha Gordon"),
         Content(relatedInfo: "SAM'S OFFICE CO.", address: "80 Langworth Path, Los Angeles, CA", name: "Pete Thompson")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPayUISetup()
        contentTableView.register(UINib(nibName: "ContentCell", bundle: nil), forCellReuseIdentifier: "ContentCell")
    }
    
    func addPayUISetup() {
        foundView.layer.cornerRadius = foundView.frame.size.width / 2
        historyView.layer.cornerRadius = historyView.frame.size.width / 2
        trustView.layer.cornerRadius = trustView.frame.size.width / 2
        
        nextButton.layer.cornerRadius = 5
        contentTableView.layer.cornerRadius = 10
    }

    @IBAction func goToNext(_ sender: UIButton) {
        Card.add(Item: item)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension AddPayeesViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath)
        (cell as! ContentCell).relatedLabel.text = contents[indexPath.row].relatedInfo
        (cell as! ContentCell).addressLabel.text = contents[indexPath.row].address
        (cell as! ContentCell).nameLabel.text = contents[indexPath.row].name
        return cell
    }
}

extension AddPayeesViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contentTableView.deselectRow(at: indexPath, animated: true)
        coverView.isHidden = true
        contentTableView.isHidden = true
        self.nameText.text = contents[indexPath.row].name
    }
}

extension AddPayeesViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(displayP3Red: 13/255.0, green: 101/255.0, blue: 155/255.0, alpha: 1).cgColor
    }
    
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if textField.tag == 2 {
   
//        }
//    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField.tag == 0 {
            textField.returnKeyType = .search
            coverView.isHidden = false
            contentTableView.isHidden = false
        }else if textField.tag == 1 && textField.returnKeyType == .next{
            phoneText.becomeFirstResponder()
        }else if textField.tag == 2 && textField.returnKeyType == .next{
            item.phone = phoneText.text!
            zipText.becomeFirstResponder()
        }else{
            item.zip = zipText.text!
            textField.resignFirstResponder()
        }
        return true
    }
}
