//
//  String+Extension.swift
//  SwiftFinalProject
//
//  Created by Kashyap Jhaveri on 2020-02-22.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation

extension String{
    func encryptPassword() -> String {
        let characters = Array(self)
        var encryptString:String=String();
        for char  in characters
        {
            var ascii = char.asciiValue!;
            ascii+=5;
            encryptString.append(Character(UnicodeScalar(ascii))) //https://www.dotnetperls.com/convert-int-character-swift
        }
        return encryptString;
    }
    
    func decryptPassword() -> String {
        let characters = Array(self)
        var decryptString:String=String();
        for char  in characters
        {
            var ascii = char.asciiValue!;
            ascii-=5;
            decryptString.append(Character(UnicodeScalar(ascii)))
        }
        return decryptString;
    }
}

