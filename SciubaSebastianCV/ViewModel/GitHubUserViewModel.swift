//
//  GitHubUserViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 25/03/2022.
//

import Foundation
import UIKit

protocol GitHubViewModelDelegate : AnyObject {
    func updateReposView(repos: [GitHubPublicRepoTableView.Model])
    func updateUser(userModel: GitHubView.Model)
}



class GitHubUserViewModel {

    var repoArray = [GitHubRepos]()
    
    weak var gitHubViewModelDelegate : GitHubViewModelDelegate?
    
    //    MARK: - User
    
    func setUserData() {
        let urlString = Networking.basicUserURL
        guard let url = URL(string: urlString) else {return}
        Networking.shared.fetchData(from: url) { (result: Result<User, DataError>) in
            switch result {
            case .success(let user):
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
        let urlString = Networking.basicRepoURL
        guard let url = URL(string: urlString) else {return}
        Networking.shared.fetchData(from: url) { (result: Result<[GitHubRepos], DataError>) in
            switch result {
            case .success(let repos):
                DispatchQueue.main.async {
//                    self.gitHubViewModelDelegate?.updateReposView(repos: repo)
                    let frormatedRepo = repos.map { repo in
                        return self.createGiiHubRepo(repo)
                    }
                    self.gitHubViewModelDelegate?.updateReposView(repos: frormatedRepo)
                    self.repoArray = repos
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func createGiiHubRepo(_ repo: GitHubRepos) -> GitHubPublicRepoTableView.Model {
//        guard let languageImg = UIImage(named: repo.language) else {
//            return nil
//        }
//        return GitHubPublicRepoTableView.Model(createdAt: convertDate(date: repo.created_at), name: repo.name, languageImg: languageImg )
        
        return GitHubPublicRepoTableView.Model(createdAt: repo.created_at, name: repo.name, languageImg: UIImage(named: repo.language) ?? UIImage(named: "DefaultImg"))
    }
    
    func getUrlStrig(indexPath : IndexPath ) -> String {
        let url = repoArray[indexPath.row].html_url
        return url
    }
    

    func convertDate(date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let newDate = dateFormatter.date(from: date)
        let monthAndYerDateFormatter = DateFormatter()
        monthAndYerDateFormatter.dateFormat = "d MMMM yyyy"
        return monthAndYerDateFormatter.string(from: newDate ?? Date())
    }
}
