//
//  TableViewController.swift
//  restApp
//
//  Created by mikhey on 9/4/18.
//  Copyright © 2018 mikhey. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class TableViewController: UITableViewController {
    
    
    // var and let
    
    let alp = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "Space", "Other"]
    
    var aCount = 0
    var bCount = 0
    var cCount = 0
    var dCount = 0
    var eCount = 0
    var fCount = 0
    var gCount = 0
    var hCount = 0
    var iCount = 0
    var jCount = 0
    var kCount = 0
    var lCount = 0
    var mCount = 0
    var nCount = 0
    var oCount = 0
    var pCount = 0
    var qCount = 0
    var rCount = 0
    var sCount = 0
    var tCount = 0
    var uCount = 0
    var vCount = 0
    var wCount = 0
    var xCount = 0
    var yCount = 0
    var zCount = 0
    var spaceCount = 0
    var otherCount = 0
    
    
    var token: JSON!
    
    var email = " "
    var password = " "
    var text = " "
    
    
    // MARK: - methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if email != " " && password != " " {
            postReqest()
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3)) {
                if self.token! != nil {
                    self.fetch()
                } else  {
                    self.navigationController?.popViewController(animated: true)
                }
            }
            
        } else {
            navigationController?.popViewController(animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
    func fetch() {
        let url = URL(string: "https://apiecho.cf/api/get/text/")
        
        if token != nil {
            let headers: HTTPHeaders = [
                "Authorization": "Bearer \(token!)"
            ]
            
            Alamofire.request(url!, method: .get, encoding: JSONEncoding.default, headers: headers).responseJSON { (response) in
                self.text = JSON(response.result.value ?? "nil")["data"].stringValue
                let textArray = Array(self.text)
                for i in textArray {
                    self.p(char: i)
                }
            }
        }
    }
    
    func postReqest() {
        
        let param = ["email":email,
                     "password":password
        ]
        let url = URL(string: "https://apiecho.cf/api/login/")
        Alamofire.request(url!, method: HTTPMethod.post, parameters: param).responseJSON { (response) in
            var json = JSON(response.result.value ?? "nil2")
            self.token = json["data"]["access_token"]
        }
    }
    
    func p(char: Character) {
        switch char  {
        case "A", "a" :
            self.aCount += 1
        case "B", "b" :
            self.bCount += 1
        case "C", "c" :
            self.cCount += 1
        case "D", "d" :
            self.dCount += 1
        case "E", "e" :
            self.eCount += 1
        case "F", "f" :
            self.fCount += 1
        case "G", "g" :
            self.gCount += 1
        case "H", "h" :
            self.hCount += 1
        case "I", "i" :
            self.iCount += 1
        case "J", "j" :
            self.jCount += 1
        case "K", "k" :
            self.kCount += 1
        case "L", "l" :
            self.lCount += 1
        case "M", "m" :
            self.mCount += 1
        case "N", "n" :
            self.nCount += 1
        case "O", "o" :
            self.oCount += 1
        case "P", "p" :
            self.pCount += 1
        case "Q", "q" :
            self.qCount += 1
        case "R", "r" :
            self.rCount += 1
        case "S", "s" :
            self.sCount += 1
        case "T", "t" :
            self.tCount += 1
        case "U", "u" :
            self.uCount += 1
        case "V", "v" :
            self.vCount += 1
        case "W", "w" :
            self.wCount += 1
        case "X", "x" :
            self.xCount += 1
        case "Y", "y" :
            self.yCount += 1
        case "Z", "z" :
            self.zCount += 1
        case " " :
            self.spaceCount += 1
        default:
            self.otherCount += 1
        }
    }
}

extension TableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alp.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
    
        cell.nameLabel.text = alp[indexPath.row]
        
        switch cell.nameLabel.text {
        case "A":
            cell.countLabel.text = String(self.aCount)
        case "B", "b" :
            cell.countLabel.text = String(self.bCount)
        case "C", "c" :
            cell.countLabel.text = String(self.cCount)
        case "D", "d" :
            cell.countLabel.text = String(self.dCount)
        case "E", "e" :
            cell.countLabel.text = String(self.eCount)
        case "F", "f" :
            cell.countLabel.text = String(self.fCount)
        case "G", "g" :
            cell.countLabel.text = String(self.gCount)
        case "H", "h" :
            cell.countLabel.text = String(self.hCount)
        case "I", "i" :
            cell.countLabel.text = String(self.iCount)
        case "J", "j" :
            cell.countLabel.text = String(self.jCount)
        case "K", "k" :
            cell.countLabel.text = String(self.kCount)
        case "L", "l" :
            cell.countLabel.text = String(self.lCount)
        case "M", "m" :
            cell.countLabel.text = String(self.mCount)
        case "N", "n" :
            cell.countLabel.text = String(self.nCount)
        case "O", "o" :
            cell.countLabel.text = String(self.oCount)
        case "P", "p" :
            cell.countLabel.text = String(self.pCount)
        case "Q", "q" :
            cell.countLabel.text = String(self.qCount)
        case "R", "r" :
            cell.countLabel.text = String(self.rCount)
        case "S", "s" :
            cell.countLabel.text = String(self.sCount)
        case "T", "t" :
            cell.countLabel.text = String(self.tCount)
        case "U", "u" :
            cell.countLabel.text = String(self.uCount)
        case "V", "v" :
            cell.countLabel.text = String(self.vCount)
        case "W", "w" :
            cell.countLabel.text = String(self.wCount)
        case "X", "x" :
            cell.countLabel.text = String(self.xCount)
        case "Y", "y" :
            cell.countLabel.text = String(self.yCount)
        case "Z", "z" :
            cell.countLabel.text = String(self.zCount)
        case " " :
            cell.countLabel.text = String(self.spaceCount)
        default:
            cell.countLabel.text = String(self.otherCount)
        }
        return cell
    }
}
