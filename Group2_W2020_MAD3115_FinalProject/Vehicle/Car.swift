//
//  Car.swift
//  SwiftFinalProject
//
//  Created by Shree Marella on 2020-02-11.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation


class Car : Vehicle
{
    var vehicleIdentificationNumber : String
    var vehicleDescription          : String
    var vehicleManufacturerName     : String
    var isSelfDrive                 : Bool
    var isInsured                   : Bool
    lazy var insuranceProviderName       : String = String()
    var noOfSeat                    : Int
    var fuelType                    : Fuel
    var baseRate                    : BaseRate
    var ratePerKm                   : RatePerKm
    var vehicleType                 : String
    var carType                     : String
    var carColour                   : String
    lazy var driver                 : Driver = Driver();
    
    init(vehicleIdentificationNumber:String,vehicleDescription:String,vehicleManufacturerName:String,isSelfDrive:Bool,isInsured:Bool,noOfSeat:Int,fuelType:Fuel,carType:String,carColour:String)
    {
        self.vehicleIdentificationNumber = vehicleIdentificationNumber
        self.vehicleDescription = vehicleDescription
        self.vehicleManufacturerName = vehicleManufacturerName
        self.isSelfDrive = isSelfDrive
        self.isInsured = isInsured
        self.noOfSeat = noOfSeat
        self.fuelType = fuelType
        self.baseRate = BaseRate.CAR
        self.ratePerKm = RatePerKm.CAR
        self.vehicleType = "Car"
        self.carType = carType
        self.carColour = carColour
    }
    
    func setDriver(driver:Driver) {
        self.driver = driver;
    }
    
    func setInsuranceProviderName(insuranceProviderName:String) {
        self.insuranceProviderName = insuranceProviderName;
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
        print("Car Type                      : \(self.carType)")
        print("Car Colour                    : \(self.carColour)")
        if !self.isSelfDrive{
            print("----Driver Information----")
            self.driver.Display();
        }
    }
}

