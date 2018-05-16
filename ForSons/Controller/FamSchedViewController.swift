//
//  FamSchedViewController.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-11.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit
import RealmSwift

class FamSchedViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,NewEventDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var tableView: UITableView!
    
    var scheduleArray : Results<Schedule>?
    
    let realm = try! Realm()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        let nibName = UINib(nibName: "ScheduleTableViewCell", bundle: nil)
        tableView.register(nibName, forCellReuseIdentifier: "ScheduleCell")
        loadData()
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleCell", for: indexPath) as! ScheduleTableViewCell

        
        cell.when?.text = scheduleArray?[indexPath.row].eventWhen ?? "No time"
          cell.what?.text = scheduleArray?[indexPath.row].eventWhat ?? "No Event"
          cell.place?.text = scheduleArray?[indexPath.row].eventPlace ?? "No Location"

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scheduleArray?.count ?? 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 108.0
    }
    //    TODO: Swipe to delete cell
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completion) in
            self.updateModel(at: indexPath)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        deleteAction.backgroundColor = .red
        deleteAction.image = UIImage(named:"delete")
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    //    TODO: Delete realm data
    func updateModel(at indexPath:IndexPath){
        if let schedule = scheduleArray?[indexPath.row]{
            do
            {
               try realm.write {
                realm.delete(schedule)
            }
            }catch{
                print(error)
            }
        }
    }
    
    //    MARK:--segue methods
    
    @IBAction func AddNewSchedule(_ sender: Any) {

        performSegue(withIdentifier: "goToNewEvent", sender: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToNewEvent"{
        let destinationVC = segue.destination as! NewEventViewController
        destinationVC.Newdelegate = self
        }
    }
    
    func popDataPasstoFam(memberValue: String, timeValue: String, eventValue: String, locationValue: String) {
        
        let schedules = Schedule();
        schedules.eventName = memberValue
        print(schedules.eventName)
        schedules.eventWhen = timeValue
        schedules.eventPlace = locationValue
        schedules.eventWhat = eventValue
         saveData(schedule: schedules)
        tableView.reloadData()
       
       
    }
    
    func saveData(schedule:Schedule){
        do
        {
           try realm.write {
            realm.add(schedule)
        }
        }catch{
            print(error)
        }
        tableView.reloadData()
    }
    func loadData(){
        scheduleArray = realm.objects(Schedule.self)
        tableView.reloadData()
    }

    @IBAction func segmentControlTapped(_ sender: UISegmentedControl) {
    }
    

}


