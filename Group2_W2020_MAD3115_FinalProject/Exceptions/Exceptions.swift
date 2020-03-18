//
//  exceptions.swift
//  SwiftFinalProject
//
//  Created by Kashyap Jhaveri on 2020-02-22.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation

enum FileExceptions : Error{
    case fileNotFound
    case dataReadingError
    case errorPasingToJSON
}

enum DriverExceptions : Error{
    case driverObjectNotFound
}

enum birthDate: Error{
    case invalidDate
}
