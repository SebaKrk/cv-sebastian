//
//  GitHubFollowerView.swift
//  SciubaSebastianCV
//
//  Created by akra on 27/03/2022.
//

import Foundation
import UIKit

class GitHubFollowerView : UIView {
    
    let container = UIView()

    let followerImageView = UIImageView()
    let followerLabel = UILabel()
    let followerScore = UILabel()
    
//    let gitHubUserViewModel = GitHubUserViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        setupUIElements()
        configureContainer()
        configureFollowerLabel()
        configureFolloverImageView()
        configureFollowerScore()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UIElemenets
    
    func setupData(users: Users) {
        followerScore.text = "\(users.followers)"
    }
    
//        func setupUIElements() {
//            followerImageView.image = UIImage(systemName: "person.3")
//            followerLabel.text = "follower"
//            gitHubUserViewModel.getUserData()
//            gitHubUserViewModel.gitHubViewModelDelegate = self
//        }
    
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
    

    private func configureFollowerLabel() {
        addSubview(followerLabel)
        followerLabel.translatesAutoresizingMaskIntoConstraints = false
        
        followerLabel.font = UIFont.systemFont(ofSize: 16)
        followerLabel.text = "follower"
        
        NSLayoutConstraint.activate([
            followerLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            followerLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
    
    private func configureFolloverImageView() {
        addSubview(followerImageView)
        followerImageView.translatesAutoresizingMaskIntoConstraints = false
        
        followerImageView.image = UIImage(systemName: "person.3")
        
        NSLayoutConstraint.activate([
            followerImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            followerImageView.trailingAnchor.constraint(equalTo: followerLabel.leadingAnchor,constant: -40),
        ])
    }
    
    private func configureFollowerScore() {
        addSubview(followerScore)
        followerScore.translatesAutoresizingMaskIntoConstraints = false
        
        followerScore.font = UIFont.boldSystemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            followerScore.centerYAnchor.constraint(equalTo: centerYAnchor),
            followerScore.leadingAnchor.constraint(equalTo: followerLabel.trailingAnchor,constant: 40)
        ])
    }
}

//// MARK: - GitHubUserViewModelDelegate
//
//extension GitHubFollowerView : GitHubViewModelDelegate {
//    func updateUserDataView(user: Users) {
//        followerScore.text = "\(user.followers)"
//    }
//}
