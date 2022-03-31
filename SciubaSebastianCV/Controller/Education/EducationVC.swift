//
//  EducationVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 15/03/2022.
//

import UIKit

class EducationVC : UIViewController {
    
    let educationView = EducationView()
    let educationViewModel = EducationViewModel()
    
    
    override func viewDidLoad() {
        setupView()
        setupData()
    }
    
    //    MARK: - SetupView
    
    private func setupView() {
        view.backgroundColor = .white
        configureEducationView()
    }
    
    //    MARK: - SetUpData
    
    private func setupData() {
        educationView.setupEduDataView(eduData: educationViewModel.setEduData())
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

