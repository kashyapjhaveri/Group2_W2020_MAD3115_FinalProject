//
//  Date+Extension.swift
//  SwiftFinalProject
//
//  Created by MacStudent on 2020-02-19.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation
extension Date{
    func getAge() -> Int
    {
        return Calendar.current.dateComponents([.year], from: self, to: Date()).year!;
    }

    public func getFormattedDate(dateFormat:String) -> String
    {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = dateFormat
        let formattedDate = dateFormatter.string(from: self)
        return formattedDate
    }
    
    static func from(year: Int, month: Int, day: Int) -> Date?
    {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        return calendar.date(from: dateComponents) ?? nil
    }

    static func from(date:String) -> Date?
    {
        let tempDateFormatter = DateFormatter();
        tempDateFormatter.dateFormat = "dd/MM/yyyy";
        return tempDateFormatter.date(from: date);
    }
}





