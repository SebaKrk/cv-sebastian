//
//  GitHubVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 23/03/2022.
//

import UIKit

class GitHubVC : UIViewController{
    
    let doneButton = UIButton()
    let gitHubView = GitHubView()
    
    let gitHubViewModel = GitHubUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
//    MARK: - SetupView
    
    private func setupView() {
        view.backgroundColor = .white
        
        configureDoneButton()
        configureGitHubView()
        getData()
    }
    
//    MARK: - GetData
    
    private func getData() {
        gitHubViewModel.gitHubViewModelDelegate = self
        gitHubViewModel.getUserData()
        gitHubViewModel.getReposData()
    }
    

//    MARK: - OBJC
    
    @objc func handleDoneButton() {
        dismiss(animated: true, completion: nil)
    }
    
    //    MARK: - Constraints
    
    private func configureDoneButton() {
        view.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        doneButton.setTitle("done", for: .normal)
        doneButton.setTitleColor(.systemBlue, for: .normal)
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            doneButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 20),
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20)
        ])
    }
    
    private func configureGitHubView() {
        view.addSubview(gitHubView)
        gitHubView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            gitHubView.topAnchor.constraint(equalTo: doneButton.bottomAnchor),
            gitHubView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            gitHubView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            gitHubView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

//MARK: - GitHubViewModelDelegate

extension GitHubVC : GitHubViewModelDelegate {
    
    func updateUserDataView(user: Users) {
        gitHubView.getUsersDataView(user: user)
    }
    
    func updateReposView(repos: [GitHubRepos]) {
        gitHubView.getPublicReposDataView(repos: repos)
    }
}

