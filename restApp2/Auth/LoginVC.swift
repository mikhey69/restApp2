//
//  ViewController.swift
//  restApp
//
//  Created by mikhey on 21.08.2018.
//  Copyright © 2018 mikhey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class LoginVC: UIViewController {
    
    var email = " "
    var password = " "
    
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginAccess" {
            let vc = segue.destination as! TableViewController
            vc.email = email
            vc.password = password
            
        }
    }
    
    @IBAction func loginTap(_ sender: Any) {
        if emailText.text != " " && passwordText.text != " " {
            email = emailText.text!
            password = passwordText.text!
        }
        
    }
    
    @IBAction func signupTap(_ sender: Any) {
        
    }
    
    
}

