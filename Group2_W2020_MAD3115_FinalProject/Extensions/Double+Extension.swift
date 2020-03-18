//
//  Double+Extension.swift
//  SwiftFinalProject
//
//  Created by Kashyap Jhaveri on 2020-02-22.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation
extension Double{
    func formattedCurrency() -> String {
        let currencyFormatter = NumberFormatter();
        currencyFormatter.usesGroupingSeparator = true;
        currencyFormatter.numberStyle = .currency;
        currencyFormatter.locale = Locale.current;
        return currencyFormatter.string(from: NSNumber(value: self))!
    }
}
