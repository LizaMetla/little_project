//
//  ProfileViewController.swift
//  newone
//
//  Created by Елизавета Метла on 2/21/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var backToWelcome: UINavigationBar!
    
    var studentNumber = 0
       var studentNameLabel = "Name"
       var studentSurnameLabel = "Surname"
       var studentAgeLabel = "Age"
       var studentGenderLabel = "Gender"
       var infoPartLabel = """
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
a
"""
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let studentDta = ProfileManager(studentNumber: studentNumber)
//        nameLabel.text = "Name: \(studentData.name)"
//        surnameLabel.text = "Surname: \(studentData.surname)"
//        ageLabel.text = "Age: \(studentData.age)"
//        infoLabel.text = infoPartLabel
//        switch studentData.gender {
//        case "м":
//            genderLabel.text = "Gender: male"
//        case "ж":
//            genderLabel.text = "Gender: female"
//        default:
//            genderLabel.text = "Gender: unknown"
//        }
//
//        // Do any additional setup after loading the view.
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
