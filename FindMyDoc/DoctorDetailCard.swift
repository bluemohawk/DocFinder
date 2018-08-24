//
//  DoctorDetailCard.swift
//  FindMyDoc
//
//  Created by Everhard, Francois on 16.08.18.
//  Copyright © 2018 Everhard, Francois. All rights reserved.
//

import UIKit
import MapKit

class DoctorDetailCard: UIViewController {
    
    var selectedDoctor: Doctor?
    @IBOutlet weak var backgroundPicture: UIView!
    @IBOutlet weak var nameDoctor: UILabel!
    @IBOutlet weak var locationDoctor: UILabel!
    @IBOutlet weak var pictureDoctor: UIImageView!
    @IBOutlet weak var callNow: UIButton!
    @IBOutlet weak var makeAppointment: UIView!
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        callNow.layer.cornerRadius = 10
        makeAppointment.layer.cornerRadius = 10
        map.layer.cornerRadius = 10
        map.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        map.layer.borderWidth = 1.0
        
        
        let arrayImagesF = [#imageLiteral(resourceName: "doc3"), #imageLiteral(resourceName: "doc2"), #imageLiteral(resourceName: "doc4"), #imageLiteral(resourceName: "doc5")]
        let arrayImagesM = [ #imageLiteral(resourceName: "doc1")]
        
        if let selectedDoctor = selectedDoctor {
            nameDoctor?.text = "Dr \(selectedDoctor.firstName) \(selectedDoctor.lastName)"
            locationDoctor?.text = "\(selectedDoctor.specialty), \(selectedDoctor.city)"
            if selectedDoctor.gender == "M" {
                pictureDoctor.image = arrayImagesM.randomElement()
                backgroundPicture.backgroundColor = UIColor(named: "Nice Blue")
            } else {
                pictureDoctor.image = arrayImagesF.randomElement()
                backgroundPicture.backgroundColor = UIColor(named: "Nice Purple")
            }
            let doctorLocation = CLLocationCoordinate2D(latitude: selectedDoctor.coordinates.latitude, longitude: selectedDoctor.coordinates.longitude)
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = doctorLocation
            annotation.title = "Dr \(selectedDoctor.lastName)"
            map.addAnnotation(annotation)

            let coordinateRegion = MKCoordinateRegion(center: doctorLocation, latitudinalMeters: 2000, longitudinalMeters: 2000)
            
            map.setRegion(coordinateRegion, animated: true)

        }
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    
    func displayDoctorOnMap () {
        
    }
    
    @IBAction func closeThisViewController(_ sender: Any?) {

        self.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func callNumber(_ sender: UIButton!)  {
        
        
        if let sender = sender.titleLabel?.text {
            
            let alertController = UIAlertController(title: "Prendre rendez-vous avec Dr \(String(describing: selectedDoctor!.lastName))?", message: "", preferredStyle: .alert)
            
            let action1 = UIAlertAction(title: "Appelez", style: .default) { (action:UIAlertAction) in
                print(sender)
                //            guard let number = URL(string: "telprompt://" + sender) else { return }
                //            UIApplication.shared.open(number)
            }
            
            let action2 = UIAlertAction(title: "Annuler", style: .cancel) { (action:UIAlertAction) in
            }
            
            alertController.addAction(action1)
            alertController.addAction(action2)
            self.present(alertController, animated: true, completion: nil)

        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
