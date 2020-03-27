//
//  ProfileViewController.swift
//  newone
//
//  Created by Елизавета Метла on 2/21/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    @IBOutlet weak var studentsLabel: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.itemWidth, height: self.studentCollectionView.frame.height * 0.4)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cells.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
            studentCollectionView.dequeueReusableCell(withReuseIdentifier: StudentCollectionViewCell.cellID,
            for: indexPath) as? StudentCollectionViewCell else {fatalError("no cell")}
        cell.studentName.text = cells[indexPath.row].name
        cell.studentSurname.text = cells[indexPath.row].surname
        switch cells[indexPath.row].gender {
        case "м":
            cell.mainImageView.image = UIImage(named: "boy")
        default:
            cell.mainImageView.image = UIImage(named: "girl")
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        ProfileManager.shared.studentNumber = indexPath.row
        switch cells[indexPath.row].gender {
        case "м":
            let manProfileVC = ProfileViewController(nibName: "ManViewController", bundle: nil)
            ProfileViewController.page = 2
            manProfileVC.modalPresentationStyle = .fullScreen
            self.present(manProfileVC, animated: true, completion: nil)
        case "ж":
            let womanProfileVC = ProfileViewController(nibName: "WomanViewController", bundle: nil)
            ProfileViewController.page = 1
            womanProfileVC.modalPresentationStyle = .fullScreen
            self.present(womanProfileVC, animated: true, completion: nil)
        default:
            print("No view controller!")
        }
        
        
    private var galleryCollectionView = UICollectionView(frame: <#T##CGRect#>, collectionViewLayout: <#T##UICollectionViewLayout#>)



//
//    @IBOutlet weak var backToWelcome: UINavigationBar!
//
//    var studentNumber = 0
//       var studentNameLabel = "Name"
//       var studentSurnameLabel = "Surname"
//       var studentAgeLabel = "Age"
//       var studentGenderLabel = "Gender"
//       var infoPartLabel = """
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//a
//"""
//
////    override func viewDidLoad() {
////        super.viewDidLoad()
////        let studentDta = ProfileManager(studentNumber: studentNumber)
////        nameLabel.text = "Name: \(studentData.name)"
////        surnameLabel.text = "Surname: \(studentData.surname)"
////        ageLabel.text = "Age: \(studentData.age)"
////        infoLabel.text = infoPartLabel
////        switch studentData.gender {
////        case "м":
////            genderLabel.text = "Gender: male"
////        case "ж":
////            genderLabel.text = "Gender: female"
////        default:
////            genderLabel.text = "Gender: unknown"
////        }
////
////        // Do any additional setup after loading the view.
////    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}
}
