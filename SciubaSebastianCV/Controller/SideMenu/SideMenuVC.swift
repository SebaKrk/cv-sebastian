//
//  SideMenuVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 17/03/2022.
//

import Foundation
import UIKit

class SideMenuVC : UIViewController {
    
    let menuContainer = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    private func setupView() {
        view.backgroundColor = .clear
        configureMenuContainer()
    }
    private func configureMenuContainer() {
        view.addSubview(menuContainer)
        menuContainer.translatesAutoresizingMaskIntoConstraints = false
        
        menuContainer.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            menuContainer.topAnchor.constraint(equalTo: view.topAnchor),
            menuContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
}
