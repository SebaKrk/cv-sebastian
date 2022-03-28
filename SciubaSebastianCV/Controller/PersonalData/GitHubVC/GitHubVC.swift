//
//  GitHubVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 23/03/2022.
//

import UIKit

class GitHubVC : UIViewController {
    
    let doneButton = UIButton()
    
    let topView = GitHubTopProfileView()
    let bioView = GitHubBioView()
    let folowersView = GitHubFollowerView()
    let publicRepoView = GitHubPublicRepoView()
    let listPubRepoTV = UITableView()
    let githubPage = GitHubPageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        
        configureDoneButton()
        
        configureTopView()
        configureBioView()
        configureFollowersView()
        configurePublicRepoView()
        configureGitHubButton()
        configureListPubRepoTeableView()
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
    
    private func configureTopView() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 40),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func configureBioView() {
        view.addSubview(bioView)
        bioView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bioView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bioView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bioView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bioView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.11)
        ])
    }
    
    private func configureFollowersView() {
        view.addSubview(folowersView)
        folowersView.translatesAutoresizingMaskIntoConstraints = false
        
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
        
        listPubRepoTV.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            listPubRepoTV.topAnchor.constraint(equalTo: publicRepoView.bottomAnchor),
            listPubRepoTV.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            listPubRepoTV.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -30),
            listPubRepoTV.bottomAnchor.constraint(equalTo: githubPage.topAnchor)
        ])
    }
    
}
