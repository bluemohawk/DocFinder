//
//  FirstViewController.swift
//  FindMyDoc
//
//  Created by Everhard, Francois on 14.08.18.
//  Copyright © 2018 Everhard, Francois. All rights reserved.
//



import UIKit

class FirstViewController : UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var listingOfDoctors: [Doctor]!
  //  weak var tableView : UITableView! // *
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Initial table setup from JSON - need an API connection
        setDoctorsTable()
        
//        self.view = UITableView(frame: CGRect(), style: .plain)
//        self.tableView = self.view as? UITableView
                
        tableView.delegate = self
        tableView.dataSource = self
        
//        self.tableView.reloadData()

//        tableView.register(CustomCell.self, forCellReuseIdentifier: "CustomCell2")
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listingOfDoctors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell2", for: indexPath) as! CustomCell2
        
        let aInput = listingOfDoctors[indexPath.row]
        
        cell.identityLabel?.text = "Dr \(aInput.firstName) \(aInput.lastName)"
        cell.identityLabel?.textAlignment = .left
        
        cell.infoLabel?.text = "\(aInput.specialty), \(aInput.city)"
        cell.infoLabel?.textAlignment = .left
    
//        cell.proximity?.text = "\(aInput.city)"
        
        cell.availability?.setTitle("\(aInput.practiceStatus ?? "NA")", for: .normal)

        if aInput.practiceStatus == "2 rendez-vous disponibles" {
            
            cell.availability.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
            cell.availability.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            cell.availability.layer.borderColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.availability.layer.borderWidth = 0.0

            
        } else {
            cell.availability.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            cell.availability.setTitleColor(#colorLiteral(red: 0.1411764706, green: 0.1647058824, blue: 0.368627451, alpha: 1), for: .normal)
            cell.availability.layer.borderColor = #colorLiteral(red: 0.1411764706, green: 0.1647058824, blue: 0.368627451, alpha: 1)
            cell.availability.layer.borderWidth = 1.0
            
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        // in case of a storyboard segue --> performSegue(withIdentifier: "pushSegue", sender: nil)
        
        // transitionning to new VC without segue
        let sb = UIStoryboard(name: "Main", bundle: nil)
        if let secondVC = sb.instantiateViewController(withIdentifier: "DoctorInformationCard") as? DoctorDetailCard {
            let aInput = listingOfDoctors[indexPath.row]
            secondVC.selectedDoctor = aInput
             self.present(secondVC, animated: true, completion: nil)
        }
    }
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//
//        }

    
    //    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    //        return "Section \(section)"
    //    }
    
    
    //TEMP: convenient function
    func setDoctorsTable() {
        
        var anArray = [Doctor]()

        guard let url = Bundle.main.url(forResource: "HCPS Paris", withExtension: "json") else {
            return }
        
        do {
            
            let data = try Data(contentsOf: url)
            guard let doctors = try JSONSerialization.jsonObject(with: data, options:[]) as? [Any] else {
                return }
            
            for doctor in  doctors {
                guard let aDoc = doctor as? [String: Any] else {return}
                guard let id = aDoc["id"] as? String else {return}
                guard let firstName = aDoc["First Name"] as? String else {return}
                guard let lastName = aDoc["Last Name"] as? String else {return}
                guard let gender = aDoc["Gender"] as? String else {return}
                guard let city = aDoc["City"] as? String else {return}
                guard let latitude = aDoc["latitude"] as? Double else { return }
                guard let longitude = aDoc["longitude"] as? Double else { return }
                
                //TODO: image file names need to be implemented properlly. Currrently implemented in convenient method
                let imageFileName = "test"
//                if gender == "M" { imageFileName = ""} else { imageFileName = ""}
                
                let Doc = Doctor(idDoctor: id, firstName: firstName, lastName: lastName, gender: gender, imageFileName: imageFileName, specialty: "Neurologue",city: city, coordinates: (latitude: latitude, longitude: longitude))
                
                
                let array = ["Voir nos\nhoraires", "Prendre\nRDV", "2 rendez-vous disponibles"]
                Doc.practiceStatus = array.randomElement()
                anArray.append(Doc)

            }
        
            self.listingOfDoctors = anArray
            
        } catch {
            print("hello")
        }
    }
    
}
