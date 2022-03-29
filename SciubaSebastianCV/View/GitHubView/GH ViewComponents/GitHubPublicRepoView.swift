//
//  GitHubPublicRepoView.swift
//  SciubaSebastianCV
//
//  Created by akra on 27/03/2022.
//

import Foundation
import UIKit

class GitHubPublicRepoView : UIView {
    
    let container = UIView()
    
    let publicRepoImageView = UIImageView()
    let publicRepoLabel = UILabel()
    let publicRepoScore = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureContainer()
        configurePublicRepoLabel()
        configurePublicRepoImageView()
        configurePublicRepoScore()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setup UIElemenets
    
    func setupData(users: User) {
        publicRepoScore.text = "\(users.public_repos)"
    }
    
//    MARK: - Constraints
    
    private func configureContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: centerXAnchor),
            container.centerYAnchor.constraint(equalTo: centerYAnchor),
            container.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95),
            container.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85)
        ])
    }
    
    private func configurePublicRepoLabel() {
        addSubview(publicRepoLabel)
        publicRepoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        publicRepoLabel.font = UIFont.systemFont(ofSize: 16)
        publicRepoLabel.text = "public repo"
        
        NSLayoutConstraint.activate([
            publicRepoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            publicRepoLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func configurePublicRepoImageView() {
        addSubview(publicRepoImageView)
        publicRepoImageView.translatesAutoresizingMaskIntoConstraints = false
        
        publicRepoImageView.image = UIImage(systemName: "folder.badge.person.crop")
        
        NSLayoutConstraint.activate([
            publicRepoImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            publicRepoImageView.trailingAnchor.constraint(equalTo: publicRepoLabel.leadingAnchor,constant: -40),
        ])
    }
    
    private func configurePublicRepoScore() {
        addSubview(publicRepoScore)
        publicRepoScore.translatesAutoresizingMaskIntoConstraints = false
        
        publicRepoScore.font = UIFont.boldSystemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            publicRepoScore.centerYAnchor.constraint(equalTo: centerYAnchor),
            publicRepoScore.leadingAnchor.constraint(equalTo: publicRepoLabel.trailingAnchor,constant: 40)
        ])
    }
}
