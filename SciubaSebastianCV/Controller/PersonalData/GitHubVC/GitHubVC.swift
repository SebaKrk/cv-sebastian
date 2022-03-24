//
//  GitHubVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 23/03/2022.
//

import UIKit

class GitHubVC : UIViewController {
    
    let topView = UIView()
    let bioView = UIView()
    let folowersView = UIView()
    let publicRepoView = UIView()
    let listPubRepoTV = UITableView()
    let githubPage = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .red
        configureTopView()
        configureBioView()
        configureFollowersView()
        configurePublicRepoView()
        configureGitHubButton()
        configureListPubRepoTeableView()
    }
    
//    MARK: - Constraints
    
    private func configureTopView() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        topView.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func configureBioView() {
        view.addSubview(bioView)
        bioView.translatesAutoresizingMaskIntoConstraints = false
        bioView.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            bioView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bioView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bioView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15)
        ])
    }
    
    private func configureFollowersView() {
        view.addSubview(folowersView)
        folowersView.translatesAutoresizingMaskIntoConstraints = false
        folowersView.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            folowersView.topAnchor.constraint(equalTo: bioView.bottomAnchor),
            folowersView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            folowersView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            folowersView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func configurePublicRepoView() {
        view.addSubview(publicRepoView)
        publicRepoView.translatesAutoresizingMaskIntoConstraints = false
        publicRepoView.backgroundColor = .cyan
        
        NSLayoutConstraint.activate([
            publicRepoView.topAnchor.constraint(equalTo: folowersView.bottomAnchor),
            publicRepoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            publicRepoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            publicRepoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1)
        ])
    }
    
    public func configureGitHubButton() {
        view.addSubview(githubPage)
        githubPage.translatesAutoresizingMaskIntoConstraints = false
        githubPage.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            githubPage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            githubPage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            githubPage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            githubPage.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    public func configureListPubRepoTeableView() {
        view.addSubview(listPubRepoTV)
        listPubRepoTV.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            listPubRepoTV.topAnchor.constraint(equalTo: publicRepoView.bottomAnchor),
            listPubRepoTV.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            listPubRepoTV.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            listPubRepoTV.bottomAnchor.constraint(equalTo: githubPage.topAnchor)
        ])
    }
    
}
