//
//  RulesTableViewCell.swift
//  ForSons
//
//  Created by Hongbo Niu on 2018-05-08.
//  Copyright © 2018 Hongbo Niu. All rights reserved.
//

import UIKit

class RulesTableViewCell: UITableViewCell {

    @IBOutlet weak var listLbl: UILabel!
    @IBOutlet weak var checkBtn: UIButton!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
  

    }
    
        required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    
    override func awakeFromNib() {
        super.awakeFromNib()
  
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
