//
//  Person.swift
//  SwiftFinalProject
//
//  Created by Gagandeep kaur on 2020-02-11.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//


import Foundation

protocol Person : IDisplay

{
    var id           : Int {get set}
    var firstname    : String{get set}
    var lastname     : String{get set}
    var fullName     : String{get}
    var gender       : Gender{get set}
    var birthDate    : Date{get set}
    var age          : Int{get }
    var mobileNumber : String{get set}
    var email        : String{get set}
    var username     : String{get set}
    var password     : String{get set}
        
    func Display()
}
