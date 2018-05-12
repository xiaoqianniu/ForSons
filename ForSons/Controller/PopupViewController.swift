//
//  PopupViewController.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-11.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {
    
    @IBOutlet weak var memberName: UITextField!
    
    @IBOutlet weak var newEvent: UITextField!
    
    @IBOutlet weak var eventTime: UITextField!
    
    @IBOutlet weak var location: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//         self.edgesForExtendedLayout = []
//        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.8)
       
       self.showAnimate()
    }
   
    
    
    @IBAction func cancelBtn(_ sender: UIButton) {
       self.removeAnimate()
//       self.view.removeFromSuperview()
//        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.isNavigationBarHidden = false
    }
    func showAnimate(){
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25,animations:{
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    func removeAnimate(){
        UIView.animate(withDuration: 0.25,animations:{
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        },completion:{(finished : Bool) in
            if(finished){
                self.view.removeFromSuperview()
            }
        });

    }
    
    @IBAction func addNewBtnPressed(_ sender: UIButton) {
        
    }



    


}
