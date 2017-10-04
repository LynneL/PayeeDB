//
//  PayeeViewController.swift
//  PayeeDB
//
//  Created by Lynn on 9/30/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class PayeeViewController: UIViewController {
    @IBOutlet weak var headView: UIView!
    @IBOutlet weak var payeeTableView: UITableView!
    
    private let paymentView = Bundle.main.loadNibNamed("PaymentView", owner: nil, options: nil)?.last as! PaymentView

    private var payEvents = StorageManager.items
    
    override func viewDidLoad() {
        super.viewDidLoad()
        payeeTableView.register(UINib(nibName: "PayeeCell", bundle: nil), forCellReuseIdentifier: "PayeeCell")
        navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        paymentViewSetup()
        payEvents = StorageManager.items
        payeeTableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        paymentView.removeFromSuperview()
    }
    
    //MARK:UI
    private func paymentViewSetup(){
        paymentView.frame = CGRect(origin: CGPoint(x:0,
                                                   y:UIScreen.main.bounds.height),
                                   size: UIScreen.main.bounds.size)
        paymentView.dismissHandler = { [unowned self] in
            UIView.animate(withDuration: 0.5) {
                self.paymentView.frame = CGRect(origin: CGPoint(x:0,
                                                                y:UIScreen.main.bounds.height),
                                                size: UIScreen.main.bounds.size)
            }
        }
        paymentView.selectionHandler = { [unowned self] in
            DispatchQueue.main.async {
                self.payByACH()
            }
        }
        tabBarController!.view.addSubview(paymentView)
    }

    //MARK:IBAction
    @IBAction func showPaymentView(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.5) {
            self.paymentView.frame = CGRect(origin: CGPoint(x:0,
                                                            y:0),
                                            size: UIScreen.main.bounds.size)
        }
    }
    
    private func payByACH() {
        let story = UIStoryboard(name: "Payee", bundle: nil)
        let addPay = story.instantiateViewController(withIdentifier: "APVC")
        navigationController?.pushViewController(addPay, animated: true)
    }
}

extension PayeeViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payEvents.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PayeeCell", for: indexPath)
        (cell as! PayeeCell).nameLabel.text = payEvents[indexPath.row].companyName
        (cell as! PayeeCell).amountLabel.text = payEvents[indexPath.row].amount
        (cell as! PayeeCell).transactionLabel.text = payEvents[indexPath.row].transaction
        return cell
    }
}

extension PayeeViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}
