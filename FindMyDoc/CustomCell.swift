////
////  CustomCell.swift
////  FindMyDoc
////
////  Created by Everhard, Francois on 16.08.18.
////  Copyright © 2018 Everhard, Francois. All rights reserved.
////
//
//import UIKit
//
//class CustomCell: UITableViewCell {
//    
//    weak var identityLabel: UILabel?
//    weak var infoLabel: UILabel?
//    weak var availability: UIButton!
//    var availabilityStatus = true
////   
//    
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        
//        let identityLabel = UILabel()
//        identityLabel.translatesAutoresizingMaskIntoConstraints = false
//        identityLabel.font = .preferredFont(forTextStyle: .body)
//        identityLabel.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
////        identityLabel.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
//        contentView.addSubview(identityLabel)
//        self.identityLabel = identityLabel
//        
//        let infoLabel = UILabel()
//        infoLabel.translatesAutoresizingMaskIntoConstraints = false
//        infoLabel.font = .preferredFont(forTextStyle: .body)
//        infoLabel.backgroundColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
////        infoLabel.textColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
//        contentView.addSubview(infoLabel)
//        self.infoLabel = infoLabel
//        
//        let availability = UIButton()
//        availability.layer.cornerRadius = 10
//        availability.layer.masksToBounds = true
//        availability.translatesAutoresizingMaskIntoConstraints = false
//        availability.addTarget(self, action: #selector(AvailabiltyPressed), for: .touchUpInside)
//        availability.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
//        availability.tintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
//        self.availability = availability
//        
//        contentView.addSubview(availability)
//        
//        
//        NSLayoutConstraint.activate([
//            
//            identityLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            identityLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.frame.width*0.25),
//            identityLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
//            identityLabel.bottomAnchor.constraint(equalTo: infoLabel.topAnchor, constant: 1),
//            
//            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
//            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -contentView.frame.width*0.25),
//            //            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 1),
//            infoLabel.heightAnchor.constraint(equalTo: identityLabel.heightAnchor, constant: 1),
//            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -1),
//            
//            availability.leadingAnchor.constraint(equalTo: identityLabel.trailingAnchor, constant: -10),
//            availability.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
//            availability.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
//            availability.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5)
//            
//            ])
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    @objc func AvailabiltyPressed(sender: UIButton!) {
//        if availabilityStatus == true {
//            sender.setTitle("Selected", for: .normal)
//            availabilityStatus = false
//            availability?.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
//            
//        } else {
//            sender.setTitle("Available", for: .normal)
//            availabilityStatus = true
//            availability?.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
//            
//        }
//    }
//    
//    
//}
