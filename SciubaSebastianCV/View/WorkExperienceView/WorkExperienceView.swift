//
//  WorkExperienceView.swift
//  SciubaSebastianCV
//
//  Created by akra on 04/04/2022.
//

import UIKit

class WorkExperienceView : UIView {
    
    let topView = WorkExpTopView()
    let workExpTableView = WorkExpTabeView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constraintsTopView()
        configureTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//    MARK: - SeupData
    
    func getExperienceData(exprerience: [Experience]) {
        workExpTableView.setuData(experience: exprerience)
    }
    
//   MARK: - Constraints
    
    private func constraintsTopView() {
        addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: topAnchor),
            topView.leadingAnchor.constraint(equalTo: leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: trailingAnchor),
            topView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.1)
        ])
    }
    
    private func configureTableView() {
        addSubview(workExpTableView)
        workExpTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            workExpTableView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            workExpTableView.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            workExpTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            workExpTableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
