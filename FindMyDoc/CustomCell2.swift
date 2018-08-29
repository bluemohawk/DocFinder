//
//  CustomCell2TableViewCell.swift
//  FindMyDoc
//
//  Created by Francois Everhard on 19.08.18.
//  Copyright © 2018 Everhard, Francois. All rights reserved.
//

import UIKit

class CustomCell2: UITableViewCell {
    
    @IBOutlet weak var identityLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var availability: UIButton!
    @IBOutlet weak var proximity: UILabel!
    var availabilityStatus = true

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        identityLabel.backgroundColor = #colorLiteral(red: 0.1154340729, green: 0.2346189618, blue: 0.437733233, alpha: 1)
        
//        infoLabel.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        
        availability.layer.cornerRadius = 10
        availability.layer.masksToBounds = true
        availability.titleLabel?.adjustsFontSizeToFitWidth = true
        availability.titleLabel?.textAlignment = .center

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
   
    @IBAction func AvailabiltyPressed(_ sender: UIButton!) {
        if availabilityStatus == true {
            sender.setTitle("Call us now", for: .normal)
            availabilityStatus = false
            availability?.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
            
        } else {
            sender.setTitle("Available", for: .normal)
            availabilityStatus = true
            availability?.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            
        }
    }
    
    

}
