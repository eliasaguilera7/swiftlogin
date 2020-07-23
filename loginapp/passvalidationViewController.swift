//
//  passvalidationViewController.swift
//  
//
//  Created by Elias Aguilera Yambay on 2020-07-23.
//

import UIKit

class passvalidationViewController: UIViewController {
   static func isPasswordValid(_ password : String) -> Bool{
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return passwordTest.evaluate(with: password)}

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
}
