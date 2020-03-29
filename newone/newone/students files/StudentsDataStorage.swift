//
//  StudentsDataStorage.swift
//  newone
//
//  Created by Елизавета Метла on 2/24/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import Foundation
import UIKit

class StudentsDataStorage : NSObject, UITableViewDataSource {


    var studentsArray = [Student]()
    var dataFromFile = ""
    
    override init() {
        super.init()
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
            studentsArray.append(Student(name: String(subStudent.split(separator: ".")[0]), surname: String(subStudent.split(separator: ".")[1]), age: String(subStudent.split(separator: ".")[2]), gender: String(subStudent.split(separator: ".")[3])))
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         studentsFromFile()
               return studentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var studentsCell = UITableViewCell()
        let student = studentsArray[indexPath.row]
        switch student.gender {
        case "м": studentsCell = tableView.dequeueReusableCell(withIdentifier: "ClassCell2", for: indexPath)
        case "ж": studentsCell = tableView.dequeueReusableCell(withIdentifier: "classCell", for: indexPath)
        default:  studentsCell = tableView.dequeueReusableCell(withIdentifier: "mistake", for: indexPath)
        }
        studentsCell.textLabel?.text = "\(student.name) \(student.surname)"
        return studentsCell
    }
    

    
    func removeStudentFromData(studentNumber: Int) {
           studentsArray.remove(at: studentNumber)
       }
       
       func insertStudentArray(student: Student, at: Int) {
           studentsArray.insert(student, at: at)
       }
    
}

