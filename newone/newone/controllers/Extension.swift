//
//  Extension.swift
//  newone
//
//  Created by Елизавета Метла on 3/29/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import Foundation
import UIKit

extension WelcomeViewController {
    
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
                              initialSpringVelocity: 2.6,
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
                              usingSpringWithDamping: 0.7,
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

}
