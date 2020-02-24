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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        students.studentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        studentsCell = tableView.dequeueReusableCell(withIdentifier: "ClassCell", for: indexPath)
        studentsCell.textLabel?.te
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
