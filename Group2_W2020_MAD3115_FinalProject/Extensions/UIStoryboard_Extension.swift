//
//  UIStoryboard_Extension.swift
//  Group2_W2020_MAD3115_FinalProject
//
//  Created by Kashyap Jhaveri on 2020-03-18.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation
import UIKit

extension UIStoryboard{
    static func getViewController(identifier:String) -> UIViewController {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil);
        return storyBoard.instantiateViewController(identifier: identifier);
    }
    
}
