//
//  JPSenderVC.swift
//  JustPay
//
//  Created by Abhishek Thapliyal on 12/14/16.
//  Copyright © 2016 InHeap. All rights reserved.
//

import UIKit

class JPSenderVC: UIViewController {

    @IBOutlet weak var amountField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func sendButtonAction(_ sender: Any) {
        
        if (amountField.text?.isEmpty)! {
            
            let alertMsg : String = "INVALID AMOUNT"
            let alertVC = UIAlertController(title: "PAYMENT", message: alertMsg, preferredStyle: UIAlertControllerStyle.alert)
            alertVC.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil))
            show(alertVC, sender: self)
            return;
        }
        
        let manager = JPServerManager()
        let amount : NSString = NSString(format : "%@", amountField.text!)
        manager.makePayment(amount: amount,  completion: { (json, error) in
        
        
        
        })
        
    }
    
}
