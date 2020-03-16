//
//  WelcomeViewController.swift
//  newone
//
//  Created by Елизавета Метла on 2/21/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var profileButtom: UIButton!
    @IBOutlet weak var studentsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    var loginNameLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = loginNameLabel
        profileButtom.layer.cornerRadius = 5
        studentsButton.layer.cornerRadius = 5

        // Do any additional setup after loading the view.
    }
  
    @IBAction func ProfileBPushed(_ sender: Any) {
        performSegue(withIdentifier: "profileVC", sender: nil)
    }
    @IBAction func StudentsBPushed(_ sender: Any) {
         performSegue(withIdentifier: "studentsVC", sender: nil)
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
