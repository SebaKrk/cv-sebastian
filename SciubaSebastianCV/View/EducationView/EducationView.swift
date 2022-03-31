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
    let semestersTableView = SemesterTableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUniversityView()
        configureStudiesTitleView()
        configureSemestersView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - SetupEduData
    
    func setupEduDataView(eduData: [Education]) {
        semestersTableView.setuData(eduData: eduData)
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
    
    private func configureSemestersView() {
        addSubview(semestersTableView)
        semestersTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            semestersTableView.topAnchor.constraint(equalTo: studiesTitleView.bottomAnchor),
            semestersTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            semestersTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            semestersTableView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
}
