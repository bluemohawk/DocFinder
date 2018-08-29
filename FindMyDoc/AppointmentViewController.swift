//
//  AppointmentViewController.swift
//  FindMyDoc
//
//  Created by Francois Everhard on 25.08.18.
//  Copyright © 2018 Everhard, Francois. All rights reserved.
//

import UIKit

class AppointmentViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    var data = [Date]()
    var aDict = [[Date]]()
    @IBOutlet weak var DrCanSeeYou: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aDict = setDoctorAvailability()
        // Do any additional setup after loading the view.

        
    }
    
    @IBAction func returningtoDocDetail(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
    
        return aDict.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return aDict[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
        }
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "header", for: indexPath)
        
        let label = header.viewWithTag(200) as! UILabel
        let aDate = aDict[indexPath.section].first
        let aCal = Calendar.current
        let currentWOY = aCal.component(.weekOfYear, from: Date())
        let WOY = aCal.component(.weekOfYear, from: aDate!)
        
        var week = ""
        if WOY - currentWOY == 0 { week = "Cette semaine" }
        else if WOY - currentWOY == 1 { week = "La semaine prochaine:" }
        else if WOY - currentWOY > 1 { week = "Dans \(WOY - currentWOY) semaines:" }


        label.text = week
        return header
    }
    


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath)
//      cell.backgroundColor = .blue
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1.0
        cell.layer.cornerRadius = 10.0
        cell.layer.masksToBounds = true
                
        let date = aDict[indexPath.section][indexPath.item]
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.init(identifier: "fr_FR")
        dateFormatter.dateFormat = "EEEE dd MMMM, HH:mm"
        let string = dateFormatter.string(from: date)

        let time = cell.viewWithTag(100) as! UILabel
        time.text = string
        
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func setDoctorAvailability() -> [[Date]] {
        

        //get the current week of the Year
        let dateString = Date()
        var appointments = [Date]()
        //add 1, 2, 3 to identify the next, following and third week from today
        let weekOfYear = Calendar.current.component(.weekOfYear, from: dateString)
        //for the next 3 weeks
        for i in 0...3 {
            let nextWeek = weekOfYear + i
            //select days out of each week
            for _ in 1 ... i+1 {
                let day = [2, 3, 4, 5, 6].randomElement()
                let hour = [9, 10, 11, 14, 15, 16].randomElement()
                let min = [00, 30].randomElement()
                var component = DateComponents()
                component.weekOfYear = nextWeek
                component.weekday = day
                component.hour = hour
                component.minute = min
                component.year = 2018
                component.timeZone = TimeZone(abbreviation: "GMT")
                
                let calendar = Calendar.current
                let output = calendar.date(from: component)
                
                appointments.append(output!)
            }
            appointments.sort(){$0 < $1}
            aDict.append(appointments)
            appointments.removeAll()

        }
        
        return aDict
        
    }

}
