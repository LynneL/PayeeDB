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
    @IBOutlet weak var zipText: InsetTextField!
    @IBOutlet weak var phoneText: InsetTextField!
    @IBOutlet weak var nameText: InsetTextField!
    @IBOutlet weak var companyText: InsetTextField!
    @IBOutlet weak var contentTableView: UITableView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var foundView: UIView!    
    @IBOutlet weak var trustView: UIView!
    @IBOutlet weak var historyView: UIView!
    
    private var item:Payees!
    private let search = IonIcons.image(withIcon: ion_ios_search_strong,
                                        iconColor: UIColor(displayP3Red: 13/255.0,
                                                           green: 101/255.0,
                                                           blue: 155/255.0,
                                                           alpha: 1),
                                        iconSize: 25,
                                        imageSize: CGSize(width: 25,
                                                          height: 25))
    private let ye = UIColor(red: 252/255.0,
                             green: 198/255.0,
                             blue: 10/255.0,
                             alpha: 1)
    private let r = UIColor(red: 187/255.0,
                            green: 8/255.0,
                            blue: 38/255.0,
                            alpha: 1)
    private var isFound = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addPayUISetup()
        contentTableView.register(UINib(nibName: "ContentCell",
                                        bundle: nil),
                                  forCellReuseIdentifier: "ContentCell")
        title = "Add Payees"
    }
    
    private func addPayUISetup() {
        foundView.layer.cornerRadius = foundView.frame.size.width / 2
        historyView.layer.cornerRadius = historyView.frame.size.width / 2
        trustView.layer.cornerRadius = trustView.frame.size.width / 2
        nextButton.layer.cornerRadius = 5
        contentTableView.layer.cornerRadius = 10
        
        //TextFields
        companyText.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        companyText.layer.borderWidth = 2
        companyText.layer.cornerRadius = 5
        
        nameText.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        nameText.layer.borderWidth = 2
        nameText.layer.cornerRadius = 5
        
        phoneText.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        phoneText.layer.borderWidth = 2
        phoneText.layer.cornerRadius = 5
        
        zipText.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
        zipText.layer.borderWidth = 2
        zipText.layer.cornerRadius = 5
        
        let searchBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 25))
        searchBtn.setImage(search, for: .normal)
        searchBtn.imageView?.contentMode = .scaleAspectFit
        searchBtn.addTarget(self,
                            action: #selector(showContentTableView),
                            for: .touchUpInside)
        companyText.rightView = searchBtn
        companyText.rightViewMode = .always
    }

    @IBAction func goToNext(_ sender: UIButton) {
        guard companyText.text!.characters.count > 0 else{
            companyText.shake()
            Utility.vibrate()
            return
        }
        guard nameText.text!.characters.count > 0 else{
            nameText.shake()
            Utility.vibrate()
            return
        }
        guard phoneText.text!.characters.count > 0 else{
            phoneText.shake()
            Utility.vibrate()
            return
        }
        guard zipText.text!.characters.count > 0 else{
            zipText.shake()
            Utility.vibrate()
            return
        }
        if item == nil {
            item = Payees(company: companyText.text!,
                          contact: nameText.text!,
                          phone: phoneText.text!,
                          zip: zipText.text!)
        }
        StorageManager.add(item: item)
        if isFound {
            let des = UIStoryboard(name: "Payee", bundle: nil).instantiateViewController(withIdentifier: "DVC")
            navigationController?.pushViewController(des, animated: true)
        }else{
            let des = UIStoryboard(name: "Payee", bundle: nil).instantiateViewController(withIdentifier: "IDVC") as! IDViewController
            des.item = item
            navigationController?.pushViewController(des, animated: true)
        }
    }
    
    @objc private func showContentTableView(){
        companyText.resignFirstResponder()
        guard companyText.text == "office" || companyText.text == "Office" else{
            show(error: "Sorry we are unable to identify this Payee. Please provide additional information")
            return
        }
        isFound = true
        contentTableView.isHidden = false
        coverView.isHidden = false
    }
}

extension AddPayeesViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return StorageManager.fakeInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contentTableView.dequeueReusableCell(withIdentifier: "ContentCell", for: indexPath)
        (cell as! ContentCell).relatedLabel.text = StorageManager.fakeInfo[indexPath.row].companyName
        (cell as! ContentCell).addressLabel.text = StorageManager.fakeInfo[indexPath.row].address
        (cell as! ContentCell).nameLabel.text = StorageManager.fakeInfo[indexPath.row].contactName
        return cell
    }
}

extension AddPayeesViewController:UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        contentTableView.deselectRow(at: indexPath, animated: true)
        coverView.isHidden = true
        contentTableView.isHidden = true
        item = StorageManager.fakeInfo[indexPath.row]
        companyText.text = StorageManager.fakeInfo[indexPath.row].companyName
        nameText.text = StorageManager.fakeInfo[indexPath.row].contactName
        phoneText.text = StorageManager.fakeInfo[indexPath.row].phone
        zipText.text = StorageManager.fakeInfo[indexPath.row].zip
        zipText.layer.borderColor = UIColor(displayP3Red: 13/255.0,
                                            green: 101/255.0,
                                            blue: 155/255.0,
                                            alpha: 1).cgColor
        foundView.backgroundColor = ye
        foundView.alpha = 1
        historyView.backgroundColor = ye
        historyView.alpha = 1
        trustView.backgroundColor = ye
        trustView.alpha = 1
        titleLabel.text = "Add Payee"
    }
}

extension AddPayeesViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor(displayP3Red: 13/255.0,
                                              green: 101/255.0,
                                              blue: 155/255.0,
                                              alpha: 1).cgColor
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 2 {
            if string != ""{
                if range.location == 0 {
                    textField.text = "(" + string
                    return false
                }else if range.location == 4 {
                    textField.text! += ")" + string
                }else if range.location == 8 {
                    textField.text! += "-" + string
                }else if range.location > 12 {
                    textField.resignFirstResponder()
                    return false
                }
            }else{
                if range.location == 5 {
                    let index = textField.text!.index(textField.text!.startIndex, offsetBy: 4)
                    textField.text = String(textField.text![..<index])
                    return false
                }else if range.location == 9 {
                    let index = textField.text!.index(textField.text!.startIndex, offsetBy: 8)
                    textField.text = String(textField.text![..<index])
                    return false
                }
            }
        }else if textField.tag == 3 {
            if string != ""{
                if range.location > 4 {
                    textField.resignFirstResponder()
                    if !isFound {
                        foundView.alpha = 1
                        foundView.backgroundColor = r
                        historyView.backgroundColor = r
                        historyView.alpha = 1
                        trustView.backgroundColor = r
                        trustView.alpha = 1
                        titleLabel.text = "Add Payee"
                    }
                    return false
                }else{
                    return true
                }
            }else{
                return true
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else{
            textField.shake()
            Utility.vibrate()
            return false
        }
        guard text.count > 0 else{
            textField.shake()
            Utility.vibrate()
            return false
        }
        
        if textField.tag == 0 {
            titleLabel.text = "Add Payee"
            textField.resignFirstResponder()
        }else if textField.tag == 1 && textField.returnKeyType == .next{
            phoneText.becomeFirstResponder()
        }else if textField.tag == 2 && textField.returnKeyType == .next{
            zipText.becomeFirstResponder()
        }else{
            textField.resignFirstResponder()
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
    }
}
