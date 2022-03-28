//
//  PublicRepoCell.swift
//  SciubaSebastianCV
//
//  Created by akra on 28/03/2022.
//

import Foundation
import UIKit

class PublicRepoCell : UITableViewCell {
    
    static let publicRepoIdentifier = "publicRepoIdentifier"
    
    let repoNameLabel = UILabel()
    let repoCreatedLabel = UILabel()
    let languageLabel = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureRepoNameLabel()
        configureCreatedLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureRepoNameLabel() {
        addSubview(repoNameLabel)
        repoNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        repoNameLabel.textColor = .systemBlue
        
        NSLayoutConstraint.activate([
            repoNameLabel.topAnchor.constraint(equalTo: topAnchor,constant: 5),
            repoNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20)
        ])
    }
    
    private func configureCreatedLabel() {
        addSubview(repoCreatedLabel)
        repoCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        repoCreatedLabel.textColor = .secondaryLabel
        repoCreatedLabel.font = UIFont.systemFont(ofSize: 12)
        
        NSLayoutConstraint.activate([
            repoCreatedLabel.topAnchor.constraint(equalTo: repoNameLabel.bottomAnchor,constant: 5),
            repoCreatedLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20)
        ])
    }
    
    
}
