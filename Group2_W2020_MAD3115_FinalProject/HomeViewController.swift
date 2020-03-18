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
}
