//
//  ViewController.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-08.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class RulesCheckViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let realm = try! Realm()
    
    var rules = [List]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self
        let nibName = UINib(nibName: "RulesCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "listCell")
        
        let newItem = List()
        newItem.name = "I love you"
        newItem.check = true
        rules.append(newItem)
        
        let newItem2 = List()
        newItem2.name = "I like you"
        rules.append(newItem2)
        
        let newItem3 = List()
        newItem3.name = "I hate you"
        rules.append(newItem3)
        
        let newItem4 = List()
        newItem4.name = "I like you"
        rules.append(newItem4)
        
        let newItem5 = List()
        newItem5.name = "I like you"
        rules.append(newItem5)
        let newItem6 = List()
        newItem6.name = "I like you"
        rules.append(newItem6)
        let newItem7 = List()
        newItem7.name = "I like you"
        rules.append(newItem7)
        let newItem8 = List()
        newItem8.name = "I like you"
        rules.append(newItem8)
        let newItem9 = List()
        newItem9.name = "I like you"
        rules.append(newItem9)
        let newItem10 = List()
        newItem10.name = "I like you"
        rules.append(newItem10)
        let newItem11 = List()
        newItem11.name = "I like you"
        rules.append(newItem11)
        let newItem12 = List()
        newItem12.name = "I like you"
        rules.append(newItem12)
        
        tableView.reloadData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! RulesTableViewCell
        cell.checkBtn.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        cell.checkBtn.tintColor = .red
     
        cell.listLbl.text = rules[indexPath.row].name
        
        if rules[indexPath.row].check == true{
            cell.checkBtn.setImage(#imageLiteral(resourceName: "check-button"), for: .selected)
        }else{
            cell.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
        }
        
        cell.checkBtn.addTarget(self, action: #selector(checkBtnPressed(sender:)), for: .touchUpInside)
        return cell
    }
    @objc func checkBtnPressed(sender:UIButton){
        if sender.isSelected{
            sender.isSelected = false
        }else{
            sender.isSelected = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rules.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        rules[indexPath.row].check = !rules[indexPath.row].check
        save()
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func save(){
        
    }
}

