//
//  FamSchedViewController.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-11.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class FamSchedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let nibName = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ScheduleCell")
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108.0
    }
//    show popupviewcontroller
    @IBAction func AddNewSchedule(_ sender: Any) {
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpID") as! PopupViewController
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.delegate = self
//        popOverVC.didMove(toParentViewController: self)
//
////     navigationController?.navigationBar.isTranslucent = false
//
//      self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    performSegue(withIdentifier: "goToNewEvent", sender: self)
        
    }
    

    @IBAction func segmentControlTapped(_ sender: UISegmentedControl) {
    }
    

}
//extension FamSchedViewController: PopupDelegate{
//    func popDataPasstoFam(memberValue: String, timeValue: String, eventValue: String, locationValue: String) {
//
//    }

    
    
    
//}

