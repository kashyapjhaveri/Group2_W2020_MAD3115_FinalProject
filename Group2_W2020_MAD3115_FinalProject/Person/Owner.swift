//
//  Owner.swift
//  SwiftFinalProject
//
//  Created by Gagandeep kaur on 2020-02-12.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation

class Owner : Person
{
    var id                    : Int
    var firstname             : String
    var lastname              : String
    var fullName     : String{
        return "\(self.firstname) \(self.lastname)";
    }
    var gender                : Gender
    var birthDate             : Date
    var age                   : Int
    var mobileNumber          : String
    var email                 : String
    var username              : String
    var password              : String
    var companyTitle          : String
    var businessNumber        : String
    var website               : String
    
    private lazy var listOfVehicleOwned = [String:Vehicle]();
    
    init (id: Int, firstname: String, lastname: String, gender: Gender, birthDate: Date, mobileNumber: String, email: String, username: String, password: String , companyTitle: String , businessNumber : String , website : String )
    {
        self.id             = id
        self.firstname      = firstname
        self.lastname       = lastname
        self.gender         = gender
        self.birthDate      = birthDate
        self.age            = birthDate.getAge()
        self.mobileNumber   = mobileNumber
        self.email          = email
        self.username       = username
        self.password       = password.encryptPassword()
        self.companyTitle   = companyTitle
        self.businessNumber = businessNumber
        self.website        = website
    
    }
    
    func addVehicle(vehicle:Vehicle) {
        self.listOfVehicleOwned.updateValue(vehicle, forKey: vehicle.vehicleIdentificationNumber);
    }
    
    func getListOfVehicleOwn() ->  [Vehicle] {
        return Array(self.listOfVehicleOwned.values);
    }
    
    
    func getContentTitles() -> [String] {
        return ["Owenr ID","Full Name","Gender","BirthDate","Age","Mobile No","Email","User Name","Password","Company Title","Business No","Website"];
    }
    
    static func getInputContentTitles() -> [String] {
        return ["Owner ID","First Name","Last Name","Gender","BirthDate","Mobile No","Email","User Name","Password","Company Title","Business No","Website"];
    }
    
    func getContentToDisplay() -> [String] {
        return ["\(self.id)",self.fullName,"\(self.gender)",self.birthDate.getFormattedDate(dateFormat: "dd-MMM-yyy"),"\(self.age) Years",self.mobileNumber,self.email,self.username,self.password.decryptPassword(),self.companyTitle,self.businessNumber,self.website]
    }
    
    func Display()
    {
        print("ID                 : \(self.id)")
        print("Name               : \(self.fullName)")
        print("Gender             : \(self.gender)")
        print("BirthDate          : \(self.birthDate.getFormattedDate(dateFormat: "dd-MMM-yyyy"))")
        print("Age                : \(self.age) Years")
        print("MobileNumber       : \(self.mobileNumber)")
        print("Email              : \(self.email)")
        print("Username           : \(self.username)")
        print("Password(encrypted): \(self.password)")
        print("Password           : \(self.password.decryptPassword())")
        print("CompanyTitle       : \(self.companyTitle)")
        print("BusinessNumber     : \(self.businessNumber)")
        print("Website            : \(self.website)")
        
        if !listOfVehicleOwned.isEmpty{
            print("----Vehicles Information----");
            for vehicle in listOfVehicleOwned.values {
                print("++++++++++++++++++++++++++++++")
                vehicle.Display();
                print("++++++++++++++++++++++++++++++")
            }
        }
        else{
            print("----Owner has no vehicle----");
        }
    }
}
