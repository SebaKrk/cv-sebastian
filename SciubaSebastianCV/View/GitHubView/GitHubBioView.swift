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
    
    private func configureBioLabel() {
        addSubview(bioLabel)
        bioLabel.translatesAutoresizingMaskIntoConstraints = false
        
        bioLabel.textColor = .secondaryLabel
        bioLabel.numberOfLines = 0
        bioLabel.font = UIFont.systemFont(ofSize: 16)
        bioLabel.text = "I am currently a student in Krakow Academy: Computer Science and Econometrics - Game Design and VR Applications.\r\nApple brand fan"
        
        NSLayoutConstraint.activate([
            bioLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            bioLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            bioLabel.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.9)
        ])
    }
}
