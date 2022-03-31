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
    let scoreLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureContainer()
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
}

