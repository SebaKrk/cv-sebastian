//
//  WorkExperienceVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 15/03/2022.
//

import UIKit

class WorkExperienceVC : UIViewController {
    
    let workExpView = WorkExperienceView()
    let workExpViewModel = ExperianceViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        updateExpView()
        setupDelagte()
    }
    
    //    MARK: - SetupView
    
    private func setupView() {
        view.backgroundColor = .white
        configureWorkExpView()
    }

    //    MARK: - UpdateDataView
    
    private func updateExpView() {
        let exp = workExpViewModel.setExpData()
        workExpView.getExperienceData(exprerience: exp)
    }
    
    private func setupDelagte() {
        workExpView.workExpDelegate = self
    }
    
    //    MARK: - Constraints
    
    private func configureWorkExpView() {
        view.addSubview(workExpView)
        workExpView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            workExpView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            workExpView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            workExpView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            workExpView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}
// MARK: - WorkExpViewDelegate

extension WorkExperienceVC : WorkExpViewDelegate {
    func didSelectWorkExpCell(firstResp: String, secondResp: String, thirdResp: String) {
        let desVC = ResponsibilitiesDetailsVC()
        desVC.modalPresentationStyle = .overFullScreen
        desVC.firstResp.text = firstResp
        desVC.secondResp.text = secondResp
        desVC.thirdResp.text = thirdResp
        present(desVC, animated: false, completion: nil)
    }
}
