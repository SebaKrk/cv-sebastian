//
//  GitHubUserViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 25/03/2022.
//

import Foundation


protocol GitHubViewModelDelegate : AnyObject {
    func updateReposView(repos: [GitHubRepos])
    func updateUser(userModel: GitHubView.Model)
}


class GitHubUserViewModel {
    
    weak var gitHubViewModelDelegate : GitHubViewModelDelegate?
    
//    MARK: - User
    
    func setUserData() {
        Networking.shared.fetchUserData { result in
            switch result {
                
            case .success( let user):
                DispatchQueue.main.async {
                    let formatedUserModel =  self.formatUserData(user)
                    self.gitHubViewModelDelegate?.updateUser(userModel: formatedUserModel)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func formatUserData(_ user: User) -> GitHubView.Model {
        return GitHubView.Model(githubView: GitHubPageView.Model(created_at: user.created_at,
                                                                 html_url: user.html_url),
                                publicRepoView: GitHubPublicRepoView.Model(public_repos: user.public_repos),
                                followerView: GitHubFollowerView.Model(followers: user.followers),
                                bioView: GitHubBioView.Model(bio: user.bio),
                                profileView: GitHubProfileView.Model(login: user.login,
                                                                     name: user.name,
                                                                     location: user.location,
                                                                     company: user.company,
                                                                     avatarUrl: user.avatar_url))
    }
    
//    MARK: - Repos
    
    func setReposData() {
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
    
    // format dates
    // uialert controller
    
}

