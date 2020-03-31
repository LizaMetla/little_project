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

//extension NetworkManager: UITableViewDataSource {
//
//    func numberOfSections(in tableView: UITableView) -> Int {
//        1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//         characters.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let characterCell =
//            tableView.dequeueReusableCell(withIdentifier: "student", for: indexPath) as? StudentTableViewCell else {fatalError("No cell!")}
//        let character = characters[indexPath.row]
//        characterCell.studentName.text = character.name
//
//        switch character.gender {
//        case "male":
//            characterCell.genderImage.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
//            characterCell.genderImage.image = UIImage(named: "boy")
//        case "female":
//            characterCell.genderImage.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
//            characterCell.genderImage.image = UIImage(named: "girl")
//        case "n/a", "none":
//            characterCell.genderImage.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
//            characterCell.genderImage.image = UIImage(named: "droid")
//        case "hermaphrodite":
//            characterCell.genderImage.backgroundColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
//            characterCell.genderImage.image = UIImage(named: "jabba")
//        default:
//            print("wrong gender")
//        }
//        return characterCell
//    }
//
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        if editingStyle == .delete {
//            characters.remove(at: indexPath.row)
//            tableView.deleteRows(at: [indexPath], with: .fade)
//        }
//    }
//
//    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
//        true
//    }
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//                let student = characters[sourceIndexPath.row]
//                characters.insert(student, at: destinationIndexPath.row)
//                characters.remove(at: sourceIndexPath.row)
//    }
//}
