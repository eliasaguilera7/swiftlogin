//
//  passwordvalidationViewController.swift
//  loginapp
//
//  Created by Elias Aguilera Yambay on 2020-07-23.
//  Copyright © 2020 Elias Aguilera Yambay. All rights reserved.
//

import UIKit

class passwordvalidationViewController: UIViewController {

    static func isPasswordValid(_ password : String) -> Bool{
         let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
         return passwordTest.evaluate(with: password)
    
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
}

