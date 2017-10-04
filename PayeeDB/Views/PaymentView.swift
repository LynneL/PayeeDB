//
//  PaymentView.swift
//  PayeeDB
//
//  Created by Xu, Jay on 10/3/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit

class PaymentView: UIView {

    var dismissHandler:(()->Void)!
    var selectionHandler:(()->Void)!
    
    @IBAction func didSelectMent(_ sender: UIButton) {
        selectionHandler()
    }
    
    @IBAction func dismissPaymentView(_ sender: UIButton) {
        dismissHandler()
    }
    
}
