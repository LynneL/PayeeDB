//
//  PayeeViewController.swift
//  PayeeDB
//
//  Created by Lynn on 9/30/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class PayeeViewController: UIViewController {
    @IBOutlet weak var paymentView: UIView!
    @IBOutlet weak var coverView: UIView!
    @IBOutlet weak var cancelPayment: UIButton!
    @IBOutlet weak var wirePayment: UIButton!
    @IBOutlet weak var cardPayment: UIButton!
    @IBOutlet weak var achPayment: UIButton!
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var payeeTableView: UITableView!    


    var payEvents =
        [Payees(name: "Starbucks", amount: "$20,000", transaction: "32"),
         Payees(name: "Sam's Cleaners", amount: "$30,000", transaction: "16"),
         Payees(name: "Office Supplies", amount: "$10,400", transaction: "3"),
         Payees(name: "Blue Shield", amount: "$207,000", transaction: "32"),
         Payees(name: "Safeway", amount: "$30,000", transaction: "16"),
         Payees(name: "JetBlue", amount: "$473,400", transaction: "3"),
         Payees(name: "Safeway", amount: "$30,000", transaction: "16"),
         Payees(name: "JetBlue", amount: "$473,400", transaction: "3")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payeeTableView.register(UINib(nibName: "PayeeCell", bundle: nil), forCellReuseIdentifier: "PayeeCell")
        
        navigationController?.title = "Payees"
    

    }

    @IBAction func payByACH(_ sender: UIButton) {
        let story = UIStoryboard(name: "Payee", bundle: nil)
        let addPay = story.instantiateViewController(withIdentifier: "APVC")
        navigationController?.pushViewController(addPay, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension PayeeViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PayeeCell", for: indexPath)
        (cell as! PayeeCell).nameLabel.text = payEvents[indexPath.row].name
        (cell as! PayeeCell).amountLabel.text = payEvents[indexPath.row].amount
        (cell as! PayeeCell).transactionLabel.text = payEvents[indexPath.row].transaction
        return cell
    }
}

extension PayeeViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
