//
//  MototrCycle.swift
//  SwiftFinalProject
//
//  Created by Shree Marella on 2020-02-11.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation


class MotorCycle : Vehicle
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
    var maxTopSpeed                 : Int
    var mileage                     : Double
    lazy var driver                 : Driver = Driver();
    
    init(vehicleIdentificationNumber:String,vehicleDescription:String,vehicleManufacturerName:String,isSelfDrive:Bool,isInsured:Bool,noOfSeat:Int,fuelType:Fuel,maxTopSpeed:Int,mileage:Double)
    {
        self.vehicleIdentificationNumber = vehicleIdentificationNumber
        self.vehicleDescription = vehicleDescription
        self.vehicleManufacturerName = vehicleManufacturerName
        self.isSelfDrive = isSelfDrive
        self.isInsured = isInsured
        self.noOfSeat = noOfSeat
        self.fuelType = fuelType
        self.baseRate = BaseRate.MOTORCYCLE
        self.ratePerKm = .MOTORCYCLE
        self.vehicleType = "MotorCycle"
        self.maxTopSpeed = maxTopSpeed
        self.mileage = mileage
    }
    
    func setDriver(driver:Driver) {
        self.driver = driver;
    }
    
    func setInsuranceProviderName(insuranceProviderName:String) {
        self.insuranceProviderName = insuranceProviderName;
    }
    
    func Display()
    {
        print("\tVehicle Identification Number : \(self.vehicleIdentificationNumber)")
        print("\tVehicle Description           : \(self.vehicleDescription)")
        print("\tVehicle Manufacturer Name     : \(self.vehicleManufacturerName)")
        print("\tisSelfDrive                   : \(self.isSelfDrive)")
        print("\tisInsured                     : \(self.isInsured)")
        if self.isInsured{
            print("\tInsuranceProviderName         : \(self.insuranceProviderName)")
        }
        print("\tNo Of Seat                    : \(self.noOfSeat)")
        print("\tFuel Type                     : \(self.fuelType)")
        print("\tBase Rate                     : \(self.baseRate.rawValue.formattedCurrency())")
        print("\tRate Per Km                   : \(self.ratePerKm.rawValue.formattedCurrency())")
        print("\tVehicle Type                  : \(self.vehicleType)")
        print("\tMaximum Top Speed             : \(self.maxTopSpeed) Km/h")
        print("\tMileage of the Vehicle        : \(self.mileage) Km/L")
        if !self.isSelfDrive{
            print("\t----Driver Information----")
            self.driver.Display();
        }
    }
}
   
    

