//
//  Utility.swift
//  PayeeDB
//
//  Created by Xu, Jay on 10/3/17.
//  Copyright © 2017 Lynne. All rights reserved.
//

import UIKit
import AudioToolbox

struct Utility {
    
    private init(){}
    
    static func vibrate(){
        if vibrateType() {
            if #available(iOS 10.0, *) {
                let generator = UIImpactFeedbackGenerator(style: .heavy)
                generator.prepare()
                generator.impactOccurred()
            } else {
                AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
            }
        }else{
            AudioServicesPlayAlertSound(kSystemSoundID_Vibrate)
        }
    }
    
    static private func vibrateType()->Bool {
        if #available(iOS 10.0, *) {
            let deviceType = UIDevice.current.value(forKey: "_feedbackSupportLevel") as! Int
            return deviceType == 2
        }else{
            return false
        }
    }
    
}

extension UIView {
    
    func shake() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 5
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x:self.center.x - 4.0, y:self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x:self.center.x + 4.0, y:self.center.y))
        layer.add(animation, forKey: "position")
    }
}

extension UIViewController {
    
    struct ErrorPop {
        static let ev = Bundle.main.loadNibNamed("ErrorView",
                                                 owner: nil,
                                                 options: nil)?.last! as! ErrorView
    }
    
    private var errorView:ErrorView {
        return ErrorPop.ev
    }
    
    func show(error:String) {
        var flag = true
        view.subviews.forEach{
            if $0 is ErrorView{
                flag = false
            }
        }
        if flag {
            errorView.frame = CGRect(x: 0,
                                     y: -100,
                                     width: view.frame.width,
                                     height: 50)
            view.addSubview(errorView)
        }
        errorView.showWith(error)
    }
}

class InsetTextField:UITextField {
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 10, y: 0, width: bounds.width - 20, height: bounds.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 10, y: 0, width: bounds.width - 20, height: bounds.height)
    }
}
