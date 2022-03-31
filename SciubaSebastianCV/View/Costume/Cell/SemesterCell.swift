//
//  SemesterCell.swift
//  SciubaSebastianCV
//
//  Created by akra on 31/03/2022.
//

import Foundation
import UIKit

class SemesterCell : UITableViewCell {
    
    static let semesterReuseIdentifier = "semesterReuseIdentifier"
    
    let container = UIView()
    
    let academicLabel = UILabel()
    let academicYersLabel = UILabel()
    let semLabel = UILabel()
    let semDataLabel = UILabel()
    let subLabel = UILabel()
    let subNummberLabel = UILabel()
    let scoreIMG = UIImageView()
    let scoreLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureContainer()
        configureSemLabel()
        configureSemDataLabel()
        configureAcademicLabel()
        configureAcademicYearLabel()
        configureSubLabel()
        configureSubNummberLabel()
        configureScoreIMG()
        configureScoreLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func configureSemLabel() {
        container.addSubview(semLabel)
        semLabel.translatesAutoresizingMaskIntoConstraints = false
        
        semLabel.text = "Star date:".localized
        semLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            semLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            semLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 15)
        ])
    }
    
    private func configureSemDataLabel() {
        container.addSubview(semDataLabel)
        semDataLabel.translatesAutoresizingMaskIntoConstraints = false
        
        semDataLabel.font = UIFont.systemFont(ofSize: 12)
        semDataLabel.textColor = .systemBlue
        
        NSLayoutConstraint.activate([
            semDataLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            semDataLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
        ])
    }
    
    
    private func configureAcademicLabel() {
        container.addSubview(academicLabel)
        academicLabel.translatesAutoresizingMaskIntoConstraints = false
        
        academicLabel.text = "Semester:".localized
        academicLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            academicLabel.bottomAnchor.constraint(equalTo: semLabel.topAnchor,constant: -10),
            academicLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 15)
        ])
    }
    private func configureAcademicYearLabel() {
        container.addSubview(academicYersLabel)
        academicYersLabel.translatesAutoresizingMaskIntoConstraints = false
        
        academicYersLabel.font = UIFont.systemFont(ofSize: 12)
        academicYersLabel.textColor = .systemBlue
        
        NSLayoutConstraint.activate([
            academicYersLabel.bottomAnchor.constraint(equalTo: semLabel.topAnchor,constant: -10),
            academicYersLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
        ])
    }
    
    private func configureSubLabel() {
        container.addSubview(subLabel)
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subLabel.text = "Subjects:".localized
        subLabel.font = UIFont.boldSystemFont(ofSize: 14)
        
        NSLayoutConstraint.activate([
            subLabel.topAnchor.constraint(equalTo: semLabel.bottomAnchor,constant: 10),
            subLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: 15)
        ])
    }
    private func configureSubNummberLabel() {
        container.addSubview(subNummberLabel)
        subNummberLabel.translatesAutoresizingMaskIntoConstraints = false
        
        subNummberLabel.font = UIFont.systemFont(ofSize: 12)
        subNummberLabel.textColor = .systemBlue
        
        NSLayoutConstraint.activate([
            subNummberLabel.topAnchor.constraint(equalTo: semLabel.bottomAnchor,constant: 10),
            subNummberLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor),
        ])
    }
    
    private func configureScoreIMG() {
        container.addSubview(scoreIMG)
        scoreIMG.translatesAutoresizingMaskIntoConstraints = false
        
        scoreIMG.image = UIImage(systemName: "gyroscope")
        scoreIMG.tintColor = .systemBlue
        
        NSLayoutConstraint.activate([
            scoreIMG.centerYAnchor.constraint(equalTo: container.centerYAnchor,constant: -10),
            scoreIMG.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -20),
            scoreIMG.heightAnchor.constraint(equalToConstant: 20),
            scoreIMG.widthAnchor.constraint(equalToConstant: 20)
        ])
    }
    private func configureScoreLabel() {
        container.addSubview(scoreLabel)
        scoreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        scoreLabel.font = UIFont.boldSystemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            scoreLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor,constant: 10),
            scoreLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -20),
        ])
    }
}
