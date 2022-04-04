//
//  SkillsAndCoursesCell.swift
//  SciubaSebastianCV
//
//  Created by akra on 02/04/2022.
//

import Foundation
import UIKit

class SkillsAndCoursesCell: UICollectionViewCell {
    
    let container = UIView()
    
    let courseIMG = UIImageView()
    let courseTitleLabel = UILabel()
    let authorLabel = UILabel()
    
    var skillsStackView = UIStackView()
    
    let skillOneLabel = CollectionSecondaryLabel()
    let skillSecondLabel = CollectionSecondaryLabel()
    let skillThirdLabel = CollectionSecondaryLabel()
    
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
        configureContainer()
        configureTitleLabel()
        configureTypeImg()
        configureCourseImg()
        configureStackView()
        configreAuthorLabel()
    }
    
    //    MARK: - StackView
    
    private func setupStackView() {
        skillsStackView = UIStackView(arrangedSubviews: [skillOneLabel,skillSecondLabel,skillThirdLabel])
        skillsStackView.axis = .vertical
        skillsStackView.distribution = .fillEqually
    }
    
    //    MARK: - Constraints
    
    private func configureContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 15
        container.layer.borderColor = UIColor.systemBlue.cgColor
        container.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            container.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5)
        ])
    }
    
    private func configureTitleLabel() {
        container.addSubview(courseTitleLabel)
        courseTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        courseTitleLabel.textColor = .label
        courseTitleLabel.font =  UIFont.systemFont(ofSize: 18)
        courseTitleLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            courseTitleLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: 5),
            courseTitleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10),
            courseTitleLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -50)
        ])
    }
    
    private func configureTypeImg() {
        container.addSubview(typeImg)
        typeImg.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            typeImg.topAnchor.constraint(equalTo: container.topAnchor,constant: 5),
            typeImg.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            typeImg.heightAnchor.constraint(equalToConstant: 20),
            typeImg.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func configureCourseImg() {
        container.addSubview(courseIMG)
        courseIMG.translatesAutoresizingMaskIntoConstraints = false
        
        courseIMG.layer.cornerRadius = 10
        courseIMG.layer.masksToBounds = true
        courseIMG.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            courseIMG.topAnchor.constraint(equalTo: courseTitleLabel.bottomAnchor,constant: 10),
            courseIMG.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10),
            courseIMG.heightAnchor.constraint(equalToConstant: 80),
            courseIMG.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configureStackView() {
        container.addSubview(skillsStackView)
        skillsStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            skillsStackView.topAnchor.constraint(equalTo: courseTitleLabel.bottomAnchor, constant: 10),
            skillsStackView.leadingAnchor.constraint(equalTo: courseIMG.trailingAnchor,constant: 5),
            skillsStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -5),
            skillsStackView.bottomAnchor.constraint(equalTo: courseIMG.bottomAnchor)
        ])
    }
    
    private func configreAuthorLabel() {
        container.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        authorLabel.textColor = .secondaryLabel
        authorLabel.font =  UIFont.systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: courseIMG.bottomAnchor,constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10),
        ])
    }
    
    // MARK: - Helpers
 
     func dowloadImage(from urlString: String) {
         guard let url = URL(string: urlString) else {return}
         let task = URLSession.shared.dataTask(with: url) { data, response, error in
             if error != nil {return}
             guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
             guard let data = data else {return}
             guard let image = UIImage(data: data) else {return}
             DispatchQueue.main.async {
                 self.courseIMG.image = image
             }
         }
         task.resume()
     }
}
