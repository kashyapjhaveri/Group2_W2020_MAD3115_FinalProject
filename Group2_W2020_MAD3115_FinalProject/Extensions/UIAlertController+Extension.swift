//
//  UIAlertController+Extension.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-20.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController{
    
    static func getActionSheet(title:String?, msg:String?) -> UIAlertController {
        return UIAlertController(title: title, message: msg, preferredStyle: .actionSheet)
    }
    
    static func showDestructiveAlert(title:String, msg:String)-> UIAlertController {
        let alertController  = UIAlertController(title: title, message: msg, preferredStyle: .alert);
        alertController.addAction(UIAlertAction(title: "Dismiss", style: .destructive))
        return alertController;
    }
}
