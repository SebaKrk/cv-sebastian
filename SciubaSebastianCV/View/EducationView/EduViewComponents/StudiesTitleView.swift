//
//  StudiesTitleView.swift
//  SciubaSebastianCV
//
//  Created by akra on 30/03/2022.
//

import UIKit

class StudiesTitleView : UIView {
    
    let studiesTitlelabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureStudiesTitleLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

//    MARK: - Constraints
    
    private func configureStudiesTitleLabel() {
        addSubview(studiesTitlelabel)
        studiesTitlelabel.translatesAutoresizingMaskIntoConstraints = false
        
        studiesTitlelabel.text = "Informatyka i Ekonometria: \nProjektowanie gier i aplikacji VR".localized
        studiesTitlelabel.font = UIFont.boldSystemFont(ofSize: 20)
        studiesTitlelabel.numberOfLines = 2
        studiesTitlelabel.textAlignment = .center
        
        NSLayoutConstraint.activate([
            studiesTitlelabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            studiesTitlelabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 10),
            studiesTitlelabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10)
        ])
    }
}
