//
//  Bus.swift
//  SwiftFinalProject
//
//  Created by Shree Marella on 2020-02-11.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation

class Bus : Vehicle
{
    var vehicleIdentificationNumber : String
    var vehicleDescription          : String
    var vehicleManufacturerName     : String
    var isSelfDrive                 : Bool
    var isInsured                   : Bool
    lazy var insuranceProviderName  : String = String();
    var noOfSeat                    : Int
    var fuelType                    : Fuel
    var baseRate                    : BaseRate
    var ratePerKm                   : RatePerKm
    var vehicleType                 : String
    var typeOfBus                   : String
    var isAccessibilityAvailable    : Bool
    var isWifiAvailable             : Bool
    lazy var driver                 : Driver = Driver();
    
    init(vehicleIdentificationNumber:String,vehicleDescription:String,vehicleManufacturerName:String,isSelfDrive:Bool,isInsured:Bool,noOfSeat:Int,fuelType:Fuel,typeOfBus:String,isAccessibilityAvailable:Bool,isWifiAvailable:Bool)
    {
        self.vehicleIdentificationNumber = vehicleIdentificationNumber
        self.vehicleDescription = vehicleDescription
        self.vehicleManufacturerName = vehicleManufacturerName
        self.isSelfDrive = isSelfDrive
        self.isInsured = isInsured
        self.noOfSeat = noOfSeat
        self.fuelType = fuelType
        self.baseRate = BaseRate.BUS
        self.ratePerKm = RatePerKm.BUS
        self.vehicleType = "Bus"
        self.typeOfBus = typeOfBus
        self.isAccessibilityAvailable = isAccessibilityAvailable
        self.isWifiAvailable = isWifiAvailable
    }
    
    func setDriver(driver:Driver) {
        self.driver = driver;
    }
    
    func setInsuranceProviderName(insuranceProviderName:String) {
        self.insuranceProviderName = insuranceProviderName;
    }
    
    func getContentTitles() -> [String] {
        return ["VIN","Description","Manufacturer","Self Drive?","Insured?","No of seat","Fuel","Base rate","Rate/Km","Vehicle Type","Type of bus","Accessibility Available?","Wifi Available?"]
    }
    
    func getContentToDisplay() -> [String] {
        return [self.vehicleIdentificationNumber,self.vehicleDescription,self.vehicleManufacturerName,"\(self.isSelfDrive)","\(self.isInsured)","\(self.noOfSeat)","\(self.fuelType)",self.baseRate.rawValue.formattedCurrency(),self.ratePerKm.rawValue.formattedCurrency(),self.vehicleType,self.typeOfBus,"\(self.isAccessibilityAvailable)","\(self.isWifiAvailable)"]
    }
    
    func Display()
    {
        print("Vehicle Identification Number : \(self.vehicleIdentificationNumber)")
        print("Vehicle Description           : \(self.vehicleDescription)")
        print("Vehicle Manufacturer Name     : \(self.vehicleManufacturerName)")
        print("isSelfDrive                   : \(self.isSelfDrive)")
        print("isInsured                     : \(self.isInsured)")
        if self.isInsured{
            print("InsuranceProviderName         : \(self.insuranceProviderName)")
        }
        print("No Of Seat                    : \(self.noOfSeat)")
        print("Fuel Type                     : \(self.fuelType)")
        print("Base Rate                     : \(self.baseRate.rawValue.formattedCurrency())")
        print("Rate Per Km                   : \(self.ratePerKm.rawValue.formattedCurrency())")
        print("Vehicle Type                  : \(self.vehicleType)")
        print("Type Of Bus                   : \(self.typeOfBus)")
        print("Is Accessibility Available    : \(self.isAccessibilityAvailable)")
        print("Is WIFI Available             : \(self.isWifiAvailable)")
        if !self.isSelfDrive{
            print("----Driver Information----")
            self.driver.Display();
        }
    }
    
}
