//
//  ProfileManager.swift
//  newone
//
//  Created by Елизавета Метла on 2/27/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import Foundation
class ProfileManager {
    let students = StudentsDataStorage()
    var name = ""
    var surname = ""
    var age = ""
    var gender = ""
    init (studentNumber: Int) {
        studentDataForProfile(studentNumber: studentNumber)
    }
    func studentDataForProfile(studentNumber: Int) {
        name = students.arrayOfStudents[studentNumber].name
        surname = students.arrayOfStudents[studentNumber].surname
        age = students.arrayOfStudents[studentNumber].age
        gender = students.arrayOfStudents[studentNumber].gender
    }
    
}
