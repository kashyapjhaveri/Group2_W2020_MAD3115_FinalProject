//
//  Vehicle.swift
//  SwiftFinalProject
//
//  Created by Shree Marella on 2020-02-11.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation


protocol Vehicle : IDisplay
{
    var vehicleIdentificationNumber : String {get set}
    var vehicleDescription : String {get set}
    var vehicleManufacturerName : String {get set}
    var isSelfDrive : Bool {get set}
    var driver : Driver {get set}
    var isInsured : Bool {get set}
    var insuranceProviderName : String {get set}
    var noOfSeat : Int {get set}
    var fuelType : Fuel {get set}
    var baseRate : BaseRate {get set}
    var ratePerKm : RatePerKm {get set}
    var vehicleType : String {get set}
        
    func Display()

}

