//
//  GitHubView.swift
//  SciubaSebastianCV
//
//  Created by akra on 29/03/2022.
//

import UIKit

protocol GitHubViewDelegate : AnyObject {
    func dismissGitHubViewController()
    func didPressGitHubPageButton(urlString: String)
    func didSelectPublicRepoCell(indexPath: IndexPath)
}

class GitHubView : UIView {
    
    let topView = GitHubTopView()
    let profileView = GitHubProfileView()
    let bioView = GitHubBioView()
    let folowersView = GitHubFollowerView()
    let publicRepoView = GitHubPublicRepoView()
    let listPubRepoTableView = GitHubPublicRepoTableView()
    let githubPage = GitHubPageView()
    
    weak var gitHubViewDelegate: GitHubViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureTopView()
        configureProfileView()
        configureBioView()
        configureFollowersView()
        configurePublicRepoView()
        configureGitHubButton()
        configureListPubRepoTeableView()
        signDelegates()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - SetupUsersData

    func getPublicReposDataView(repos: [GitHubPublicRepoTableView.Model]) {
        listPubRepoTableView.setuData(repos: repos)
    }
    
    
    func setUserModel(userModel: GitHubView.Model) {
        githubPage.setupPageData(model: userModel.githubView)
        publicRepoView.setupPublicRepoData(model: userModel.publicRepoView)
        folowersView.setupFollowerData(model: userModel.followerView)
        bioView.setupBioData(model: userModel.bioView)
        profileView.setupProfileData(model: userModel.profileView)
    }

    
//    MARK: - SignInDelegates
    
    func signDelegates() {
        topView.gitHubTopViewDelegate = self
        githubPage.delegate = self
        listPubRepoTableView.publicRepoDelegate = self
    }
    
//    MARK: - Constraints
    
    private func configureTopView() {
        addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.05)
        ])
    }
    
    private func configureProfileView() {
        addSubview(profileView)
        profileView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            profileView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.2)
        ])
    }
    
    private func configureBioView() {
        addSubview(bioView)
        bioView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bioView.topAnchor.constraint(equalTo: profileView.bottomAnchor),
            bioView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bioView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bioView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.11)
        ])
    }
    
    private func configureFollowersView() {
        addSubview(folowersView)
        folowersView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            folowersView.topAnchor.constraint(equalTo: bioView.bottomAnchor),
            folowersView.leadingAnchor.constraint(equalTo: leadingAnchor),
            folowersView.trailingAnchor.constraint(equalTo: trailingAnchor),
            folowersView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func configurePublicRepoView() {
        addSubview(publicRepoView)
        publicRepoView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            publicRepoView.topAnchor.constraint(equalTo: folowersView.bottomAnchor),
            publicRepoView.leadingAnchor.constraint(equalTo: leadingAnchor),
            publicRepoView.trailingAnchor.constraint(equalTo: trailingAnchor),
            publicRepoView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
    
    public func configureGitHubButton() {
        addSubview(githubPage)
        githubPage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            githubPage.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            githubPage.leadingAnchor.constraint(equalTo: leadingAnchor),
            githubPage.trailingAnchor.constraint(equalTo: trailingAnchor),
            githubPage.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    public func configureListPubRepoTeableView() {
       addSubview(listPubRepoTableView)
        listPubRepoTableView.translatesAutoresizingMaskIntoConstraints = false
                
        NSLayoutConstraint.activate([
            listPubRepoTableView.topAnchor.constraint(equalTo: publicRepoView.bottomAnchor),
            listPubRepoTableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 15),
            listPubRepoTableView.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -15),
            listPubRepoTableView.bottomAnchor.constraint(equalTo: githubPage.topAnchor)
        ])
    }
}

// MARK: - GitHubView - Model

extension GitHubView {
    struct Model {
        let githubView: GitHubPageView.Model
        let publicRepoView: GitHubPublicRepoView.Model
        let followerView: GitHubFollowerView.Model
        let bioView: GitHubBioView.Model
        let profileView: GitHubProfileView.Model
    }
    
}

// MARK: - GitHubTopViewDelegate, GitHubPageViewDelegate, GitHubPublicRepoDelegate

extension GitHubView : GitHubTopViewDelegate, GitHubPageViewDelegate, GitHubPublicRepoDelegate {

    
 
    func dismissGitHubViewController() {
        gitHubViewDelegate?.dismissGitHubViewController()
    }
    
    func didPressGitHubPageButton(urlString: String) {
        gitHubViewDelegate?.didPressGitHubPageButton(urlString: urlString)
    }
    
//    func didSelectPublicRepoCell(urlString: String) {
//        gitHubViewDelegate?.didSelectPublicRepoCell(urlString: urlString)
//    }
    func didSelectPublicRepoCell(indexPath: IndexPath) {
        gitHubViewDelegate?.didSelectPublicRepoCell(indexPath: indexPath)
    }
}


