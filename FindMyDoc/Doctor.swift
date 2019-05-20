//
//  Doctor.swift
//  FindMyDoc
//
//  Created by Everhard, Francois on 14.08.18.
//  Copyright © 2018 Everhard, Francois. All rights reserved.
//

import Foundation
import UIKit

public class Doctor {
    
    public let idDoc: String
    public let firstName: String
    public let lastName: String
    public let gender: String
    public let city: String
    public let imageFileName: String
    public let specialty: String
    var coordinates: (latitude: Double, longitude: Double)
    var practiceStatus: String? //e.g., "accepting patients", "Call us now", "More information"
    var appointment: [Appointment]?
    
    
    public init(idDoctor: String, firstName: String, lastName: String, gender: String, imageFileName: String, specialty: String, city: String, coordinates: (latitude: Double, longitude: Double)) {
        
        self.idDoc = idDoctor
        self.firstName = firstName
        self.lastName = lastName
        self.gender = gender
        self.imageFileName = imageFileName
        self.specialty = specialty
        self.city = city
        self.coordinates = coordinates
        
    }
    
}


class Customer {
    
    let idCustomer: Int
    let firstName: String
    let lastName: String
    var condition: String
    let coordinates: Int
    var booking: [Appointment]?
    
    init(idCustomer: Int, firstName: String, lastName: String, specialty: String, condition: String, coordinates: Int) {
        
        self.idCustomer = idCustomer
        self.firstName = firstName
        self.lastName = lastName
        self.condition = condition
        self.coordinates = coordinates
    }
    
//    func searchForPhysicians() -> [Doctor] {
//        
//    }
    
//    func searchForAvailableAppointment() -> [Appointment] {
//        <#function body#>
//    }
//
//    func selectPhysician() -> Doctor {
//        <#function body#>
//    }
//
//    func bookAppointment() -> Appointment {
//        <#function body#>
//    }
    
    
}


class Appointment {
    
    let idAppointment: Int
    let date: Date
    let idDoctor: Doctor
    var bookedByCustomerID: Customer?
    var availableForBooking: Bool
    
    init(idAppointment: Int, date: Date, idDoctor: Doctor) {
        
        self.idAppointment = idAppointment
        self.date = date
        self.idDoctor = idDoctor
        self.availableForBooking = true
        
    }
    
    func changeBookingStatus(selectedAppointment: Appointment) -> Appointment {
        
        if selectedAppointment.availableForBooking == true
        { selectedAppointment.availableForBooking = false }
        else { selectedAppointment.availableForBooking = true }
        
        return selectedAppointment
        }
}

struct Colors {
    let theme: String
    let dominantColor: String
    let fontColor: String
    let accentColor: String
}
