//
//  AboutMeView.swift
//  SciubaSebastianCV
//
//  Created by akra on 15/03/2022.
//

import Foundation
import UIKit

class AbutMeView : UIView {
    
    let container = UIView()
    let contentLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContainer()
        configureContenLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Constraints
    
    private func configureContainer() {
        addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 250)
        ])
    }

    private func configureContenLabel() {
        container.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
    
        contentLabel.text = "aboutMe".localized
        contentLabel.textColor = .black
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
        contentLabel.sizeToFit()
    
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: container.topAnchor),
            contentLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
            contentLabel.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.95),
            contentLabel.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
}
