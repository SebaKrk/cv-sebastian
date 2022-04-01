//
//  SkillsAndCoursesVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 15/03/2022.
//

import UIKit

class SkillsAndCoursesVC : UIViewController {
    
    let skillsAndCoursesView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        configureView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        configureView()
    }
    
//    MARK: - Constraints
    
    private func configureView() {
        view.addSubview(skillsAndCoursesView)
        skillsAndCoursesView.translatesAutoresizingMaskIntoConstraints = false
        
        skillsAndCoursesView.backgroundColor = .red
        
        NSLayoutConstraint.activate([
            skillsAndCoursesView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            skillsAndCoursesView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            skillsAndCoursesView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            skillsAndCoursesView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
