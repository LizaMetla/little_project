//
//  StudentsCollectionViewCell.swift
//  newone
//
//  Created by Елизавета Метла on 3/27/20.
//  Copyright © 2020 Елизавета Метла. All rights reserved.
//

import UIKit

class StudentsCollectionViewCell: UICollectionViewCell {
    
    func createCell() {
        addSubview(mainImageView)
        addSubview(studentName)
        addSubview(studentSurname)
        backgroundColor = .white
        mainImageView.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        mainImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        mainImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 2 / 3).isActive = true
        studentName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        studentName.bottomAnchor.constraint(equalTo: studentSurname.topAnchor, constant: 5).isActive = true
        studentName.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor).isActive = true
        studentName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        studentSurname.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5).isActive = true
        studentSurname.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5).isActive = true
        studentSurname.trailingAnchor.constraint(greaterThanOrEqualTo: trailingAnchor).isActive = true
        studentSurname.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    static let cellID = "StudentCell"
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    let studentName: UILabel = {
        let name = UILabel()
        name.text = "name"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    let studentSurname: UILabel = {
        let name = UILabel()
        name.text = "surname"
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createCell()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5
        self.layer.shadowRadius = 10
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 5, height: 8)
        self.clipsToBounds = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
