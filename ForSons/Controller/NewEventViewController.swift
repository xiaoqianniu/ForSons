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
//        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
//        navigationController?.setNavigationBarHidden(true, animated: true)
       
//       self.showAnimate()
    }
   
    
    
    @IBAction func cancelBtn(_ sender: UIButton) {
//       self.removeAnimate()
//       self.view.removeFromSuperview()
//        navigationController?.setNavigationBarHidden(false, animated: true)
     
   
     present(FamSchedViewController(), animated: true, completion: nil)
    
    }
//    func showAnimate(){
//        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//        self.view.alpha = 0.0;
//        UIView.animate(withDuration: 0.25,animations:{
//            self.view.alpha = 1.0
//            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        });
//    }
//    func removeAnimate(){
//        UIView.animate(withDuration: 0.25,animations:{
//            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//            self.view.alpha = 0.0;
//        },completion:{(finished : Bool) in
//            if(finished){
//                self.view.removeFromSuperview()
//            }
//        });
//
//    }
    
    @IBAction func addNewBtnPressed(_ sender: UIButton) {
        
        let name = memberName.text!
        let time = eventTime.text!
        let newThing = newEvent.text!
        let place = location.text!
        Newdelegate?.popDataPasstoFam(memberValue: name, timeValue: time, eventValue: newThing, locationValue: place)
        
      present(FamSchedViewController(), animated: true, completion: nil)
        
        
    

    }

    


}
