//
//  TopProfileGitHubView.swift
//  SciubaSebastianCV
//
//  Created by akra on 24/03/2022.
//

import Foundation
import UIKit

class GitHubProfileView : UIView {
    
    let avatarImgView = UIImageView()
    let userLoginLabel = UILabel()
    let userNameLabel = UILabel()
    
    let locationImageView = UIImageView()
    let locationLabel = UILabel()
    
    let companyImageView = UIImageView()
    let companyLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureAvatarIMG()
        configureUserLoginLabel()
        configureUserNameLabe()
        configureLocationView()
        configureCompanyView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Setup UIElemenets
    
    func setupData(user: Users) {
        dowloadImage(from: user.avatar_url)
        userLoginLabel.text = user.login
        userNameLabel.text = user.name
        locationLabel.text = user.location
        companyLabel.text = user.company
    }
    
    //    MARK: - Constraints
    
    private func configureAvatarIMG() {
        addSubview(avatarImgView)
        avatarImgView.translatesAutoresizingMaskIntoConstraints = false
        
        avatarImgView.layer.cornerRadius = 10
        avatarImgView.layer.masksToBounds = true
        avatarImgView.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            avatarImgView.centerYAnchor.constraint(equalTo: centerYAnchor),
            avatarImgView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            avatarImgView.heightAnchor.constraint(equalToConstant: 100),
            avatarImgView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureUserLoginLabel() {
        addSubview(userLoginLabel)
        userLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userLoginLabel.textColor = .black
        userLoginLabel.font = UIFont.boldSystemFont(ofSize: 26)
        
        NSLayoutConstraint.activate([
            userLoginLabel.centerYAnchor.constraint(equalTo: avatarImgView.topAnchor, constant: 10),
            userLoginLabel.leadingAnchor.constraint(equalTo: avatarImgView.trailingAnchor, constant: 20),
        ])
    }
    
    private func configureUserNameLabe() {
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        userNameLabel.font = UIFont.systemFont(ofSize: 20)
        
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userLoginLabel.bottomAnchor,constant: 5),
            userNameLabel.leadingAnchor.constraint(equalTo: avatarImgView.trailingAnchor, constant: 20),
        ])
    }
    
    private func configureLocationView() {
        addSubview(locationImageView)
        addSubview(locationLabel)
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        
        locationImageView.image = UIImage(systemName: "mappin.and.ellipse")
        
        NSLayoutConstraint.activate([
            locationImageView.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,constant: 5),
            locationImageView.leadingAnchor.constraint(equalTo: avatarImgView.trailingAnchor,constant: 20),
            locationLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,constant: 5),
            locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor,constant: 5),
        ])
    }
    
    private func configureCompanyView() {
        addSubview(companyImageView)
        addSubview(companyLabel)
        companyImageView.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        
        companyImageView.image = UIImage(systemName: "bag")
        
        NSLayoutConstraint.activate([
            companyImageView.topAnchor.constraint(equalTo: locationImageView.bottomAnchor,constant: 5),
            companyImageView.leadingAnchor.constraint(equalTo: avatarImgView.trailingAnchor,constant: 20),
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
                self.avatarImgView.image = image
            }
        }
        task.resume()
    }
}
