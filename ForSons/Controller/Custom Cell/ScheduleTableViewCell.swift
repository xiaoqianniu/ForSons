//
//  ScheduleTableViewCell.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-11.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell{
  
    

    @IBOutlet weak var familyImage: UIImageView!
    
    @IBOutlet weak var when: UILabel!
    
    @IBOutlet weak var place: UILabel!
    
    @IBOutlet weak var what: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    
}
