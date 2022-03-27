//
//  TopProfileGitHubView.swift
//  SciubaSebastianCV
//
//  Created by akra on 24/03/2022.
//

import Foundation
import UIKit

class TopProfileGitHubView : UIView {

    let avatarIMG = UIImageView()
    let userLoginLabel = UILabel()
    let userName = UILabel()
   
    let locationImageView = UIImageView()
    let locationLabel = UILabel()
   
    let companyImageView = UIImageView()
    let companyLabel = UILabel()
    
    let gitHubUserViewModel = GitHubUserViewModel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUiElemnets()
        configureAvatarIMG()
        configureUserLoginLabel()
        configureUserNameLabe()
        configureLocationView()
        configureCompanyView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUiElemnets() {
        gitHubUserViewModel.getUserData()
        gitHubUserViewModel.ghUserViewModelDelegate = self
    }
    
    private func configureAvatarIMG() {
        addSubview(avatarIMG)
        avatarIMG.translatesAutoresizingMaskIntoConstraints = false
        
        avatarIMG.layer.cornerRadius = 10
        avatarIMG.layer.masksToBounds = true
        avatarIMG.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            avatarIMG.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarIMG.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarIMG.heightAnchor.constraint(equalToConstant: 100),
            avatarIMG.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureUserLoginLabel() {
        addSubview(userLoginLabel)
        userLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userLoginLabel.textColor = .black
        userLoginLabel.font = UIFont.boldSystemFont(ofSize: 26)
        
        NSLayoutConstraint.activate([
            userLoginLabel.centerYAnchor.constraint(equalTo: avatarIMG.topAnchor, constant: 10),
            userLoginLabel.leadingAnchor.constraint(equalTo: avatarIMG.trailingAnchor, constant: 20),
        ])
    }
    
    private func configureUserNameLabe() {
        addSubview(userName)
        userName.translatesAutoresizingMaskIntoConstraints = false
        
        userName.font = UIFont.systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            userName.topAnchor.constraint(equalTo: userLoginLabel.bottomAnchor,constant: 5),
            userName.leadingAnchor.constraint(equalTo: avatarIMG.trailingAnchor, constant: 20),
        ])
    }
    
    private func configureLocationView() {
        addSubview(locationImageView)
        addSubview(locationLabel)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            locationImageView.topAnchor.constraint(equalTo: userName.bottomAnchor,constant: 5),
            locationImageView.leadingAnchor.constraint(equalTo: avatarIMG.trailingAnchor,constant: 20),
            locationLabel.topAnchor.constraint(equalTo: userName.bottomAnchor,constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor,constant: 5),
        ])
    }
    
    private func configureCompanyView() {
        addSubview(companyImageView)
        addSubview(companyLabel)
        companyImageView.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            companyImageView.topAnchor.constraint(equalTo: locationImageView.bottomAnchor,constant: 5),
            companyImageView.leadingAnchor.constraint(equalTo: avatarIMG.trailingAnchor,constant: 20),
            companyLabel.topAnchor.constraint(equalTo: locationImageView.bottomAnchor,constant: 5),
            companyLabel.leadingAnchor.constraint(equalTo: companyImageView.trailingAnchor,constant: 5),
        ])
    }
    
// MARK: - Helpers
    
    func dowloadImage(from urlString: String) {
        guard let url = URL(string: urlString) else {return}
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
          if error != nil {return}
          guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {return}
          guard let data = data else {return}
          guard let image = UIImage(data: data) else {return}
          DispatchQueue.main.async {
            self.avatarIMG.image = image
          }
        }
        task.resume()
      }
}

// MARK: - GitHubUserViewModelDelegate

extension TopProfileGitHubView : GitHubUserViewModelDelegate {
    func updateView(userLogin: String) {
        print("odpalil")
        userLoginLabel.text = userLogin
    }
}
