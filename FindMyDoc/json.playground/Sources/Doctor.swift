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
    
    public let idDoc: Int
    public let firstName: String
    public let lastName: String
    public let imageFileName: String
    public let specialty: String
    public let coordinates: Int
    var appointment: [Appointment]?
    
    
    public init(idDoctor: Int, firstName: String, lastName: String, imageFileName: String, specialty: String, coordinates: Int) {
        
        self.idDoc = idDoctor
        self.firstName = firstName
        self.lastName = lastName
        self.imageFileName = imageFileName
        self.specialty = specialty
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
    var idCustomer: Customer
    var availableForBooking: Bool
    
    
    init(idAppointment: Int, date: Date, idDoctor: Doctor, idCustomer: Customer) {
        
        self.idAppointment = idAppointment
        self.date = date
        self.idDoctor = idDoctor
        self.idCustomer = idCustomer
        self.availableForBooking = true
        
    }
    
    
//    func changeBookingStatus() -> Appointment {
//        <#function body#>
//    }
//    
    
}

