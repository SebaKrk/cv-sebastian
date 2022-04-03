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
    let titleLabel = UILabel()
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
    
    private func configureContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            container.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            container.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            container.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -5)
        ])
    }
    
    private func configureTitleLabel() {
        container.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.text = "iOS App Decelopment Bootcamp"
        titleLabel.textColor = .label
        titleLabel.font =  UIFont.systemFont(ofSize: 22)
        titleLabel.adjustsFontSizeToFitWidth = true
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: container.topAnchor,constant: 5),
            titleLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10)
        ])
    }
    
    private func configreAuthorLabel() {
        container.addSubview(authorLabel)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        
        authorLabel.text = "Dr. Angela Yu"
        authorLabel.textColor = .secondaryLabel
        authorLabel.font =  UIFont.systemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 5),
            authorLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10),
        ])
    }
    
    private func configureTypeImg() {
        container.addSubview(typeImg)
        typeImg.translatesAutoresizingMaskIntoConstraints = false
        
        typeImg.image = UIImage(named: "Swift")
        
        NSLayoutConstraint.activate([
            typeImg.topAnchor.constraint(equalTo: container.topAnchor,constant: 5),
            typeImg.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -10),
            typeImg.heightAnchor.constraint(equalToConstant: 30),
            typeImg.widthAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func configureCourseImg() {
        container.addSubview(courseIMG)
        courseIMG.translatesAutoresizingMaskIntoConstraints = false
        
        courseIMG.layer.cornerRadius = 10
        courseIMG.layer.masksToBounds = true
        courseIMG.contentMode = .scaleAspectFill
        courseIMG.layer.borderColor = UIColor.systemBlue.cgColor
        courseIMG.layer.borderWidth = 2
        
        NSLayoutConstraint.activate([
            courseIMG.topAnchor.constraint(equalTo: authorLabel.bottomAnchor,constant: 10),
            courseIMG.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 10),
            courseIMG.heightAnchor.constraint(equalToConstant: 120),
            courseIMG.widthAnchor.constraint(equalToConstant: 120)
        ])
    }
    
    private func configureStackView() {
        container.addSubview(skillsStackView)
        skillsStackView.translatesAutoresizingMaskIntoConstraints = false
        
        skillOneLabel.text = "- How to use storyboard"
        skillSecondLabel.text = "- implement Auto Layout"
        skillThirdLabel.text = "- Basic Netwok Call"
    
        NSLayoutConstraint.activate([
            skillsStackView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 10),
            skillsStackView.leadingAnchor.constraint(equalTo: courseIMG.trailingAnchor,constant: 5),
            skillsStackView.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -10),
            skillsStackView.bottomAnchor.constraint(equalTo: courseIMG.bottomAnchor)
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
