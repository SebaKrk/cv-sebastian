//
//  AdressView.swift
//  SciubaSebastianCV
//
//  Created by akra on 16/03/2022.
//

import Foundation
import UIKit

class AdressView : UIViewController {
    
    let container = UIView()
    var stackView = UIStackView()
    
    let homeLabel = ContactTitleLabel(labelTitle: "Home")
    let adressLabel = UILabel()
    let cityLabel = UILabel()
    let countrylabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        setupData()
        configureContainer()
        configureStackView()
    }
    
    private func setupData() {
        adressLabel.text = "\(Constants.adres)"
        cityLabel.text = "\(Constants.city)"
        countrylabel.text = "\(Constants.coutry)"
    }
    
    private func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [homeLabel, adressLabel, cityLabel, countrylabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    }
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 5
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureStackView() {
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: container.topAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: countrylabel.leadingAnchor),
            stackView.widthAnchor.constraint(equalTo: container.widthAnchor, multiplier: 0.4),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor, constant: -5)
        ])
    }
}
