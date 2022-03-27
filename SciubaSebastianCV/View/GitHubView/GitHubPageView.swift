//
//  GitHubPageView.swift
//  SciubaSebastianCV
//
//  Created by akra on 27/03/2022.
//

import Foundation
import UIKit

class GitHubPageView : UIView {
    
    let gitHubIMG = UIImageView()
    let gitHubCreatedLabel = UILabel()
    var gitHubURL = ""
    
    let gitHubUserViewModel = GitHubUserViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUIElemenets()
        conigureCreatedLabel()
        configureGutHubIMG()
        addGestureToButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - OBJC
    
    @objc func handleTapGesture() {
        print("safari \(gitHubURL)")
    }
    
//    MARK: - GestureRecognizer
    
    private func addGestureToButtons() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        addGestureRecognizer(tap)
    }
    
//    MARK: - Setup UI Elemnts
    
    private func setupUIElemenets() {
        gitHubUserViewModel.getUserData()
        gitHubUserViewModel.ghUserViewModelDelegate = self
    }

//    MARK: - Constraints
    
    private func conigureCreatedLabel() {
        addSubview(gitHubCreatedLabel)
        gitHubCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        gitHubCreatedLabel.textColor = .secondaryLabel
        gitHubCreatedLabel.font = UIFont.systemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            gitHubCreatedLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            gitHubCreatedLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    private func configureGutHubIMG() {
        addSubview(gitHubIMG)
        gitHubIMG.translatesAutoresizingMaskIntoConstraints = false
        
        gitHubIMG.image = UIImage(named: "Github")
        
        NSLayoutConstraint.activate([
            gitHubIMG.centerYAnchor.constraint(equalTo: centerYAnchor),
            gitHubIMG.trailingAnchor.constraint(equalTo: gitHubCreatedLabel.leadingAnchor,constant: -20),
            gitHubIMG.widthAnchor.constraint(equalToConstant: 25),
            gitHubIMG.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}
// MARK: - GitHubUserViewModelDelegate

extension GitHubPageView : GitHubUserViewModelDelegate {
    func updateView(user: Users) {
        gitHubCreatedLabel.text = "since \(user.created_at)"
        gitHubURL = user.html_url
    }
}
