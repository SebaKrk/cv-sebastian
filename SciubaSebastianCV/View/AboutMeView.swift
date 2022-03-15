//
//  AboutMeView.swift
//  SciubaSebastianCV
//
//  Created by akra on 15/03/2022.
//

import Foundation
import UIKit

class AbutMeView : UIViewController {
    
    let container = UIView()
    let scrolView = UIScrollView()
    let contenView = UIView()
    let contentLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainer()
        configureScrollView()
        configureContenView()
        configureContenLabel()
        
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
    private func configureScrollView() {
        container.addSubview(scrolView)
        scrolView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrolView.topAnchor.constraint(equalTo: container.topAnchor),
            scrolView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            scrolView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            scrolView.bottomAnchor.constraint(equalTo: container.bottomAnchor)
        ])
    }
    
    private func configureContenView() {
        scrolView.addSubview(contenView)
        contenView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contenView.topAnchor.constraint(equalTo: scrolView.topAnchor),
            contenView.leadingAnchor.constraint(equalTo: scrolView.leadingAnchor,constant: 10),
            contenView.trailingAnchor.constraint(equalTo: scrolView.trailingAnchor),
            contenView.bottomAnchor.constraint(equalTo: scrolView.bottomAnchor)
        ])
    }
    private func configureContenLabel() {
        contenView.addSubview(contentLabel)
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
    
        contentLabel.text = Constants.aboutMe
        contentLabel.textColor = .black
        contentLabel.textAlignment = .left
        contentLabel.numberOfLines = 0
        contentLabel.sizeToFit()
    
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: contenView.topAnchor, constant: 10),
            contentLabel.widthAnchor.constraint(equalTo: scrolView.widthAnchor, multiplier: 0.95),
            contentLabel.bottomAnchor.constraint(equalTo: contenView.bottomAnchor)
        ])
    }
}
