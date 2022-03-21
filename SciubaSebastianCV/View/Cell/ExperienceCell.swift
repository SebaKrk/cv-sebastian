//
//  ExperienceCell.swift
//  SciubaSebastianCV
//
//  Created by akra on 21/03/2022.
//

import UIKit

class ExperienceCell : UITableViewCell {
    
    static let expIdentifier = "expIdentifier"
    
    let startDateLabel = UILabel()
    let endDateLabel = UILabel()
    let positionLabel = UILabel()
    let companyLabel = UILabel()
    let locationLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureStartDatelabel()
        configureEndDateLabel()
        configurePositionLabel()
        configureCompanyLabel()
        configureLocationLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureStartDatelabel() {
        addSubview(startDateLabel)
        startDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            startDateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            startDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5)
        ])
    }
    
    private func configureEndDateLabel() {
        addSubview(endDateLabel)
        endDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            endDateLabel.topAnchor.constraint(equalTo: startDateLabel.bottomAnchor, constant: 2),
            endDateLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 5)
        ])
    }
    
    private func configurePositionLabel() {
        addSubview(positionLabel)
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        positionLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            positionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            positionLabel.leadingAnchor.constraint(equalTo: startDateLabel.trailingAnchor, constant: 10),
        ])
    }
    
    private func configureCompanyLabel() {
        addSubview(companyLabel)
        companyLabel.translatesAutoresizingMaskIntoConstraints  = false
        
        NSLayoutConstraint.activate([
            companyLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: 10),
            companyLabel.leadingAnchor.constraint(equalTo: startDateLabel.trailingAnchor,constant: 10)
        ])
    }
    
    private func configureLocationLabel() {
        addSubview(locationLabel)
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: positionLabel.bottomAnchor, constant: 10),
            locationLabel.leadingAnchor.constraint(equalTo: companyLabel.trailingAnchor, constant: 2)
        ])
    }
    
}
