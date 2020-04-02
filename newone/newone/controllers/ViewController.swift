//
//  ViewController.swift
//  newone
//
//  Created by Елизавета Метла on 2/21/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let validator = Validator()
    static var login: String = ""
    static var password: String = ""
    @IBOutlet weak var loginField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var showPasswordButton: UIButton!
    @IBOutlet weak var errorText: UILabel!
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.layer.cornerRadius = 10
        loginField.layer.cornerRadius = 10
        passwordField.layer.cornerRadius = 10
        
        passwordField.layer.masksToBounds = true
        loginField.layer.masksToBounds = true
        view.setFourGradientBackgroundColor(colorOne: Colors.black, colorTwo: Colors.blue, colorThree: Colors.brightOrange, colorFour: Colors.blue)
        
        loginField.setGradientBackgroundColor(colorOne: Colors.blue, colorTwo: Colors.lightGrey)
        //view.setGradientBackgroundColor(colorOne: Colors.darkGrey, colorTwo: Colors.lightGrey)
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton(_ sender: Any) {
        if validator.isLoginCorrect(login: loginField.text ?? "") == true && validator.isPasswordCorrect(password: passwordField.text ?? "") == true {
                  performSegue(withIdentifier: "welcomeVC", sender: nil)
              }
       }
    
    @IBAction func showPassword(_ sender: Any) {
        passwordField.isSecureTextEntry = false
    }
    @IBAction func hidePasswordButton(_ sender: Any) {
        passwordField.isSecureTextEntry = true
    }
    
    @IBAction func failedLogin(_ sender: Any) {
        if validator.isLoginCorrect(login: loginField.text ?? "") == true {
                 errorText.text = ""
             } else {
                 errorText.text = "Incorrect login"
             }
    }
    @IBAction func failedPassword(_ sender: Any) {
        if validator.isLoginCorrect(login: loginField.text ?? "") == true {
            if validator.isPasswordCorrect(password: passwordField.text ?? "") == true {
                errorText.text = ""
            } else {
                errorText.text = "Incorrect password"
            }
        } else {
            errorText.text = "Incorrect login"
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
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as? WelcomeViewController
        destinationVC?.loginNameLabel = ("Welcome, \(loginField.text ?? "")!")
    }
 

}
