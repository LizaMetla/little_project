//
//  StudentsDataStorage.swift
//  newone
//
//  Created by Елизавета Метла on 2/24/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import Foundation

class StudentsDataStorage {
    var studentsArray = [studenIdentifier]()
    var dataFromFile = ""
    
    init() {
        studentsFromFile()
    }
    func studentsFromFile() {
        if let filepath = Bundle.main.path(forResource: "Names", ofType: "txt") {
            do {
                dataFromFile = try String(contentsOfFile: filepath)
                print(dataFromFile)
            } catch {
                print("contents could not be loaded")
            }
        } else {
            print("names.txt not found!")
        }
        let stringArray = dataFromFile.split(separator: " ")
        stringArray.forEach { subStudent in
            studentsArray.append(studenIdentifier(name: String(subStudent.split(separator: ".")[0]), surname: String(subStudent.split(separator: ".")[1]), age: String(subStudent.split(separator: ".")[2]), gender: String(subStudent.split(separator: ".")[3])))
            
        }
    }
}
