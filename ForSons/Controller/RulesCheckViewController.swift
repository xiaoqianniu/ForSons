//
//  ViewController.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-08.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit
import RealmSwift

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
        newItem.name = "1. read a book."
        rules.append(newItem)
      
       
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! RulesTableViewCell
        cell.checkBtn.frame = CGRect(x: 0, y: 0, width: 70, height: 70)
        
     
        cell.listLbl.text = rules[indexPath.row].name
        
       
     
        
        
     
        cell.checkBtn.addTarget(self, action: #selector(checkBtnPressed(sender:)), for: .touchUpInside)
        
        if rules[indexPath.row].check == true{
            cell.checkBtn.setImage(#imageLiteral(resourceName: "check-button"), for: .normal)
        }else{
            cell.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
        }
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
        
        let cell = tableView.cellForRow(at: indexPath) as! RulesTableViewCell
        if rules[indexPath.row].check == true{
        cell.checkBtn.setImage(#imageLiteral(resourceName: "check-button"), for: .normal)
        }else{
            cell.checkBtn.setImage(#imageLiteral(resourceName: "uncheck"), for: .normal)
        }
       
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func addNewRules(_ sender: UIBarButtonItem) {
        var textField = UITextField()
        let alert = UIAlertController(title: "Add New Rules", message: nil, preferredStyle: .alert)
        let OKaction = UIAlertAction(title: "OK", style: .default) { (OKaction) in
//when press ok button what will happen.
            let newItem = List()
            newItem.name = textField.text!
            
            self.save(rules: newItem)
            
            let indexPath = IndexPath(row: self.rules.count-1, section: 0)
     
            self.tableView.beginUpdates()
          
           
            self.tableView.insertRows(at:[indexPath], with: .bottom)
            
            self.tableView.endUpdates()
            
           self.tableView.reloadData()
            
          

        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addTextField { (newRule) in
            newRule.placeholder = "Add new rules"
            textField = newRule
        }
        
        alert.addAction(OKaction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    func save(rules:List){
        do{
            try realm.write {
                realm.add(rules)
            }
        }catch{
            print(error)
        }
        tableView.reloadData()
    }
//    func load(){
//        rules = realm.objects(List.self)
//        tableView.reloadData()
//    }
}

