//
//  AddNewPersonViewController.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-20.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class AddNewPersonViewController: UIViewController {
    var vcTitle:String?
    var contentTitle:[[String]]?;
    
    //@IBOutlet weak var segPerson: UISegmentedControl!
    @IBOutlet weak var tblList: UITableView!
    
    var segPerson:Int?;
    
//    func fillTable() {
//
//        if segPerson == 0 {
//            contentTitle![0] = Customer.getInputContentTitles()
//        }
//        else if segPerson == 1{
//            contentTitle![0] = Owner.getInputContentTitles()
//        }
//        else{
//            contentTitle![0] = Driver.getInputContentTitles()
//        }
//
//        tblList.reloadData();
//    }
    
    @objc func saveData() {
        var values = [String:String]();
        
        let indexPaths = tblList.indexPathsForVisibleRows!;

        for indexPath in indexPaths{
            
            switch contentTitle![indexPath.section][indexPath.row] {

                case "Gender","History Cleared?":
                    let cell = tblList.cellForRow(at: indexPath) as! addNewPersonPickerViewTableViewCell

                    if cell.txtText.text?.isEmpty == true {
                        self.present(UIAlertController.showDestructiveAlert(title: "Error", msg: "\(contentTitle![indexPath.section][indexPath.row]) cannot be empty"), animated: true, completion: nil);
                        return
                    }
                    else{
                        values.updateValue(cell.txtText.text!, forKey: contentTitle![indexPath.section][indexPath.row]);
                    }
                break;

                case "BirthDate":
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

        print(contentTitle!)
        print(indexPaths.count);
        print(values, values.count);

        if segPerson == 0 {
            let tempObj = Customer(id: Int(values["Customer ID"]!)!, firstname: values["First Name"]!, lastname: values["Last Name"]!, gender: values["Gender"]! == "Male" ? Gender.Male : Gender.Female, birthDate: Date.from(date: values["BirthDate"]!)!, mobileNumber: values["Mobile No"]!, email: values["Email"]!, username: values["User Name"]!, password: values["Password"]! ,address: values["Address"]!, city: values["City"]!)
            DataRepo.getInstance().addCustomer(cust: tempObj);
        }
        else if segPerson == 1{

            let tempObj = Owner(id: Int(values["Owner ID"]!)!, firstname: values["First Name"]!, lastname: values["Last Name"]!, gender: values["Gender"]! == "Male" ? Gender.Male : Gender.Female, birthDate: Date.from(date: values["BirthDate"]!)!, mobileNumber: values["Mobile No"]!, email: values["Email"]!, username: values["User Name"]!, password: values["Password"]! ,companyTitle: values["Company Title"]!, businessNumber: values["Business No"]!,website: values["Website"]!)
            DataRepo.getInstance().addOwener(owner: tempObj);
        }
        else if segPerson == 2 {
            let tempObj = Driver(id: Int(values["Driver ID"]!) ?? 0, firstname: values["First Name"] ?? "temp", lastname: values["Last Name"] ?? "temp", gender: values["Gender"]! == "Male" ? Gender.Male : Gender.Female, birthDate: Date.from(date: values["BirthDate"]!) ?? Date(), mobileNumber: values["Mobile No"] ?? "temp", email: values["Email"] ?? "temp", username: values["User Name"] ?? "temp", password: values["Password"] ?? "temp", drivingLicenceNumber: values["DL Number"] ?? "temp" , isHistoryCleared: Bool(values["History Cleared?"]!) ?? false, salary: Double(values["Salary"]!) ?? 0.0)
            
            DataRepo.getInstance().addDriver(driver: tempObj);
            
        }

        
        navigationController?.popViewController(animated: true);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = vcTitle
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveData));

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

extension AddNewPersonViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentTitle![section].count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if contentTitle![indexPath.section][indexPath.row] == "BirthDate"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addNewPersonDateTableViewCell", for: indexPath) as! addNewPersonDateTableViewCell;
            cell.vcWidth = self.view.frame.size.width;
            
            cell.lblText.text = contentTitle![indexPath.section][indexPath.row];
            cell.txtText.placeholder = "Enter \(contentTitle![indexPath.section][indexPath.row])"
            return cell;
        }
        else if contentTitle![indexPath.section][indexPath.row] == "Gender"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addNewPersonGenderTableViewCell", for: indexPath) as! addNewPersonPickerViewTableViewCell;
            cell.vcWidth = self.view.frame.size.width;
            cell.contentTitles = ["Male","Female"];
            
            cell.lblText.text = contentTitle![indexPath.section][indexPath.row];
            cell.txtText.placeholder = "Enter \(contentTitle![indexPath.section][indexPath.row])"
            return cell;
        }
        else if contentTitle![indexPath.section][indexPath.row] == "History Cleared?"{
            let cell = tableView.dequeueReusableCell(withIdentifier: "addNewPersonGenderTableViewCell", for: indexPath) as! addNewPersonPickerViewTableViewCell;
            cell.vcWidth = self.view.frame.size.width;
            cell.contentTitles = ["True","False"];
            
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
