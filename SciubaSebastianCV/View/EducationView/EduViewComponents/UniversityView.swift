//
//  UniversityView.swift
//  SciubaSebastianCV
//
//  Created by akra on 30/03/2022.
//

import UIKit

class UniversityView : UIView {
    
    let universityLogo = UIImageView()
    let universityLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUniversityLogo()
        configureUniversityLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Constraints
    
    private func configureUniversityLogo() {
        addSubview(universityLogo)
        universityLogo.translatesAutoresizingMaskIntoConstraints = false
        
        universityLogo.image = UIImage(named: "logoKA")
        universityLogo.layer.masksToBounds = true
        universityLogo.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            universityLogo.topAnchor.constraint(equalTo: topAnchor),
            universityLogo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            universityLogo.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
            universityLogo.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8)
        ])
    }
    
    private func configureUniversityLabel() {
        addSubview(universityLabel)
        universityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        universityLabel.text = "The Andrzej Frycz Modrzewski Krakow Academy st. Gustawa Herlinga-Grudzińskiego 1, 30-705 Krakow".localized
        universityLabel.textAlignment = .left
        universityLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            universityLabel.topAnchor.constraint(equalTo: topAnchor),
            universityLabel.leadingAnchor.constraint(equalTo: universityLogo.trailingAnchor, constant: 10),
            universityLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -10),
            universityLabel.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.8),
        ])
    }
}
