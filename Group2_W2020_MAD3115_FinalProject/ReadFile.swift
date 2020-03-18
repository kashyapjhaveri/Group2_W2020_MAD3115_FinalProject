//
//  ReadFile.swift
//  SwiftFinalProject
//
//  Created by Kashyap Jhaveri on 2020-02-22.
//  Copyright © 2020 Kashyap Jhaveri. All rights reserved.
//

import Foundation

class ReadFile {
    private static var readFileInstance = ReadFile();
    
    private init() {
    }
    
    static func getInsatnce() -> ReadFile {
        return .readFileInstance;
    }
    
    func readJSONFile(fileName:String)throws  -> Any {
        
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension:"json") else {
            throw FileExceptions.fileNotFound
        }
        
        guard let data = try? Data(contentsOf: fileUrl) else {
            throw FileExceptions.dataReadingError
        }
        
        guard let json = try? JSONSerialization.jsonObject(with: data, options: []) else {
            throw FileExceptions.errorPasingToJSON
        }
        
        return json
    }
    
    func readFileData(fileName:String, ext:String)throws  -> Data {
        
        guard let fileUrl = Bundle.main.url(forResource: fileName, withExtension: ext) else {
            throw FileExceptions.fileNotFound
        }
        
        guard let data = try? Data(contentsOf: fileUrl) else {
            throw FileExceptions.dataReadingError
        }
        
        return data;
    }
}
