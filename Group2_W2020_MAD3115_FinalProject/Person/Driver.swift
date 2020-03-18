//
//  Driver.swift
//  SwiftFinalProject
//
//  Created by Gagandeep kaur on 2020-02-12.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation

class Driver : Person
{
    var id                    : Int     = Int()
    var firstname             : String  = String()
    var lastname              : String  = String()
    var fullName     : String{
        return "\(self.firstname) \(self.lastname)";
    }
    var gender                : Gender  = .Others
    var birthDate             : Date    = Date();
    var age                   : Int     = Int()
    var mobileNumber          : String  = String()
    var email                 : String  = String()
    var username              : String  = String()
    var password              : String  = String()
    var drivingLicenceNumber  : String  = String()
    var isHistoryCleared      : Bool    = Bool()
    var salary                : Double  = Double()
    
    
    init() {}
    
    
    init (id: Int, firstname: String, lastname: String, gender: Gender, birthDate: Date, mobileNumber: String, email: String, username: String, password: String , drivingLicenceNumber : String ,isHistoryCleared : Bool , salary : Double )
    {
        self.id                   = id
        self.firstname            = firstname
        self.lastname             = lastname
        self.gender               = gender
        self.birthDate            = birthDate
        self.age                  = birthDate.getAge()
        self.mobileNumber         = mobileNumber
        self.email                = email
        self.username             = username
        self.password             = password.encryptPassword()
        self.drivingLicenceNumber = drivingLicenceNumber
        self.isHistoryCleared     = isHistoryCleared
        self.salary               = salary
        
    }
    
    
    func Display()
    {
        print("\t\tID                            : \(self.id)")
        print("\t\tName                          : \(self.fullName)")
        print("\t\tGender                        : \(self.gender)")
        print("\t\tBirthDate                     : \(self.birthDate.getFormattedDate(dateFormat: "dd-MMM-yyyy"))")
        print("\t\tAge                           : \(self.age) Years")
        print("\t\tMobileNumber                  : \(self.mobileNumber)")
        print("\t\tEmail                         : \(self.email)")
        print("\t\tUsername                      : \(self.username)")
        print("\t\tPassword(encrypted)           : \(self.password)")
        print("\t\tPassword                      : \(self.password.decryptPassword())")
        print("\t\tdrivingLicenceNumber          : \(self.drivingLicenceNumber)")
        print("\t\tisHistoryCleared              : \(self.isHistoryCleared)")
        print("\t\tsalary                        : \(self.salary.formattedCurrency())")
    }
}
