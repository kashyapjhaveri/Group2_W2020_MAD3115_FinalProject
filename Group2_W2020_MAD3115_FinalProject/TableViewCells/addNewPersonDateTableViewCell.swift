//
//  addNewPersonDateTableViewCell.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-21.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class addNewPersonDateTableViewCell: UITableViewCell, UITextFieldDelegate {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var txtText: UITextField!
    
    var vcWidth:CGFloat?;
    
    var datePicker : UIDatePicker!
    override func awakeFromNib() {
        super.awakeFromNib()
        txtText.delegate = self;
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField)
    {
      self.pickUpDate(self.txtText)
    }
    
    func pickUpDate(_ textField : UITextField)
    {
      self.datePicker = UIDatePicker(frame: CGRect(x: 0, y: 0, width: vcWidth!, height: 216))
      self.datePicker.backgroundColor = UIColor.white
      self.datePicker.datePickerMode = UIDatePicker.Mode.date
      textField.inputView = self.datePicker
     
     
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
      textField.inputAccessoryView = toolBar
    }
     
    @objc func doneClick(){
      let dateFormatter1 = DateFormatter()
      dateFormatter1.dateStyle = .medium
      dateFormatter1.timeStyle = .none
        dateFormatter1.dateFormat = "dd/MM/yyyy";
      txtText.text = dateFormatter1.string(from: datePicker.date)
      txtText.resignFirstResponder()
    }
     
    @objc func cancelClick(){
      txtText.resignFirstResponder()
    }

}
