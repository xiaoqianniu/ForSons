//
//  FamSchedViewController.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-11.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class FamSchedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NewEventDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var scheduleArray = [Schedule]()
    
    var schedules = Schedule()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.delegate = self
        tableView.dataSource = self
        let nibName = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ScheduleCell")
         schedules.eventName = "m"
        schedules.eventWhat = "read"
        schedules.eventPlace = "home"
        schedules.eventWhen = "7"
        scheduleArray.append(schedules)
        tableView.reloadData()
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleTableViewCell
//       scheduleArray.append(schedules)
       
          cell.when?.text = scheduleArray[indexPath.row].eventWhen
        print(scheduleArray[indexPath.row].eventWhen)
          cell.what?.text = scheduleArray[indexPath.row].eventWhat
          cell.place?.text = scheduleArray[indexPath.row].eventPlace
       
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleArray.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108.0
    }
//    show popupviewcontroller
    @IBAction func AddNewSchedule(_ sender: Any) {
//        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "popUpID") as! NewEventViewController
//        self.addChildViewController(popOverVC)
//        popOverVC.view.frame = self.view.frame
//        self.view.addSubview(popOverVC.view)
//        popOverVC.delegate = self as? NewEventDelegate
//        popOverVC.didMove(toParentViewController: self)

//     navigationController?.navigationBar.isTranslucent = false
        performSegue(withIdentifier: "goToNewEvent", sender: self)

      self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNewEvent"{
        let destinationVC = segue.destination as! NewEventViewController
        destinationVC.Newdelegate = self
        }
    }
    
    func popDataPasstoFam(memberValue: String, timeValue: String, eventValue: String, locationValue: String) {
     
        print(memberValue)
        schedules.eventName = memberValue
        print(schedules.eventName)
        schedules.eventWhen = timeValue
        schedules.eventPlace = locationValue
        schedules.eventWhat = eventValue
        scheduleArray.append(schedules)
        tableView.reloadData()
    }
    

    @IBAction func segmentControlTapped(_ sender: UISegmentedControl) {
    }
    

}


