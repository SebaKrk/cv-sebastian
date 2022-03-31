//
//  GitHubPageView.swift
//  SciubaSebastianCV
//
//  Created by akra on 27/03/2022.
//

import Foundation
import UIKit

protocol GitHubPageViewDelegate : AnyObject {
    func didPressGitHubPageButton(urlString: String)
}

class GitHubPageView : UIView {
    
    weak var delegate : GitHubPageViewDelegate?
    
    let containerButton = UIButton()
    
    let gitHubIMG = UIImageView()
    let gitHubCreatedLabel = UILabel()
    var gitHubURL = ""
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureContainer()
        conigureCreatedLabel()
        configureGutHubIMG()
        addGestureToButtons()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - OBJC
    
    @objc func handleTapGesture() {
        let urlString = gitHubURL
        delegate?.didPressGitHubPageButton(urlString: urlString)
    }
    
//    MARK: - GestureRecognizer
    
    private func addGestureToButtons() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTapGesture))
        addGestureRecognizer(tap)
    }
    
//    MARK: - Setup UI Elemnts
    
    func setupData(user: User) {
        gitHubURL = user.html_url // usunac
    }
    
    func setupPageData(model: Model) {
        gitHubCreatedLabel.text = "since \(model.created_at)"
    }
    
//    MARK: - Constraints
    
    private func configureContainer() {
        addSubview(containerButton)
        containerButton.translatesAutoresizingMaskIntoConstraints = false
        
        containerButton.addTarget(self, action: #selector(handleTapGesture), for: .touchUpInside)
        containerButton.configuration = .tinted()
        containerButton.configuration?.cornerStyle = .medium
        containerButton.configuration?.baseBackgroundColor = .systemBlue
        containerButton.configuration?.baseForegroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            containerButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            containerButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            containerButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.95),
            containerButton.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.85)
        ])
    }
    
    private func conigureCreatedLabel() {
        containerButton.addSubview(gitHubCreatedLabel)
        gitHubCreatedLabel.translatesAutoresizingMaskIntoConstraints = false
        
        gitHubCreatedLabel.textColor = .secondaryLabel
        gitHubCreatedLabel.font = UIFont.systemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            gitHubCreatedLabel.centerXAnchor.constraint(equalTo: containerButton.centerXAnchor),
            gitHubCreatedLabel.centerYAnchor.constraint(equalTo: containerButton.centerYAnchor)
        ])
    }
    
    private func configureGutHubIMG() {
        containerButton.addSubview(gitHubIMG)
        gitHubIMG.translatesAutoresizingMaskIntoConstraints = false
        
        gitHubIMG.image = UIImage(named: "Github")
        
        NSLayoutConstraint.activate([
            gitHubIMG.centerYAnchor.constraint(equalTo: containerButton.centerYAnchor),
            gitHubIMG.trailingAnchor.constraint(equalTo: gitHubCreatedLabel.leadingAnchor,constant: -20),
            gitHubIMG.widthAnchor.constraint(equalToConstant: 25),
            gitHubIMG.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
}

// MARK: - GitHubPageView - Model

extension GitHubPageView {
    struct Model {
        let created_at: String
    }
}
