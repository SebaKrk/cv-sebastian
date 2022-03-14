//
//  ContactDataView.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import UIKit

class ContactDataView : UIViewController {
    
    let container = UIView()
    var stackView = UIStackView()
    
    let phoneLabel = ContactTitleLabel(labelTitle: "Phone")
    let emialLabel = ContactTitleLabel(labelTitle: "Email")
    let phoneData = ConcactDataLabel(textData: "533-611-188")
    let emailData = ConcactDataLabel(textData: "s.sciuba@icloud.com")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupStackView()
        configureContainer()
        configureStackView()
        
    }
//    MARK: - StakView
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [phoneLabel,phoneData,emialLabel,emailData])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    }
//    MARK: - Constant
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    private func configureStackView() {
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5)
        ])
    }

    
}
