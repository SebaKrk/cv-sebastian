//
//  SideMenuVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 17/03/2022.
//

import UIKit

protocol TabBarAppranceDelegate {
    func dismissAndShowTabBar()
}

class SideMenuVC : UIViewController {
    
    var delegate : TabBarAppranceDelegate?
    
    let menuContainer = UIView()
    let backButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
//    MARK: - SetupView
    
    private func setupView() {
        view.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        configureMenuContainer()
        configureBackButton()
    }
    
//    MARK: OBJC Func
    
    @objc func handleBackButton() {
        delegate?.dismissAndShowTabBar()
    }

//    MARK: - Constraints
    
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
    
    func configureBackButton() {
        menuContainer.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        backButton.setTitle("BACK", for: .normal)
        backButton.addTarget(self, action: #selector(handleBackButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            backButton.centerXAnchor.constraint(equalTo: menuContainer.centerXAnchor),
            backButton.centerYAnchor.constraint(equalTo: menuContainer.centerYAnchor)
        ])
    }
}
