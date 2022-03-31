//
//  GitHubBioView.swift
//  SciubaSebastianCV
//
//  Created by akra on 27/03/2022.
//

import Foundation
import UIKit

class GitHubBioView : UIView {
    
    let bioLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureBioLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Setup UIElemenets
    
//    func setupData(user: User) {
//        bioLabel.text = user.bio
//    }
    
    func setupBioData(model: Model) {
        bioLabel.text = model.bio
    }
    
//    MARK: - Constraints
    
    private func configureBioLabel() {
        addSubview(bioLabel)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bioLabel.textColor = .secondaryLabel
        bioLabel.numberOfLines = 0
        bioLabel.font = UIFont.systemFont(ofSize: 16)
        
        NSLayoutConstraint.activate([
            bioLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bioLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            bioLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
    }
}

extension GitHubBioView {
    struct Model {
        let bio : String
    }
}
