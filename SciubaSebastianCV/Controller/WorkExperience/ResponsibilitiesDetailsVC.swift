//
//  ExperienceDetailsVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 21/03/2022.
//

import UIKit

class ResponsibilitiesDetailsVC : UIViewController {
    
    var stackView = UIStackView()
    
    let container = UIView()
    let secContainer = UIView()
    let titleContainer = UILabel()
    
    let firstResp = ResDetailsLabel()
    let secondResp = ResDetailsLabel()
    let thirdResp = ResDetailsLabel()
    
    let firstLinie = SepearatingLine()
    let secondLine = SepearatingLine()
    
    let doneButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupView()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        container.layer.masksToBounds = true
    }
    
//    MARK: - ObjcFunc
    
    @objc func handleDoneButton() {
        dismiss(animated: false, completion: nil)
    }
    
//    MARK: - SetupView
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        configureContainer()
        configureSecContainer()
        configureTitleContainer()
        configureDoneButton()
        configureStackView()
    }
    
//    MARK: - SetupStackView
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [firstResp,firstLinie,secondResp,secondLine,thirdResp])
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .white
        stackView.layer.cornerRadius = 5
    }
    
//    MARK: - Constraints
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .systemBlue
        container.layer.cornerRadius = 15
        container.layer.borderColor = UIColor.blue.cgColor
        container.layer.borderWidth = 3
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            container.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5)
        ])
    }
    
    private func configureSecContainer() {
        container.addSubview(secContainer)
        secContainer.translatesAutoresizingMaskIntoConstraints = false
        
        secContainer.backgroundColor = .white
        secContainer.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            secContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            secContainer.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            secContainer.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            secContainer.heightAnchor.constraint(equalTo: container.heightAnchor, multiplier: 0.85)
        ])
    }
    
    private func configureTitleContainer() {
        container.addSubview(titleContainer)
        titleContainer.translatesAutoresizingMaskIntoConstraints = false
        
        titleContainer.text = "Responsibilities Details".localized
        titleContainer.textColor = .white
        titleContainer.font = UIFont.boldSystemFont(ofSize: 26)
        
        NSLayoutConstraint.activate([
            titleContainer.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            titleContainer.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    private func configureDoneButton() {
        container.addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        doneButton.setTitle("Done".localized, for: .normal)
        doneButton.setTitleColor(.white, for: .normal)
        doneButton.backgroundColor = .systemBlue
        doneButton.layer.cornerRadius = 5
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            doneButton.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            doneButton.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -20),
            doneButton.heightAnchor.constraint(equalToConstant: 50),
            doneButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    private func configureStackView() {
        secContainer.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: secContainer.centerXAnchor),
            stackView.topAnchor.constraint(equalTo: secContainer.topAnchor,constant: 5),
            stackView.bottomAnchor.constraint(equalTo: doneButton.topAnchor,constant: -5),
            stackView.widthAnchor.constraint(equalTo: secContainer.widthAnchor, multiplier: 0.9)
        ])
    }
}
