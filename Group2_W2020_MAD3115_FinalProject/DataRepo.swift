//
//  DataRepo.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-18.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation

class DataRepo {
    private static let instance = DataRepo()
    private var CustomersDT = [Int: Customer]()
    private var ownersDT = [Int : Owner]()
    private var DriversDT = [Int: Driver]()
    private var BusesDT = [String : Bus]()
    private var MotorcyclesDT = [String : MotorCycle]()
    private var CarsDT = [String : Car]()
    
    private init() {}
    
    public static func getInstance() -> DataRepo{
        return self.instance;
    }
}

extension DataRepo{  //Part of DataRepo Class to manage customers
    
    public func readCustomersToDictonary()  {
        let readFileInstance = ReadFile.getInsatnce();
        
        do {
            let json = try readFileInstance.readJSONFile(fileName: "Customers")

            if let customers = json as? [Any]{
                
                for customer in customers {
                    var tempGender:Gender;
                    let cust = customer as! [String:Any];
                    
                    let tempDate = Date.from(date: cust["birthDate"] as! String)
                    
                    if Date().compare(tempDate!).rawValue < 1{
                        print("Birth Date cannot be greater than current date for customer Id:- \(cust["id"] as! Int)")
                    }
                    else{
                        if cust["gender"] as! String == "Male"{
                            tempGender = Gender.Male;
                        }
                        else if cust["gender"] as! String == "Female"
                        {
                            tempGender = Gender.Female;
                        }
                        else{
                            tempGender = Gender.Others;
                        }
                        
                        let tempObj = Customer(id: cust["id"] as! Int, firstname: cust["firstName"] as! String, lastname: cust["lastName"] as! String, gender: tempGender, birthDate:tempDate!, mobileNumber: cust["mobileNumber"] as! String, email: cust["email"] as! String, username: cust["userName"] as! String, password: cust["password"] as! String, address: cust["address"] as! String, city: cust["city"] as! String)
                        
                        self.CustomersDT.updateValue(tempObj, forKey: cust["id"] as! Int);
                    }
                }
            }
        }
        catch FileExceptions.fileNotFound{
            print("File not found")
        }
        catch FileExceptions.dataReadingError {
            print("Error while reading data from file");
        }
        catch FileExceptions.errorPasingToJSON{
            print("Error while parsing data to json")
        }
        catch {
            print("Invalid Error")
        }
    }
    
    func getAllCustomers() -> [Customer] {
        return Array(self.CustomersDT.values);
    }
    
}


extension DataRepo{  //Part of DataRepo Class to manage owners
    
    func readOwnersToDictonary()  {
        let readFileInstance = ReadFile.getInsatnce();
        
        do {
            let json = try readFileInstance.readJSONFile(fileName: "Owners")

            if let owners = json as? [Any]{
                
                for owner in owners {
                    var tempGender:Gender;
                    let own = owner as! [String:Any];
                    
                    let tempDate = Date.from(date: own["birthDate"] as! String)
                    
                    if Date().compare(tempDate!).rawValue < 1{
                        print("Birth Date cannot be greater than current date for owner Id:- \(own["id"] as! Int)")
                    }
                    else {
                    
                        if own["gender"] as! String == "Male"{
                            tempGender = Gender.Male;
                        }
                        else if own["gender"] as! String == "Female"
                        {
                            tempGender = Gender.Female;
                        }
                        else{
                            tempGender = Gender.Others;
                        }
                        
                        let tempObj = Owner(id: own["id"] as! Int, firstname: own["firstName"] as! String, lastname: own["lastName"] as! String, gender: tempGender, birthDate: tempDate!,mobileNumber: own["mobileNumber"] as! String, email: own["email"] as! String, username: own["userName"] as! String, password: own["password"] as! String, companyTitle: own["companyTitle"] as! String, businessNumber: own["businessLandlineNumber"] as! String, website: own["website"] as! String);
                        
                        self.ownersDT.updateValue(tempObj, forKey: own["id"] as! Int)
                    }
                }
            }
        }
        catch FileExceptions.fileNotFound{
            print("File not found")
        }
        catch FileExceptions.dataReadingError {
            print("Error while reading data from file");
        }
        catch FileExceptions.errorPasingToJSON{
            print("Error while parsing data to json")
        }
        catch {
            print("Invalid Error")
        }
    }
    
    
    func getAllOwners() -> [Owner] {
        return Array(self.ownersDT.values);
    }
    
}


extension DataRepo{   //Part of DataRepo Class to manage drivers
    
    func readDriversToDictonary()  {
        let readFileInstance = ReadFile.getInsatnce();
        
        do {
            let json = try readFileInstance.readJSONFile(fileName: "Drivers")

            if let drivers = json as? [Any]{
                
                for driver in drivers {
                    var tempGender:Gender;
                    let dri = driver as! [String:Any];
                    
                    let tempDate = Date.from(date: dri["birthDate"] as! String)
                    
                    if Date().compare(tempDate!).rawValue < 1{
                        print("Birth Date cannot be greater than current date for owner Id:- \(dri["id"] as! Int)")
                    }
                    else{
                        if dri["gender"] as! String == "Male"{
                            tempGender = Gender.Male;
                        }
                        else if dri["gender"] as! String == "Female"
                        {
                            tempGender = Gender.Female;
                        }
                        else{
                            tempGender = Gender.Others;
                        }
                        
                       let tempObj = Driver(id: dri["id"] as! Int, firstname: dri["firstName"] as! String, lastname: dri["lastName"] as! String, gender: tempGender, birthDate: tempDate!,mobileNumber: dri["mobileNumber"] as! String, email: dri["email"] as! String, username: dri["userName"] as! String, password: dri["password"] as! String, drivingLicenceNumber: dri["drivingLicenceNumber"] as! String, isHistoryCleared: dri["isHistoryCleared"] as! Bool, salary: dri["salary"] as! Double
                        );
                        self.DriversDT.updateValue(tempObj, forKey: dri["id"] as! Int);
                    }
                }
            }
        }
        catch FileExceptions.fileNotFound{
            print("File not found")
        }
        catch FileExceptions.dataReadingError {
            print("Error while reading data from file");
        }
        catch FileExceptions.errorPasingToJSON{
            print("Error while parsing data to json")
        }
        catch {
            print("Invalid Error")
        }
    }
    
    
    func getAllDrivers() -> [Driver] {
        return Array(self.DriversDT.values);
    }
}


extension DataRepo{   //Part of DataRepo Class to manage buses
    
    func readBusesToDictonary()  {
        let readFileInstance = ReadFile.getInsatnce();
        
        do {
            let json = try readFileInstance.readJSONFile(fileName: "Buses")

            if let buses = json as? [Any]{
                
                for bus in buses {
                    var tempFuelType:Fuel;
                    let b = bus as! [String:Any];
                    
                    if b["fuelType"] as! String == "Petrol"
                    {
                        tempFuelType = .PETROL;
                    }
                    else if b["fuelType"] as! String == "Desiel"
                    {
                        tempFuelType = .DIESEL;
                    }
                    else{
                        tempFuelType = .ELETRIC;
                    }
                    
                    let tempObj = Bus(vehicleIdentificationNumber: b["VIN"] as! String, vehicleDescription: b["vehicleDescription"] as! String, vehicleManufacturerName: b["manufacturerName"] as! String, isSelfDrive: b["isSelfDrive"] as! Bool, isInsured: b["isInsured"] as! Bool, noOfSeat: b["noOfSeat"] as! Int, fuelType: tempFuelType, typeOfBus: b["typeOfBus"] as! String, isAccessibilityAvailable: b["isAccessibilityAvailable"] as! Bool, isWifiAvailable: b["isWifiAvailable"] as! Bool);

                    if tempObj.isInsured == true {
                        tempObj.setInsuranceProviderName(insuranceProviderName: b["insuranceProviderName"] as! String)
                    }

                    if tempObj.isSelfDrive == false{
                        guard let driver = self.DriversDT[b["driver"] as! Int] else {
                            throw DriverExceptions.driverObjectNotFound
                        }
                        tempObj.setDriver(driver: driver);
                    }

                    self.BusesDT.updateValue(tempObj, forKey: b["VIN"] as! String);
                }
            }
        }
        catch FileExceptions.fileNotFound{
            print("File not found")
        }
        catch FileExceptions.dataReadingError {
            print("Error while reading data from file");
        }
        catch FileExceptions.errorPasingToJSON{
            print("Error while parsing data to json")
        }
        catch DriverExceptions.driverObjectNotFound{
            print("Driver object not found while paring buses");
        }
        catch {
            print("Invalid Error")
        }
    }

    func getAllBuses() -> [Bus] {
        return Array(self.BusesDT.values);
    }
}

extension DataRepo{ //Part of DataRepo Class to manage MotorCycles
    
    func readMotocyclesToDictonary()  {
        let readFileInstance = ReadFile.getInsatnce();
        
        do {
            let json = try readFileInstance.readJSONFile(fileName: "MotorCycles")

            if let motorCycles = json as? [Any]{
                
                for motorCycle in motorCycles {
                    var tempFuelType:Fuel;
                    let m = motorCycle as! [String:Any];
                    
                    if m["fuelType"] as! String == "Petrol"
                    {
                        tempFuelType = .PETROL;
                    }
                    else if m["fuelType"] as! String == "Desiel"
                    {
                        tempFuelType = .DIESEL;
                    }
                    else{
                        tempFuelType = .ELETRIC;
                    }
                    
                    let tempObj = MotorCycle(vehicleIdentificationNumber: m["VIN"] as! String, vehicleDescription: m["vehicleDescription"] as! String, vehicleManufacturerName: m["manufacturerName"] as! String, isSelfDrive: m["isSelfDrive"] as! Bool, isInsured: m["isInsured"] as! Bool, noOfSeat: m["noOfSeat"] as! Int, fuelType: tempFuelType, maxTopSpeed: m["maxTopSpeed"] as! Int, mileage: m["milage"] as! Double)
                    
                    if tempObj.isInsured == true {
                        tempObj.setInsuranceProviderName(insuranceProviderName: m["insuranceProviderName"] as! String)
                    }

                    if tempObj.isSelfDrive == false{
                        guard let driver = self.DriversDT[m["driver"] as! Int] else {
                            throw DriverExceptions.driverObjectNotFound
                        }
                        tempObj.setDriver(driver: driver);
                    }

                    self.MotorcyclesDT.updateValue(tempObj, forKey: m["VIN"] as! String);
                }
            }
        }
        catch FileExceptions.fileNotFound{
            print("File not found")
        }
        catch FileExceptions.dataReadingError {
            print("Error while reading data from file");
        }
        catch FileExceptions.errorPasingToJSON{
            print("Error while parsing data to json")
        }
        catch DriverExceptions.driverObjectNotFound{
            print("Driver object not found while paring buses");
        }
        catch {
            print("Invalid Error")
        }
    }
    
    func getAllMotorCycles() -> [MotorCycle] {
        return Array(self.MotorcyclesDT.values);
    }
}


extension DataRepo{ //Part of DataRepo Class to manage cars
    func readCarsToDictonary()  {
        let readFileInstance = ReadFile.getInsatnce();
        
        do {
            let json = try readFileInstance.readJSONFile(fileName: "Cars")

            if let cars = json as? [Any]{
                
                for car in cars {
                    var tempFuelType:Fuel;
                    let c = car as! [String:Any];
                    
                    if c["fuelType"] as! String == "Petrol"
                    {
                        tempFuelType = .PETROL;
                    }
                    else if c["fuelType"] as! String == "Desiel"
                    {
                        tempFuelType = .DIESEL;
                    }
                    else{
                        tempFuelType = .ELETRIC;
                    }
                    
                    let tempObj = Car(vehicleIdentificationNumber:  c["VIN"] as! String, vehicleDescription: c["vehicleDescription"] as! String, vehicleManufacturerName: c["manufacturerName"] as! String, isSelfDrive: c["isSelfDrive"] as! Bool, isInsured: c["isInsured"] as! Bool, noOfSeat: c["noOfSeat"] as! Int, fuelType: tempFuelType, carType: c["carType"] as! String, carColour: c["carColor"] as! String);
                    
                    if tempObj.isInsured == true {
                        tempObj.setInsuranceProviderName(insuranceProviderName: c["insuranceProviderName"] as! String)
                    }

                    if tempObj.isSelfDrive == false{
                        guard let driver = self.DriversDT[c["driver"] as! Int] else {
                            throw DriverExceptions.driverObjectNotFound
                        }
                        tempObj.setDriver(driver: driver);
                    }

                    self.CarsDT.updateValue(tempObj, forKey: c["VIN"] as! String);
                }
            }
        }
        catch FileExceptions.fileNotFound{
            print("File not found")
        }
        catch FileExceptions.dataReadingError {
            print("Error while reading data from file");
        }
        catch FileExceptions.errorPasingToJSON{
            print("Error while parsing data to json")
        }
        catch DriverExceptions.driverObjectNotFound{
            print("Driver object not found while paring buses");
        }
        catch {
            print("Invalid Error")
        }
    }
    
    func getAllCars() -> [Car] {
        return Array(self.CarsDT.values);
    }
}
