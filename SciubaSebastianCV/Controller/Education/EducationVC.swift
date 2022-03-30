//
//  EducationVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 15/03/2022.
//

import UIKit

class EducationVC : UIViewController {
    
    let educationView = EducationView()

    override func viewDidLoad() {
        setupView()
    }
    
//    MARK: - SetupView
    
    private func setupView() {
        view.backgroundColor = .white
        configureEducationView()
    }
    
//    MARK: - Constraints
    
    private func configureEducationView() {
        view.addSubview(educationView)
        educationView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            educationView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            educationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            educationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            educationView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
 
