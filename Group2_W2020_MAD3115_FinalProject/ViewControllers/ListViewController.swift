//
//  ListViewController.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-18.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class ListViewController: UIViewController{
    
    var contentTitle:[[String]] = [[String]]();
    var contentToDisplay:[[String]] = [[String]]();
    var viewControllerTitle:String = String();
    var contentHeaderTitle:[String] = [String]();
    
    // Pevious VC Variables
    var dataObject:AnyObject?;
    var baseSegIndex:Int?
    var childSegIndex:Int?
        
    @IBOutlet weak var tblList: UITableView!
    
    @objc func addVehicleRented()  {
        
        if baseSegIndex == 0{
            if childSegIndex == 0{
                let AddNewVehicleRentViewController = UIStoryboard.getViewController(identifier: "AddNewVehicleRentViewController") as! AddNewVehicleRentViewController;
                
                AddNewVehicleRentViewController.vcTitle = "Rent New Vehicle";
                AddNewVehicleRentViewController.contentHeaderTitle = ["Rent Details"];

                AddNewVehicleRentViewController.contentTitle = [VehicleRent.getInputContentTitles()];
                AddNewVehicleRentViewController.dataObject = dataObject;
                
                
                navigationController?.pushViewController(AddNewVehicleRentViewController, animated: true);
            }
        }
        
    }

    
    private func reloadData(){
        
        var tempContentTitle:[[String]] = [[String]]();
        var tempContentToDisplay:[[String]] = [[String]]();
        var tempContentHeaderTitle:[String] = [String]();
        
        if baseSegIndex == 0{
            if childSegIndex == 0{
                let customer = (dataObject as! Customer);
                
                tempContentHeaderTitle.append("Personal Information")
                
                tempContentTitle.append(customer.getContentTitles())
                tempContentToDisplay.append(customer.getContentToDisplay())
                

                if !customer.getListOfVehicleRented().isEmpty{
                    var VIN=[String]();
                    var vehiclesManufacturer = [String]();
                    tempContentHeaderTitle.append("List of Vehicle Rented");


                    for vehicle in customer.getListOfVehicleRented(){
                        VIN.append(vehicle.vehicleRented.vehicleIdentificationNumber);
                        vehiclesManufacturer.append(vehicle.vehicleRented.vehicleManufacturerName);
                    }

                    tempContentTitle.append(VIN);
                    tempContentToDisplay.append(vehiclesManufacturer);
                }
                navigationItem.title = "Customer's Details";
            }
            else if childSegIndex == 1{
                let owner = (dataObject as! Owner);
                
                tempContentHeaderTitle.append("Personal Information")
                tempContentTitle.append(owner.getContentTitles())
                tempContentToDisplay.append(owner.getContentToDisplay())
                
                
                if !owner.getListOfVehicleOwn().isEmpty{
                    var VIN=[String]();
                    var vehiclesManufacturer = [String]();
                    tempContentHeaderTitle.append("List of Vehicle Own");
                   
                    
                    for vehicle in owner.getListOfVehicleOwn(){
                        VIN.append(vehicle.vehicleIdentificationNumber);
                        vehiclesManufacturer.append(vehicle.vehicleManufacturerName);
                    }
                    
                    tempContentTitle.append(VIN);
                    tempContentToDisplay.append(vehiclesManufacturer);
                }
                
                navigationItem.title = "Owner's Details";
            }
            else if childSegIndex == 2{
                let driver = (dataObject as! Driver);
                
                tempContentHeaderTitle.append("Personal Information")
                tempContentTitle.append(driver.getContentTitles())
                tempContentToDisplay.append(driver.getContentToDisplay());
                
                navigationItem.title = "Driver's Details";
            }
        }
        else if baseSegIndex == 1{
            if childSegIndex == 0{
                let bus = (dataObject as! Bus);
                
                tempContentHeaderTitle.append("Vehicle Information")
                tempContentTitle.append(bus.getContentTitles());
                tempContentToDisplay.append(bus.getContentToDisplay());
                
                if bus.isInsured{
                    tempContentTitle[0].append("Insurance Provider")
                    tempContentToDisplay[0].append(bus.insuranceProviderName)
                }
                
                if bus.isSelfDrive == false{
                    tempContentHeaderTitle.append("Driver Information")
                    tempContentTitle.append(bus.driver.getContentTitles());
                    tempContentToDisplay.append(bus.driver.getContentToDisplay());
                }
                
                navigationItem.title = "Bus's Details";
            }
            else if childSegIndex == 1{
                let bus = (dataObject as! MotorCycle);
                
                tempContentHeaderTitle.append("Vehicle Information")
                tempContentTitle.append(bus.getContentTitles());
                tempContentToDisplay.append(bus.getContentToDisplay());
                
                if bus.isInsured{
                    tempContentTitle[0].append("Insurance Provider")
                    tempContentToDisplay[0].append(bus.insuranceProviderName)
                }
                
                if bus.isSelfDrive == false{
                    tempContentHeaderTitle.append("Driver Information")
                    tempContentTitle.append(bus.driver.getContentTitles());
                    tempContentToDisplay.append(bus.driver.getContentToDisplay());
                }
                
                navigationItem.title = "Bus's Details";
            }
            else if childSegIndex == 2{
                let car = (dataObject as! Car);
                
                tempContentHeaderTitle.append("Vehicle Information")
                tempContentTitle.append(car.getContentTitles());
                tempContentToDisplay.append(car.getContentToDisplay());
                
                if car.isInsured{
                    tempContentTitle[0].append("Insurance Provider")
                    tempContentToDisplay[0].append(car.insuranceProviderName)
                }
                
                if car.isSelfDrive == false{
                    tempContentHeaderTitle.append("Driver Information")
                    tempContentTitle.append(car.driver.getContentTitles());
                    tempContentToDisplay.append(car.driver.getContentToDisplay());
                }
                
                navigationItem.title = "Car's Details";
            }
        }
        
        self.contentTitle = tempContentTitle;
        self.contentHeaderTitle = tempContentHeaderTitle;
        self.contentToDisplay = tempContentToDisplay;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if baseSegIndex == 0{
            if childSegIndex == 0 {
                navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addVehicleRented));
            }
        }
        
        //reloadData();
        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        reloadData();
        tblList.reloadData();
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ListViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contentHeaderTitle.count;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contentHeaderTitle[section];
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentTitle[section].count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTableViewCell", for: indexPath);
        
        cell.textLabel?.text = contentTitle[indexPath.section][indexPath.row];
        cell.detailTextLabel?.text = contentToDisplay[indexPath.section][indexPath.row];
        
        
        if indexPath.section == 1{
            cell.selectionStyle = .default;  //https://exceptionshub.com/uitableview-how-to-disable-selection-for-some-rows-but-not-others.html
        }
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
            
            var nextVcTitle:String = String();
            var contentHeaderTitle:[String] = [String]();
            var contentTitle:[[String]] = [[String]]();
            var contentToDisplay:[[String]] = [[String]]();
            
            if baseSegIndex == 0{
                if childSegIndex == 0{
                    let customerRentedVehicle = (dataObject as! Customer).getListOfVehicleRented()[indexPath.row];
                    
                    nextVcTitle = "Vehicle Rent Details";
                    
                    contentHeaderTitle.append("Rent Details : \(customerRentedVehicle.totalBill.formattedCurrency())");
                    contentTitle.append(["Start Date","End Date","No of Days","No of km driven","Total Bill"]);
                    contentToDisplay.append([customerRentedVehicle.startDate.getFormattedDate(dateFormat: "dd-MMM-yyyy"),customerRentedVehicle.endDate.getFormattedDate(dateFormat: "dd-MMM-yyyy"),"\(customerRentedVehicle.noOfDays)","\(customerRentedVehicle.noOfKmDriven)",customerRentedVehicle.totalBill.formattedCurrency()]);
                    
                    contentHeaderTitle.append("Vehicle Rented Details");
                    contentTitle.append(customerRentedVehicle.vehicleRented.getContentTitles());
                    contentToDisplay.append(customerRentedVehicle.vehicleRented.getContentToDisplay());
                    
                    if customerRentedVehicle.vehicleRented.isSelfDrive == false{
                        contentHeaderTitle.append("Vehicle Driver Details");
                        contentTitle.append(customerRentedVehicle.vehicleRented.driver.getContentTitles());
                        contentToDisplay.append(customerRentedVehicle.vehicleRented.driver.getContentToDisplay());
                    }
                    
                }
                else if childSegIndex == 1{
                    let ownerVehicle = (dataObject as! Owner).getListOfVehicleOwn()[indexPath.row]
                    
                    nextVcTitle = "Owner Vehicle Details";
                    
                    contentHeaderTitle.append("Vehicle Details")
                    contentTitle.append(ownerVehicle.getContentTitles())
                    contentToDisplay.append(ownerVehicle.getContentToDisplay());
                }
            }
            
            let dependentDetailsViewController = UIStoryboard.getViewController(identifier: "dependentDetailsViewController") as! dependentDetailsViewController;
            dependentDetailsViewController.nextVcTitle = nextVcTitle;
            dependentDetailsViewController.contentTitle = contentTitle;
            dependentDetailsViewController.contentToDisplay = contentToDisplay;
            dependentDetailsViewController.contentHeaderTitle = contentHeaderTitle;
            navigationController?.pushViewController(dependentDetailsViewController, animated: true);
        }
    }
}
