//
//  StudentsViewController.swift
//  newone
//
//  Created by Елизавета Метла on 2/23/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit
import Foundation

class StudentsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let students = StudentsDataStorage()
    var studentNumber = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
}

    /*
    let students = StudentsDataStorage()
    var studentNumber = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.tableView(tableView, numberOfRowsInSection: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       UITableViewCell {
        students.tableView(tableView, cellForRowAt: indexPath)
    }
    
/////
 /*   override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
 */
 /////////
 
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
         studentNumber = indexPath.row
         performSegue(withIdentifier: "profileVC", sender: nil)
     }
     
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
             students.removeStudentFromData(studentNumber: indexPath.row)
             tableView.deleteRows(at: [indexPath], with: .fade)
         }
     }
     
     func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         true
     }
     
     func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
         let student = students.arrayOfStudents[sourceIndexPath.row]
         students.insertStudentArray(student: student, at: destinationIndexPath.row)
         students.removeStudentFromData(studentNumber: sourceIndexPath.row)
     }
     
     override func viewDidLoad() {
         super.viewDidLoad()
         
     }
     
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         let destinationVC = segue.destination as? ProfileViewController
         destinationVC?.studentNumber = studentNumber
     }
     
 }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

*/
}
