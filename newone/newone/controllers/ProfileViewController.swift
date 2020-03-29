//
//  ProfileViewController.swift
//  newone
//
//  Created by Елизавета Метла on 2/21/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var studentsLabel: UILabel!
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    var collectionView: UICollectionView!
    var studentImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 40
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 40, bottom: 10, right: 40)
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = #colorLiteral(red: 0.2431372549, green: 0.7294117647, blue: 1, alpha: 1)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: studentsLabel.bottomAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.register(ProfileCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCell")
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let collectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? ProfileCollectionViewCell else {fatalError("No cell")}
        ProfileManager.shared.studentDataForProfile(studentNumber: indexPath.row)
        collectionCell.name.text = ProfileManager.shared.name
        collectionCell.surname.text = ProfileManager.shared.surname
        switch ProfileManager.shared.gender {
        case "м":
            collectionCell.studentPhoto.image = UIImage(named: "boy")
        default:
            collectionCell.studentPhoto.image = UIImage(named: "girl")
        }
        
        
        return collectionCell
    }
}

extension ProfileViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: UIScreen.main.bounds.width - 80, height: 500)
    }
}
