//
//  addNewPersonGenderTableViewCell.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-21.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class addNewPersonPickerViewTableViewCell: UITableViewCell, UITextFieldDelegate {
    
    var contentTitles:[String]?;
    
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var txtText: UITextField!
    
    var vcWidth:CGFloat!;
    
    var pickerView:UIPickerView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txtText.delegate = self;
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
        self.pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: vcWidth!, height: 150))
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
        txtText.text = contentTitles![self.pickerView.selectedRow(inComponent: 0)];
        txtText.resignFirstResponder()
    }
     
    @objc func cancelClick(){
      txtText.resignFirstResponder()
    }
}


extension addNewPersonPickerViewTableViewCell: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return contentTitles!.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return contentTitles![row];
    }
    
}
