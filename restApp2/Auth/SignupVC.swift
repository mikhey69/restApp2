//
//  SignupVC.swift
//  restApp2
//
//  Created by mikhey on 21.08.2018.
//  Copyright © 2018 mikhey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class SignupVC: UIViewController {
    
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var emailLabel: UITextField!
    @IBOutlet weak var passLabel: UITextField!
    
    var name = " "
    var email = " "
    var password = " "
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpTap(_ sender: Any) {
        
        if emailLabel.text != "" && passLabel.text != "", nameLabel.text != "" {
            email = emailLabel.text!
            password = passLabel.text!
            name = nameLabel.text!
        }
        
        let param = ["name":name,
                     "email":email,
                     "password":password
        ]
        let url = URL(string: "https://apiecho.cf/api/signup/")
        Alamofire.request(url!, method: .post, parameters: param, encoding: JSONEncoding.default).responseJSON { (response) in
            var resp = JSON(response.result.value)
            if self.emailLabel.text != "" && self.passLabel.text != "", self.nameLabel.text != "" {
                let alert = UIAlertController(title: "Aceess sign-up", message: "Cong", preferredStyle: UIAlertControllerStyle.alert)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alert.addAction(action)
                
                self.present(alert, animated: true, completion: nil)
            } else  {
                let alert2 = UIAlertController(title: "Have some prob", message: "Opps", preferredStyle: UIAlertControllerStyle.alert)
                let action2 = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
                alert2.addAction(action2)
                self.present(alert2, animated: true, completion: nil)
            }
        }
        
        
    }
}
