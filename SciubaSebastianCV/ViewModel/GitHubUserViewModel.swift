//
//  GitHubUserViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 25/03/2022.
//

import Foundation


protocol GitHubUserViewModelDelegate : AnyObject {
    func updateView(user: Users)
}

class GitHubUserViewModel {
    
    var ghUserViewModelDelegate : GitHubUserViewModelDelegate?
    
    func getUserData() {
        Networking.shared.getUserData { result in
            switch result {
                
            case .success( let user):
                DispatchQueue.main.async {
                    self.ghUserViewModelDelegate?.updateView(user: user)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
