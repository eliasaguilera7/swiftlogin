//
//  SingupViewController.swift
//  loginapp
//
//  Created by Elias Aguilera Yambay on 2020-07-23.
//  Copyright © 2020 Elias Aguilera Yambay. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SingupViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var emailfIeld: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
   
    @IBAction func singupButton(_ sender: Any) {
        //validate the fields
        
        
        
        //create the users
        
        //transition to home screen
        let error = validate()
        
        if error != nil {
            //if there is something wrong show error
            showError(error!)
            
        }
        
        else {
            //created cleaned version of data
            let firstname = firstName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastname = lastName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailfIeld.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password1 = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            // create user
            Auth.auth().createUser(withEmail: email, password: password1){(result, err) in
                //check for error
                if err != nil {
                    //There is an error creation user
                    self.showError("Error creating user")
                }
                else{
                    //user is created successfully, now store the ffirst and last name
                    let  db = Firestore.firestore()
                    db.collection("users").addDocument(data:["firstname":firstname,"lastname":lastname, "uid":result!.user.uid])
                    {
                        (error) in
                        if error != nil {
                            self.showError("error saving user data")
                        }
                    }
                    //transition to home
                    self.transitionToHome()
                }
            }
            
        }
        
        
    }
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func validate()-> String? {
        // Checking all fields are filled in
        if firstName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""  || lastName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailfIeld.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || password.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            return("Please fill in all the fields")
        }
        
        // check if password is secure
        let checkPassword = password.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if passvalidationViewController.isPasswordValid(checkPassword) == false {
            return "Please make sure password is at least 8 characters, contains special character and a number"
        }
        
        
        return nil
    }
    
    func showError(_ message:String){
        errorLabel.text = message
    }
    
    func transitionToHome() {
        let homeViewController =
        storyboard?.instantiateViewController(withIdentifier:constant.storyboard.homeViewController) as? HomeViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
}
