//
//  ViewController.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-17.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var segBaseClass: UISegmentedControl!
    @IBOutlet weak var segChlidClass: UISegmentedControl!
    @IBOutlet weak var tblList: UITableView!
    
    private func fillChildSegment(){
        if segBaseClass.selectedSegmentIndex == 0 {
            segChlidClass.setTitle("Customers", forSegmentAt: 0);
            segChlidClass.setTitle("Owenrs", forSegmentAt: 1);
            segChlidClass.setTitle("Drivers", forSegmentAt: 2);
        }
        else{
            segChlidClass.setTitle("Buses", forSegmentAt: 0);
            segChlidClass.setTitle("MotorCycles", forSegmentAt: 1);
            segChlidClass.setTitle("Cars", forSegmentAt: 2);
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillChildSegment();
        // Do any additional setup after loading the view.
    }

    @IBAction func segBaseValueChange(_ sender: UISegmentedControl) {
        fillChildSegment();
        tblList.reloadData();
    }
    
    @IBAction func segChildValueChange(_ sender: UISegmentedControl) {
        tblList.reloadData();
    }
}

extension HomeViewController:UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if segBaseClass.selectedSegmentIndex == 0 {
            if  segChlidClass.selectedSegmentIndex == 0 {
                return DataRepo.getInstance().getAllCustomers().count
            }
            else if segChlidClass.selectedSegmentIndex == 1{
                return DataRepo.getInstance().getAllOwners().count;
            }
            else if segChlidClass.selectedSegmentIndex == 2{
                return DataRepo.getInstance().getAllDrivers().count;
            }
        }
        else if segBaseClass.selectedSegmentIndex == 1{
            if  segChlidClass.selectedSegmentIndex == 0 {
                return DataRepo.getInstance().getAllDrivers().count
            }
            else if segChlidClass.selectedSegmentIndex == 1{
                return DataRepo.getInstance().getAllMotorCycles().count;
            }
            else if segChlidClass.selectedSegmentIndex == 2{
                return DataRepo.getInstance().getAllCars().count;
            }
        }
        return 0;
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath);
        let dataRepo = DataRepo.getInstance();
        
        if segBaseClass.selectedSegmentIndex == 0 {
            if  segChlidClass.selectedSegmentIndex == 0 {
                
                let customer = dataRepo.getAllCustomers()[indexPath.row];
                
                cell.textLabel?.text = customer.fullName;
                cell.detailTextLabel?.text = "Customer";
            }
            else if segChlidClass.selectedSegmentIndex == 1{
                
                let owner = dataRepo.getAllOwners()[indexPath.row]
            
                cell.textLabel?.text = owner.fullName;
                cell.detailTextLabel?.text = "Owner";
            }
            else if segChlidClass.selectedSegmentIndex == 2{
                let driver = dataRepo.getAllDrivers()[indexPath.row]
                
                cell.textLabel?.text = driver.fullName;
                cell.detailTextLabel?.text = "Driver";
            }
        }
        else if segBaseClass.selectedSegmentIndex == 1{
            if  segChlidClass.selectedSegmentIndex == 0 {
                
                let bus = dataRepo.getAllBuses()[indexPath.row];
                
                cell.textLabel?.text = bus.vehicleManufacturerName;
                cell.detailTextLabel?.text = bus.vehicleType;
            }
            else if segChlidClass.selectedSegmentIndex == 1{

                let motorCycle = dataRepo.getAllMotorCycles()[indexPath.row]

                cell.textLabel?.text = motorCycle.vehicleManufacturerName;
                cell.detailTextLabel?.text = "MotorCycle";
            }
            else if segChlidClass.selectedSegmentIndex == 2{
                let car = dataRepo.getAllCars()[indexPath.row]

                cell.textLabel?.text = car.vehicleManufacturerName;
                cell.detailTextLabel?.text = "Car";
            }
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var contentTitle:[String] = [String]();
        var contentToDisplay:[String] = [String]();
        
        var nextVcTitle:String = String();
        let dataRepo = DataRepo.getInstance();
        
       if segBaseClass.selectedSegmentIndex == 0 {
            if  segChlidClass.selectedSegmentIndex == 0 {
                let customer = dataRepo.getAllCustomers()[indexPath.row];
                
                contentTitle = ["Customer ID","Full Name","Gender","BirthDate","Age","Mobile No","Email","Address","City"];
                contentToDisplay = ["\(customer.id)",customer.fullName,"\(customer.gender)",customer.birthDate.getFormattedDate(dateFormat: "dd-MMM-yyy"),"\(customer.age) Years",customer.mobileNumber,customer.email,customer.address,customer.city]
                
                
                nextVcTitle = "Customer's Details";
            }
            else if segChlidClass.selectedSegmentIndex == 1{
                
                let owner = dataRepo.getAllOwners()[indexPath.row]
                
                contentTitle = ["Owenr ID","Full Name","Gender","BirthDate","Age","Mobile No","Email","Company Title","Business No","Website"];
                contentToDisplay = ["\(owner.id)",owner.fullName,"\(owner.gender)",owner.birthDate.getFormattedDate(dateFormat: "dd-MMM-yyy"),"\(owner.age) Years",owner.mobileNumber,owner.email,owner.companyTitle,owner.businessNumber,owner.website];
                
                nextVcTitle = "Owner's Details";
                
            }
            else if segChlidClass.selectedSegmentIndex == 2{
                let driver = dataRepo.getAllDrivers()[indexPath.row]
                
                contentTitle = ["Driver ID","Full Name","Gender","BirthDate","Age","Mobile No","Email","DL Number","History Cleared?","Salary"];
                contentToDisplay = ["\(driver.id)",driver.fullName,"\(driver.gender)",driver.birthDate.getFormattedDate(dateFormat: "dd-MMM-yyy"),"\(driver.age) Years",driver.mobileNumber,driver.email,driver.drivingLicenceNumber,"\(driver.isHistoryCleared)",driver.salary.formattedCurrency()];
               
                nextVcTitle = "Driver's Details";
            }
        }
        else if segBaseClass.selectedSegmentIndex == 1{
            if  segChlidClass.selectedSegmentIndex == 0 {
                let bus = dataRepo.getAllBuses()[indexPath.row];
                
                contentTitle = ["VIN","Description","Manufacturer","Self Drive?","Insured?","No of seat","Fuel","Base rate","Rate/Km","Vehicle Type","Type of bus","Accessibility Available?","Wifi Available?"];
                contentToDisplay = [bus.vehicleIdentificationNumber,bus.vehicleDescription,bus.vehicleManufacturerName,"\(bus.isSelfDrive)","\(bus.isInsured)","\(bus.noOfSeat)","\(bus.fuelType)",bus.baseRate.rawValue.formattedCurrency(),bus.ratePerKm.rawValue.formattedCurrency(),bus.vehicleType,bus.typeOfBus,"\(bus.isAccessibilityAvailable)","\(bus.isWifiAvailable)"];
                
                if bus.isInsured{
                    contentTitle.append("Insurance Provider")
                    contentToDisplay.append(bus.insuranceProviderName)
                }
                    
                nextVcTitle = "Bus's Details";
            }
            else if segChlidClass.selectedSegmentIndex == 1{
                
                let motorCycle = dataRepo.getAllMotorCycles()[indexPath.row]
                contentTitle = ["VIN","Description","Manufacturer","Self Drive?","Insured?","No of seat","Fuel","Base rate","Rate/Km","Vehicle Type","Max Top Speed","Milage"];
                contentToDisplay = [motorCycle.vehicleIdentificationNumber,motorCycle.vehicleDescription,motorCycle.vehicleManufacturerName,"\(motorCycle.isSelfDrive)","\(motorCycle.isInsured)","\(motorCycle.noOfSeat)","\(motorCycle.fuelType)",motorCycle.baseRate.rawValue.formattedCurrency(),motorCycle.ratePerKm.rawValue.formattedCurrency(),motorCycle.vehicleType,"\(motorCycle.maxTopSpeed)","\(motorCycle.mileage)"];
                
                if motorCycle.isInsured{
                    contentTitle.append("Insurance Provider")
                    contentToDisplay.append(motorCycle.insuranceProviderName)
                }
                
                 nextVcTitle = "MotorCycle's Details";
            }
            else if segChlidClass.selectedSegmentIndex == 2{
                let car = dataRepo.getAllCars()[indexPath.row]
                
                contentTitle = ["VIN","Description","Manufacturer","Self Drive?","Insured?","No of seat","Fuel","Base rate","Rate/Km","Vehicle Type","Car Type","Color"];
                contentToDisplay = [car.vehicleIdentificationNumber,car.vehicleDescription,car.vehicleManufacturerName,"\(car.isSelfDrive)","\(car.isInsured)","\(car.noOfSeat)","\(car.fuelType)",car.baseRate.rawValue.formattedCurrency(),car.ratePerKm.rawValue.formattedCurrency(),car.vehicleType,car.carType,car.carColour];
                
                if car.isInsured{
                    contentTitle.append("Insurance Provider")
                    contentToDisplay.append(car.insuranceProviderName)
                }
                
                 nextVcTitle = "Car's Details";
            }
        }
        
        let ListViewVC = UIStoryboard.getViewController(identifier: "ListViewController") as! ListViewController;
        
        ListViewVC.contentTitle = contentTitle;
        ListViewVC.contentToDisplay = contentToDisplay;
        ListViewVC.viewControllerTitle = nextVcTitle;
        
        navigationController?.pushViewController(ListViewVC, animated: true);
        
    }
}
