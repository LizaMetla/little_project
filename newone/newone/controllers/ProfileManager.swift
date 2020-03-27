//
//  ProfileManager.swift
//  newone
//
//  Created by Елизавета Метла on 2/27/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import Foundation
import UIKit

class ProfileManager {
    static let shared = ProfileManager()
    private init() {}
    let students = StudentsDataStorage()
    var defaultUser = 1
    var studentNumber = 0
    var name = ""
    var surname = ""
    var age = ""
    var gender = ""
    private let login = "Liza"
    private let password = "Metla"
    
    
    func defaultUserData() {
        if ViewController.login == login && ViewController.password == password {
            if let userName = UserDefaults.standard.object(forKey: "name") {
                name = userName as? String ?? "Unknown"
            }
            if let userSurname = UserDefaults.standard.object(forKey: "surname") {
                surname = userSurname as? String ?? "Unknown"
            }
            if let userGender = UserDefaults.standard.object(forKey: "gender") {
                switch userGender as? Int {
                case 0:
                    gender = "м"
                case 1:
                    gender = "ж"
                default:
                    gender = "Unknown"
                }
            }
            if let userAge = UserDefaults.standard.object(forKey: "age") {
                age = userAge as? String ?? "Unknown"
            }
        } else {
            name = "Unknown"
            surname = "Unknown"
            age = "Unknown"
            gender = "Unknown"
        }
    }
    func studentDataForProfile(studentNumber: Int) {
        name = students.studentsArray[studentNumber].name
        surname = students.studentsArray[studentNumber].surname
        age = students.studentsArray[studentNumber].age
        gender = students.studentsArray[studentNumber].gender
    }
}
