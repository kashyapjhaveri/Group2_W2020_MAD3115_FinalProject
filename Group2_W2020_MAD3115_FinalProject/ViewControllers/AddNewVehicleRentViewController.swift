//
//  AddNewVehicleRentViewController.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-23.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class AddNewVehicleRentViewController: UIViewController {
    
    var vcTitle:String?
    var contentHeaderTitle:[String]?
    var contentTitle:[[String]]?;
    var dataObject:AnyObject?;
    
    @IBOutlet weak var tblList: UITableView!
    
    @objc func addVehicleRent(){
        
        var values = [String:String]();
        
        let indexPaths = tblList.indexPathsForVisibleRows!;
        var selectedVehicle:Vehicle?;
       
        for indexPath in indexPaths{
            
            switch contentTitle![indexPath.section][indexPath.row] {
                case "Vehicle":
                    let cell = tblList.cellForRow(at: indexPath) as! addNewVehicleRentPickerViewTableViewCell
                    
                    if cell.txtText.text?.isEmpty == true {
                        self.present(UIAlertController.showDestructiveAlert(title: "Error", msg: "\(contentTitle![indexPath.section][indexPath.row]) cannot be empty"), animated: true, completion: nil);
                        return
                    }
                    else{
                        selectedVehicle = cell.selectedVehicle;
                        //values.updateValue(cell.txtText.text!, forKey: contentTitle![indexPath.section][indexPath.row]);
                    }
                break;
                
                case "Start Date", "End Date":
                    let cell = tblList.cellForRow(at: indexPath) as! addNewPersonDateTableViewCell
                    if cell.txtText.text?.isEmpty == true {
                        self.present(UIAlertController.showDestructiveAlert(title: "Error", msg: "\(contentTitle![indexPath.section][indexPath.row]) cannot be empty"), animated: true, completion: nil);
                        return
                    }
                    else{
                        values.updateValue(cell.txtText.text!, forKey: contentTitle![indexPath.section][indexPath.row]);
                    }
                break;
                
                default:
                    let cell = tblList.cellForRow(at: indexPath) as! addNewPersonTableViewCell
                    if cell.txtText.text?.isEmpty == true {
                        self.present(UIAlertController.showDestructiveAlert(title: "Error", msg: "\(contentTitle![indexPath.section][indexPath.row]) cannot be empty"), animated: true, completion: nil);
                        return;
                    }
                    else{
                        values.updateValue(cell.txtText.text!, forKey: contentTitle![indexPath.section][indexPath.row]);
                    }
                break;
            }
        }
        
        let tempObj = VehicleRent(startDate: Date.from(date: values["Start Date"]!)!, endDate: Date.from(date: values["End Date"]!)!, noOfKmDriven: Int(values["No of Km Driven"]!)!, vehicleRented: selectedVehicle!);
        (dataObject as! Customer).addRentedVehicle(tempVehicle: tempObj);

        
        navigationController?.popViewController(animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = vcTitle!;
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(addVehicleRent))
        // Do any additional setup after loading the view.
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

extension AddNewVehicleRentViewController: UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return contentHeaderTitle!.count;
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return contentHeaderTitle![section];
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentTitle![section].count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if contentTitle![indexPath.section][indexPath.row] == "Start Date"  || contentTitle![indexPath.section][indexPath.row] == "End Date"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addNewPersonDateTableViewCell", for: indexPath) as! addNewPersonDateTableViewCell;
            cell.vcWidth = self.view.frame.size.width;
            
            cell.lblText.text = contentTitle![indexPath.section][indexPath.row];
            cell.txtText.placeholder = "Enter \(contentTitle![indexPath.section][indexPath.row])"
            return cell;
        }
        else if contentTitle![indexPath.section][indexPath.row] == "Vehicle"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addNewVehicleRentPickerViewTableViewCell", for: indexPath) as! addNewVehicleRentPickerViewTableViewCell;
            cell.vcWidth = self.view.frame.size.width;

            
            cell.lblText.text = contentTitle![indexPath.section][indexPath.row];
            cell.txtText.placeholder = "Enter \(contentTitle![indexPath.section][indexPath.row])"
            return cell;
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addNewPersonTableViewCell", for: indexPath) as! addNewPersonTableViewCell;
            
            cell.lblText.text = contentTitle![indexPath.section][indexPath.row];
            cell.txtText.placeholder = "Enter \(contentTitle![indexPath.section][indexPath.row])"
            return cell;
        }
    }
    
    
}
