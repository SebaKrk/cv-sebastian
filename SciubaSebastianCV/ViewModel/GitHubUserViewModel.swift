//
//  GitHubUserViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 25/03/2022.
//

import Foundation

protocol GitHubUserViewModelDelegate : AnyObject {
    func updateView(userLogin: String)
}

class GitHubUserViewModel {
    
    var ghUserViewModelDeelegate : GitHubUserViewModelDelegate?
    
    func getUserData() {
        Networking.shared.getUserData { result in
            switch result {
                
            case .success( let user):
                DispatchQueue.main.async {
                    self.ghUserViewModelDeelegate?.updateView(userLogin: user.login)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
