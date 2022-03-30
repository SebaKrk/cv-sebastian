//
//  EducationView.swift
//  SciubaSebastianCV
//
//  Created by akra on 30/03/2022.
//

import UIKit

class EducationView: UIView {
    
    let universityView = UniversityView()
    let studiesTitleView = StudiesTitleView()
    let skilsView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUniversityView()
        configureStudiesTitleView()
        configureSkilsView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    MARK: - Constraints
    
    private func configureUniversityView() {
        addSubview(universityView)
        universityView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            universityView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            universityView.leadingAnchor.constraint(equalTo: leadingAnchor),
            universityView.trailingAnchor.constraint(equalTo: trailingAnchor),
            universityView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.25)
        ])
    }
    
    private func configureStudiesTitleView() {
        addSubview(studiesTitleView)
        studiesTitleView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            studiesTitleView.topAnchor.constraint(equalTo: universityView.bottomAnchor),
            studiesTitleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            studiesTitleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            studiesTitleView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureSkilsView() {
        addSubview(skilsView)
        skilsView.translatesAutoresizingMaskIntoConstraints = false
        
        skilsView.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            skilsView.topAnchor.constraint(equalTo: studiesTitleView.bottomAnchor),
            skilsView.leadingAnchor.constraint(equalTo: leadingAnchor),
            skilsView.trailingAnchor.constraint(equalTo: trailingAnchor),
            skilsView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
