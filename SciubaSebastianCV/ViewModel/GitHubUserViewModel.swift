//
//  GitHubUserViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 25/03/2022.
//

import Foundation

protocol GitHubUserViewModelDelegate : AnyObject {
    func updateView(avatarIMG:String, userLogin: String, userName: String, location: String, company: String)
}

class GitHubUserViewModel {
    
    var ghUserViewModelDelegate : GitHubUserViewModelDelegate?
    
    func getUserData() {
        Networking.shared.getUserData { result in
            switch result {
                
            case .success( let user):
                DispatchQueue.main.async {
                    self.ghUserViewModelDelegate?.updateView(avatarIMG: user.avatar_url,
                                                             userLogin: user.login,
                                                             userName: user.name,
                                                             location: user.location,
                                                             company: user.company)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
