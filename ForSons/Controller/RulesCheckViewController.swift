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
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self
        let nibName = UINib(nibName: "RulesCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "listCell")
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath) as! RulesTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

}

