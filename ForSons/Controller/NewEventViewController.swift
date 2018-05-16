//
//  PopupViewController.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-11.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

protocol NewEventDelegate {
    func popDataPasstoFam(memberValue:String,timeValue:String,eventValue:String,locationValue:String)
}

class NewEventViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    
    @IBOutlet weak var memberName: UITextField!
    
    @IBOutlet weak var newEvent: UITextField!
    
    @IBOutlet weak var eventTime: UITextField!
    
    @IBOutlet weak var location: UITextField!
    
    var Newdelegate :NewEventDelegate?
    
    let picker = UIDatePicker()
    let namePicker = UIPickerView()
    let names = ["muge","muyang","muqi","mommy","daddy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        namePicker.delegate = self
        namePicker.dataSource = self
        memberName.inputView = namePicker
        memberName.textAlignment = .natural
        memberName.placeholder = "Select Name"

     navigationController?.setNavigationBarHidden(true, animated: true)
     createDatePicker()
    }
   
    //    TODO: Cancel Button
    
    @IBAction func cancelBtn(_ sender: UIButton) {
   
    navigationController?.popToRootViewController(animated: true)
    navigationController?.setNavigationBarHidden(false, animated: true)
    
    }
    //    TODO: - Add New Event
    @IBAction func addNewBtnPressed(_ sender: UIButton) {
        
        let name = memberName.text!
        let time = eventTime.text!
        let newThing = newEvent.text!
        let place = location.text!
        Newdelegate?.popDataPasstoFam(memberValue: name, timeValue: time, eventValue: newThing, locationValue: place)
        
     navigationController?.popToRootViewController(animated: true)
     navigationController?.setNavigationBarHidden(false, animated: true)

    }
    // MARK: Implement datePicker method
    func createDatePicker(){
        
        // create toolBar
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        
       // done button for toolBar
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneBtnPressed))
        toolBar.setItems([done], animated: false)
        eventTime.inputView = picker
        eventTime.inputAccessoryView = toolBar
        
     //  formate picker for date
        picker.datePickerMode = .dateAndTime
    }
    @objc func doneBtnPressed(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let date = formatter.string(from: picker.date)
        eventTime.text = "\(date)"
        self.view.endEditing(true)
        
    }
    //    MARK: Implement pickerview methods
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return names.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return names[row]
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        memberName.text = names[row]
        memberName.resignFirstResponder()
    }
    

}
