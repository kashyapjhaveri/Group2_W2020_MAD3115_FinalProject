//
//  customer.swift
//  SwiftFinalProject
//
//  Created by gagandeep kaur on 2020-02-12.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation

class Customer: Person
{
    
    var id           : Int
    var firstname    : String
    var lastname     : String
    var fullName     : String{
        return "\(self.firstname) \(self.lastname)";
    }
    var gender       : Gender
    var birthDate    : Date
    var age          : Int
    var mobileNumber : String
    var email        : String
    var username     : String
    var password     : String
    var address      : String
    var city         : String
    
    private lazy var listOfVehicleRented = [String:VehicleRent]();
    
    init (id: Int, firstname: String, lastname: String, gender: Gender, birthDate: Date, mobileNumber: String, email: String, username: String, password: String  , address : String , city : String )
    {
        self.id           = id
        self.firstname    = firstname
        self.lastname     = lastname
        self.gender       = gender
        self.birthDate    = birthDate
        self.age          = birthDate.getAge()
        self.mobileNumber = mobileNumber
        self.email        = email
        self.username     = username
        self.address      = address
        self.city         = city
        self.password     = password.encryptPassword();
    }
    
    func addRentedVehicle(tempVehicle:VehicleRent) {
        self.listOfVehicleRented.updateValue(tempVehicle, forKey: tempVehicle.vehicleRented.vehicleIdentificationNumber);
    }
    
    func getListOfVehicleRented() -> [VehicleRent] {
        return Array(self.listOfVehicleRented.values);
    }
    
    func getContentTitles() -> [String] {
        return ["Customer ID","Full Name","Gender","BirthDate","Age","Mobile No","Email","User Name","Password","Address","City"];
    }
    
    static func getInputContentTitles() -> [String] {
        return ["Customer ID","First Name","Last Name","Gender","BirthDate","Mobile No","Email","User Name","Password","Address","City"];
    }
    
    func getContentToDisplay() -> [String] {
        return ["\(self.id)",self.fullName,"\(self.gender)",self.birthDate.getFormattedDate(dateFormat: "dd-MMM-yyy"),"\(self.age) Years",self.mobileNumber,self.email,self.username,self.password.decryptPassword(),self.address,self.city]
    }
    
    
     func Display()
     {
        print ("ID                  : \(self.id)")
        print ("Firstname           : \(self.firstname)")
        print ("Lastname            : \(self.lastname)")
        print ("Gender              : \(self.gender)")
        print ("BirthDate           : \(self.birthDate.getFormattedDate(dateFormat: "dd-MMM-yyyy"))")
        print ("Age                 : \(self.age) Years")
        print ("MobileNumber        : \(self.mobileNumber)")
        print ("Email               : \(self.email)")
        print ("Username            : \(self.username)")
        print ("Password(encrypted) : \(self.password)")
        print ("Password            : \(self.password.decryptPassword())")
        print ("Address             : \(self.address)")
        print ("City                : \(self.city)")
        
        
        if !listOfVehicleRented.isEmpty{
            print("----Vehicle Rent Information----");
            for vehicleRented in listOfVehicleRented.values {
                print("++++++++++++++++++++++++++++++");
                vehicleRented.Display();
                print("++++++++++++++++++++++++++++++");
            }
            
        }
        else{
            print("Customer has not rented any vehicle")
        }
    }
}




