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
    @IBOutlet weak var swButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    
    //
    let pushButton = UIButton()
    var centerConstraint = NSLayoutConstraint()
    var heightPosition = NSLayoutConstraint()
    var widthConstraint = NSLayoutConstraint()
    var heightConstraint = NSLayoutConstraint()
    var heightTopAnchor = NSLayoutConstraint()
    
    var numberOfPush = 0
    //
    var loginNameLabel = "   "
    
    @IBAction func logOutIsPushed(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //logine name
        //welcomeLabel.text = loginNameLabel
        
        profileButtom.layer.cornerRadius = 7
        studentsButton.layer.cornerRadius = 7
        swButton.layer.cornerRadius = 7
        
        //view.setGradientBackgroundColor(colorOne: Colors.blue, colorTwo: Colors.orange)
        
        
        //add action button
        //initButton()

        // Do any additional setup after loading the view.
    }
  
   
   
    @IBAction func ProfileBPushed(_ sender: Any) {
           performSegue(withIdentifier: "profileVC", sender: nil)
       }
       @IBAction func StudentsBPushed(_ sender: Any) {
            performSegue(withIdentifier: "studentsVC", sender: nil)
       }
    @IBAction func SWButtonIsPushed(_ sender: Any) {
        performSegue(withIdentifier: "swVC", sender: nil)
    }
    
    
//    @IBAction func buttonAction(_ sender: Any) {
//        switch pushNumber {
//        case 0:
//
//        }
//    }
//
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
