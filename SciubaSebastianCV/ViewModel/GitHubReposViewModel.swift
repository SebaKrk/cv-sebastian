//
//  GitHubReposViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 28/03/2022.
//

import Foundation

protocol GitHubReposViewModellDelegate : AnyObject {
    func updateView(repos: [GitHubRepos])
}

class GitHubReposViewModel {
    
    var ghReposViewModelDelegate : GitHubReposViewModellDelegate?
    
    func getRepoData() {
        Networking.shared.getReposData { result in
            switch result {
                
            case .success( let repo):
                DispatchQueue.main.async {
                    self.ghReposViewModelDelegate?.updateView(repos: repo)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
