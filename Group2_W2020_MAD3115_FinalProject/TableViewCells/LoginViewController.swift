//
//  ViewController.swift
//  C0775049_MidTerm_MAD3115_W2020
//
//  Created by Kashyap Jhaveri on 2020-03-05.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController,UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var pickerSavedUsers: UIPickerView!
    @IBOutlet weak var switchRememberMe: UISwitch!
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        let ud = UserDefaults.standard;
        
        guard let savedUsers = ud.array(forKey: "savedUsers") else {
            return 1;
        }
        return savedUsers.count+1;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let ud = UserDefaults.standard;
        if row == 0{
            guard let savedUsers = ud.array(forKey: "savedUsers") else
            {
                return "No saved users found"
            }
            
            if savedUsers.isEmpty{
                return "No saved users found"
            }
            else{
                return "Saved Users";
            }
           
        }
        else{
            if let savedUsers = ud.array(forKey: "savedUsers"){
                return savedUsers[row-1] as? String;
            }
        }
        return nil;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerSavedUsers.dataSource = self;
        pickerSavedUsers.delegate = self;
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        pickerSavedUsers.reloadAllComponents();
    }
    
    @IBAction func btnLoginClick(_ sender: UIButton) {
        guard let email = txtEmail.text else {
            return;
        }
        
        guard let password = txtPassword.text else {
            return;
        }
        
        if email.isEmpty{
            let alertController  = UIAlertController(title: "Empty Value", message: "Email value cannot be empty", preferredStyle: .alert);
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .destructive))
            self.present(alertController, animated: true, completion: nil);
        }
        else if password.isEmpty{
            let alertController  = UIAlertController(title: "Empty Value", message: "Password value cannot be empty", preferredStyle: .alert);
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .destructive))

            self.present(alertController, animated: true, completion: nil);
        }else if email=="admin@admin.com" && password == "admin123" {
            
            let ud = UserDefaults.standard;
            
            if switchRememberMe.isOn{
                if var savedUsers = ud.stringArray(forKey:"savedUsers")
                {
                    if !savedUsers.contains(email){
                        savedUsers.append(email);
                        UserDefaults.standard.set(savedUsers, forKey: "savedUsers");
                    }
                }
                else {
                    let savedUsers = [email];
                    UserDefaults.standard.set(savedUsers, forKey: "savedUsers");
                }
            }
            else{
                if var savedUsers = ud.stringArray(forKey:"savedUsers")
                {
                    if savedUsers.contains(email){
                        if let index = savedUsers.firstIndex(of: email){
                            savedUsers.remove(at: index);
                            ud.set(savedUsers, forKey: "savedUsers")
                        }
                    }
                }
            }
            
            txtEmail.text = "";
            txtPassword.text = "";
            
            let customerListVC = UIStoryboard.getViewController(identifier: "HomeViewController");
            customerListVC.modalPresentationStyle = .fullScreen;
            show(customerListVC, sender: self);
            
        }
        else{
            let alertController  = UIAlertController(title: "Invalid credentials", message: "Email or password is invalid", preferredStyle: .alert);
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .destructive))

            self.present(alertController, animated: true, completion: nil);
        }
    }
    
    
    @IBAction func btnContinueClick(_ sender: UIButton) {
        let ud = UserDefaults.standard;
        
        if pickerSavedUsers.selectedRow(inComponent: 0) > 0{
            
            if let savedUsers = ud.array(forKey: "savedUsers"){
                ud.set(savedUsers[pickerSavedUsers.selectedRow(inComponent: 0)-1], forKey: "user");
            }

            let adminNavigationController = UIStoryboard.getViewController(identifier: "HomeViewController");
            adminNavigationController.modalPresentationStyle = .fullScreen

            show(adminNavigationController, sender: self);
        }
    }
    
    
}
