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
    
    deinit {
        debugPrint("GitHub ViewController deinitialization from the memory")
    }
    
    private func setupView() {
        view.backgroundColor = .white
        configureGitHubView()
        getData()
        signDelegate()
    }
    
//    MARK: - GetData
    
    private func getData() {
        gitHubViewModel.gitHubViewModelDelegate = self
        gitHubViewModel.setUserData()
        gitHubViewModel.setReposData()
    }
    
    func signDelegate() {
        gitHubView.gitHubViewDelegate = self
//        gitHubView.gitHubViewPageDelegate = self
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

// MARK: - GitHubViewModelDelegate

extension GitHubVC : GitHubViewModelDelegate {
    
    func updateUserDataView(user: User) {
        gitHubView.setUsersDataView(user: user)
    }
    
    func updateReposView(repos: [GitHubRepos]) {
        gitHubView.getPublicReposDataView(repos: repos)
    }
}

// MARK: - GitHubViewDelegate

extension GitHubVC: GitHubViewDelegate {

    func dismissGitHubViewController() {
        dismiss(animated: true, completion: nil)
    }
    
    func didPressGitHubPageButton(urlString: String) {
        showSafariService(with: urlString)
    }
}

