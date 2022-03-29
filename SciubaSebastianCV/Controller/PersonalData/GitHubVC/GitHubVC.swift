//
//  GitHubVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 23/03/2022.
//

import UIKit

class GitHubVC : UIViewController{

    let gitHubView = GitHubView()
    let gitHubViewModel = GitHubUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
//    MARK: - SetupView
    
    private func setupView() {
        view.backgroundColor = .white
        configureGitHubView()
        getData()
    }
    
//    MARK: - GetData
    
    private func getData() {
        gitHubViewModel.gitHubViewModelDelegate = self
        gitHubViewModel.getUserData()
        gitHubViewModel.getReposData()
    }

    //    MARK: - Constraints

    private func configureGitHubView() {
        view.addSubview(gitHubView)
        gitHubView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gitHubView.topAnchor.constraint(equalTo: view.topAnchor),
            gitHubView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gitHubView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gitHubView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - GitHubViewModelDelegate

extension GitHubVC : GitHubViewModelDelegate {
    
    func updateUserDataView(user: User) {
        gitHubView.getUsersDataView(user: user)
    }
    
    func updateReposView(repos: [GitHubRepos]) {
        gitHubView.getPublicReposDataView(repos: repos)
    }
}
