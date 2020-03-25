//
//  addNewVehicleRentPickerViewTableViewCell.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-24.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class addNewVehicleRentPickerViewTableViewCell: UITableViewCell, UITextFieldDelegate {

    var carManufacturers = [String]();
    var busManufacturers = [String]();
    var motorCycleManufacturers = [String]();
    
    
    var contentTitles = [["Car","Bus","MotorCycle"]];
    
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var txtText: UITextField!
    
    var vcWidth:CGFloat!;
    var pickerView:UIPickerView!
    
    var selectedVehicle:Vehicle?;
    override func awakeFromNib() {
        super.awakeFromNib()
        txtText.delegate = self;
        
        
        for vehicle in DataRepo.getInstance().getAllCars(){
            carManufacturers.append(vehicle.vehicleManufacturerName);
        }
        for vehicle in DataRepo.getInstance().getAllBuses(){
            busManufacturers.append(vehicle.vehicleManufacturerName);
        }
        for vehicle in DataRepo.getInstance().getAllMotorCycles(){
            motorCycleManufacturers.append(vehicle.vehicleManufacturerName);
        }
        
        contentTitles.append(carManufacturers);
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.initPickerView(self.txtText);
    }
    
    
    func initPickerView(_ txtText:UITextField)  {
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: vcWidth!, height: 400))
        self.pickerView.backgroundColor = UIColor.white;
       
        self.pickerView.delegate = self;
        
        txtText.inputView = self.pickerView;
        
         //ToolBar
         let toolBar = UIToolbar()
         toolBar.barStyle = .default
         toolBar.isTranslucent = true
         toolBar.tintColor = .red//UIColor(red: 92/255, green: 216/255, blue 255/255, alpha : 1)
         toolBar.sizeToFit()
        
         //Adding Button ToolBar
        
         let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.doneClick))
        
         let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        
         let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(self.cancelClick))
        
         toolBar.setItems([cancelButton, spaceButton, doneButton], animated: false)
         toolBar.isUserInteractionEnabled = true
         txtText.inputAccessoryView = toolBar
    }
    
    @objc func doneClick(){
        txtText.text = "\(contentTitles[0][pickerView.selectedRow(inComponent: 0)]) : \(contentTitles[1][pickerView.selectedRow(inComponent: 1)])"
        
        if contentTitles[0][pickerView.selectedRow(inComponent: 0)] == "Car"{
            self.selectedVehicle = DataRepo.getInstance().getAllCars()[pickerView.selectedRow(inComponent: 1)];
        }
        else if contentTitles[0][pickerView.selectedRow(inComponent: 0)] == "Bus"{
            self.selectedVehicle = DataRepo.getInstance().getAllBuses()[pickerView.selectedRow(inComponent: 1)];
        }
        else{
            self.selectedVehicle = DataRepo.getInstance().getAllMotorCycles()[pickerView.selectedRow(inComponent: 1)];
        }
        txtText.resignFirstResponder()
    }
     
    @objc func cancelClick(){
      txtText.resignFirstResponder()
    }

}

extension addNewVehicleRentPickerViewTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return contentTitles.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return contentTitles[component].count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return contentTitles[component][row];
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            if row == 0 {
                contentTitles[1] = carManufacturers;
            }
            else if row == 1{
                contentTitles[1] = busManufacturers;
            }
            else{
                contentTitles[1] = carManufacturers;
            }
            pickerView.reloadComponent(1);
        }
    }
}
