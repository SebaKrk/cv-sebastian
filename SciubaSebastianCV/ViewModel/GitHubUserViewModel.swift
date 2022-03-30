//
//  GitHubUserViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 25/03/2022.
//

import Foundation


protocol GitHubViewModelDelegate : AnyObject {
    func updateUserDataView(user: User)
    func updateReposView(repos: [GitHubRepos])
}

class GitHubUserViewModel {
    
    weak var gitHubViewModelDelegate : GitHubViewModelDelegate?
    
//    MARK: - User
    
    func getUserData() {
        Networking.shared.fetchUserData { result in
            switch result {
                
            case .success( let user):
                DispatchQueue.main.async {
                    self.gitHubViewModelDelegate?.updateUserDataView(user: user)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
//    MARK: - Repos
    
    func getReposData() {
        Networking.shared.fetchReposData { result in
            switch result {
                
            case .success(let repo):
                DispatchQueue.main.async {
                    self.gitHubViewModelDelegate?.updateReposView(repos: repo)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

