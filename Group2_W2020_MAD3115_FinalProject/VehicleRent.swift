//
//  VehicleRent.swift
//  SwiftFinalProject
//
//  Created by Kashyap Jhaveri on 2020-02-24.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation

class VehicleRent: IDisplay {
    var startDate:Date;
    var endDate:Date;
    var noOfDays:Int;
    var noOfKmDriven:Int;
    var totalBill:Double = 0.0;
    var vehicleRented:Vehicle;

    init(startDate:Date,endDate:Date,noOfKmDriven:Int,vehicleRented:Vehicle) {
        self.startDate = startDate;
        self.endDate = endDate;
        self.noOfDays = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day!;
        self.noOfKmDriven = noOfKmDriven;
        self.vehicleRented = vehicleRented;
        calculateBill();
    }
    
    static func getInputContentTitles() -> [String] {
        return ["Vehicle","Start Date","End Date","No of Km Driven"];
    }
    
    private func calculateBill() {
        self.totalBill = (vehicleRented.baseRate.rawValue * Double(noOfDays)) + (vehicleRented.ratePerKm.rawValue * Double(noOfKmDriven));
    }
    
    
    func Display() {
        print("\tStart Date:-     : \(self.startDate.getFormattedDate(dateFormat: "dd-MMM-yyyy"))");
        print("\tStart Date:-     : \(self.endDate.getFormattedDate(dateFormat: "dd-MMM-yyyy"))");
        print("\tNo of Days       : \(self.noOfDays)");
        print("\tNo of km driven  : \(self.noOfKmDriven)");
        print("\tVehicle Rented   : \(self.vehicleRented.vehicleIdentificationNumber)");
        print("\t######### Total Bill:-  \(self.totalBill.formattedCurrency()) ##########");
    }
    
}
