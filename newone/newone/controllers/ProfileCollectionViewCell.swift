//
//  ProfileCollectionViewCell.swift
//  newone
//
//  Created by Елизавета Метла on 28.03.2020.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class ProfileCollectionViewCell: UICollectionViewCell {
    
    let studentPhoto: UIImageView = {
        let studentPhoto = UIImageView()
        studentPhoto.translatesAutoresizingMaskIntoConstraints = false
        return studentPhoto
    }()
    
    let name: UILabel = {
        let name = UILabel()
        name.font = name.font.withSize(19)
        name.text = "name"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    let surname: UILabel = {
        let surname = UILabel()
        surname.font = surname.font.withSize(16)
        surname.text = "surname"
        surname.textColor = .gray
        surname.translatesAutoresizingMaskIntoConstraints = false
        return surname
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(studentPhoto)
        addSubview(name)
        addSubview(surname)
        studentPhoto.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        studentPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        studentPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        studentPhoto.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 3 / 4).isActive = true
        name.topAnchor.constraint(equalTo: studentPhoto.bottomAnchor, constant: 20).isActive = true
        name.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        surname.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 20).isActive = true
        surname.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
         backgroundColor = .white
         layer.cornerRadius = 5
         layer.shadowColor = #colorLiteral(red: 0.2431372549, green: 0.3921640939, blue: 1, alpha: 1)
         layer.shadowOffset = CGSize(width: 3, height: 7)
         layer.shadowRadius = 10
         layer.shadowOpacity = 1
         clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
