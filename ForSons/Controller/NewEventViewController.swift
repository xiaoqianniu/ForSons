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

class NewEventViewController: UIViewController {
    
    
    @IBOutlet weak var memberName: UITextField!
    
    @IBOutlet weak var newEvent: UITextField!
    
    @IBOutlet weak var eventTime: UITextField!
    
    @IBOutlet weak var location: UITextField!
    
    var Newdelegate :NewEventDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         self.edgesForExtendedLayout = []

     navigationController?.setNavigationBarHidden(true, animated: true)

    }
   
    
    
    @IBAction func cancelBtn(_ sender: UIButton) {
   
    navigationController?.popToRootViewController(animated: true)
    navigationController?.setNavigationBarHidden(false, animated: true)
    
    }
    
    @IBAction func addNewBtnPressed(_ sender: UIButton) {
        
        let name = memberName.text!
        let time = eventTime.text!
        let newThing = newEvent.text!
        let place = location.text!
        Newdelegate?.popDataPasstoFam(memberValue: name, timeValue: time, eventValue: newThing, locationValue: place)
        
     navigationController?.popToRootViewController(animated: true)
     navigationController?.setNavigationBarHidden(false, animated: true)

    }

  


}
