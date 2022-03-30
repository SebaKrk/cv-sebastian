//
//  EducationView.swift
//  SciubaSebastianCV
//
//  Created by akra on 30/03/2022.
//

import UIKit

class EducationView: UIView {
    
    let universityView = UIView()
    let studiesMajorView = UIView()
    let skilsView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUniversityView()
        configureStudiesMajorView()
        configureSkilsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Constraints
    
    private func configureUniversityView() {
        addSubview(universityView)
        universityView.translatesAutoresizingMaskIntoConstraints = false
        
        universityView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            universityView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            universityView.leadingAnchor.constraint(equalTo: leadingAnchor),
            universityView.trailingAnchor.constraint(equalTo: trailingAnchor),
            universityView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
        ])
    }
    
    private func configureStudiesMajorView() {
        addSubview(studiesMajorView)
        studiesMajorView.translatesAutoresizingMaskIntoConstraints = false
        
        studiesMajorView.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            studiesMajorView.topAnchor.constraint(equalTo: universityView.bottomAnchor),
            studiesMajorView.leadingAnchor.constraint(equalTo: leadingAnchor),
            studiesMajorView.trailingAnchor.constraint(equalTo: trailingAnchor),
            studiesMajorView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureSkilsView() {
        addSubview(skilsView)
        skilsView.translatesAutoresizingMaskIntoConstraints = false
        
        skilsView.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            skilsView.topAnchor.constraint(equalTo: studiesMajorView.bottomAnchor),
            skilsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            skilsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            skilsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
