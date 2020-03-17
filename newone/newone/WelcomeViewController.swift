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
    
    //
    let pushButton = UIButton()
    var centerConstraint = NSLayoutConstraint()
    var heightPosition = NSLayoutConstraint()
    var widthConstraint = NSLayoutConstraint()
    var heightConstraint = NSLayoutConstraint()
    var heightTopAnchor = NSLayoutConstraint()
    
    var numberOfPush = 0
    //
    var loginNameLabel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = loginNameLabel
        profileButtom.layer.cornerRadius = 5
        studentsButton.layer.cornerRadius = 5
        initButton()

        // Do any additional setup after loading the view.
    }
  
   
    func initButton() {
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(pushButton)
        
        centerConstraint = pushButton.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0)
        centerConstraint.isActive = true
        
        heightConstraint = pushButton.heightAnchor.constraint(equalToConstant: 150)
        heightConstraint.isActive = true
        
        widthConstraint = pushButton.widthAnchor.constraint(equalToConstant: 180)
        widthConstraint.isActive = true
        
        heightTopAnchor = pushButton.topAnchor.constraint(equalTo: studentsButton.bottomAnchor, constant: 20)
        heightTopAnchor.isActive = true
        
        pushButton.backgroundColor = .systemPink
        pushButton.setTitle("Click", for: .normal)
        pushButton.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    func restoreButton() {
        pushButton.layer.cornerRadius = 0
        
        pushButton.backgroundColor = .systemPink
        
        widthConstraint.constant = 180
    }
    
    
    @objc func buttonClicked() {
        switch numberOfPush {
        case 0:
            
            widthConstraint.constant = 100
            
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 2.0,
                           options: .curveEaseIn,
                           animations: { [weak self] in
                            guard let self = self else {return}
                            self.numberOfPush += 1
                            self.view.layoutIfNeeded()
                }, completion: nil)
        case 1:
            UIView.animate(withDuration: 1, delay: 0,
                           usingSpringWithDamping: 0.4,
                           initialSpringVelocity: 2.3,
                           options: .curveEaseOut,
                           animations: { [weak self] in
                            guard let self = self else {return}
                            self.pushButton.layer.cornerRadius = self.heightConstraint.constant
                            self.pushButton.backgroundColor = .green
                            self.numberOfPush += 1
                }, completion: nil)
        case 2:
            centerConstraint.constant = 400
            UIView.animate(withDuration: 1, delay: 0, options: .autoreverse, animations: { [weak self] in
                guard let self = self else {return}
                self.numberOfPush += 1
                self.view.layoutIfNeeded()
                }, completion: {[weak self] bool in
                    guard let self = self else {return}
                    self.centerConstraint.constant = 0
            })
        case 3:
            
            restoreButton()
            
            UIView.animate(withDuration: 1,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 10.0,
                           options: .curveEaseInOut,
                           animations: {[weak self] in
                            guard let self = self else {return}
                            self.view.layoutIfNeeded()
                            self.numberOfPush = 0
                }, completion: nil)
        default:
            print("nothing")
        }
    }
    @IBAction func ProfileBPushed(_ sender: Any) {
           performSegue(withIdentifier: "profileVC", sender: nil)
       }
       @IBAction func StudentsBPushed(_ sender: Any) {
            performSegue(withIdentifier: "studentsVC", sender: nil)
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
