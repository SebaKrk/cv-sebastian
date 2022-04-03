//
//  SkillsAndCoursesCell.swift
//  SciubaSebastianCV
//
//  Created by akra on 02/04/2022.
//

import Foundation
import UIKit

class SkillsAndCoursesCell: UICollectionViewCell {
    
    let courseIMG = UIImageView()
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    
    var skillsStackView = UIStackView()
    
    let skillOneLabel = UILabel()
    let skillSecondLabel = UILabel()
    let skillThirdLabel = UILabel()
    
    let typeImg = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStackView()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .yellow
        configureTitleLabel()
        configreAuthorLabel()
        configureTypeImg()
        configureCourseImg()
        configureStackView()
    }
    
    //    MARK: - StackView
    
    private func setupStackView() {
        skillsStackView = UIStackView(arrangedSubviews: [skillOneLabel,skillSecondLabel,skillThirdLabel])
        skillsStackView.axis = .vertical
        skillsStackView.distribution = .fillEqually
    }
    
    //    MARK: - Constraints
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "iOS App Decelopment Bootcamp"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10)
        ])
    }
    
    private func configreAuthorLabel() {
        addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        authorLabel.text = "Dr. Angela Yu"
        authorLabel.font =  UIFont.systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
        ])
    }
    
    private func configureTypeImg() {
        addSubview(typeImg)
        typeImg.translatesAutoresizingMaskIntoConstraints = false
        
        typeImg.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            typeImg.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            typeImg.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            typeImg.heightAnchor.constraint(equalToConstant: 40),
            typeImg.widthAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    private func configureCourseImg() {
        addSubview(courseIMG)
        courseIMG.translatesAutoresizingMaskIntoConstraints = false
        courseIMG.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            courseIMG.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,constant: 10),
            courseIMG.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            courseIMG.heightAnchor.constraint(equalToConstant: 120),
            courseIMG.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configureStackView() {
        addSubview(skillsStackView)
        skillsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        skillsStackView.backgroundColor = .red
        
        skillOneLabel.text = "How to use storyboard"
        skillSecondLabel.text = "implement Auto Layout"
        skillThirdLabel.text = "Basic Netwok Call"
        
        NSLayoutConstraint.activate([
            skillsStackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            skillsStackView.leadingAnchor.constraint(equalTo: courseIMG.trailingAnchor,constant: 5),
            skillsStackView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            skillsStackView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -10)
        ])
    }
}


//let title : String
//let author : String
//let courseImg : String
//let type : String
//let skills : Skills
//}
//struct Skills {
//let first : String
//let second : String
//let third : String
