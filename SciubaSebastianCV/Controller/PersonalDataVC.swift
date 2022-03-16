//
//  MainViewController.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import UIKit

class PersonalDataVC : UIViewController {
    
    let topView = UIView()
    let buttonsView = UIView()
    
    let contactView = UIView()
    let adressView = UIView()
    let aboutMeView = UIView()
    
    let padding : CGFloat = 15
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupNavigationBar()
        setupChildView()
    }
    
    //    MARK: - SetupView
    private func setupView() {
        view.backgroundColor = .white
        configureTopView()
        configureButtonsView()
        configureConcatsView()
        configureAdresView()
        configureAboutMeView()
        
    }
    
    private func setupChildView() {
        add(childVC: TopProfileView(), to:  topView)
        add(childVC: ButtonsView(), to: buttonsView)
        add(childVC: ContactDataView(), to: contactView)
        add(childVC: AdressView(), to: adressView)
        add(childVC: AbutMeView(), to: aboutMeView)
    }
    //    MARK: OBJC func
    
    @objc func handleSideMenu() {
        print("handleSideMenu")
    }
    
    //    MARK: - SetupNavigationbar
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = .systemBlue
        
        let configuration = UIImage.SymbolConfiguration(paletteColors: [.systemBlue])
        let leftImage = UIImage(systemName: "line.3.horizontal", withConfiguration: configuration)
        leftImage?.withTintColor(.systemBlue)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: leftImage, style: .done, target: self, action: #selector(handleSideMenu))
    }
    
    //    MARK: Constraints
    
    private func configureTopView() {
        view.addSubview(topView)
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topView.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    
    func configureButtonsView() {
        view.addSubview(buttonsView)
        buttonsView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonsView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: padding),
            buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -padding),
            buttonsView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    func configureConcatsView() {
        view.addSubview(contactView)
        contactView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contactView.topAnchor.constraint(equalTo: buttonsView.bottomAnchor),
            contactView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            contactView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            contactView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureAdresView() {
        view.addSubview(adressView)
        adressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            adressView.topAnchor.constraint(equalTo: contactView.bottomAnchor, constant: 20),
            adressView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            adressView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            adressView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureAboutMeView() {
        view.addSubview(aboutMeView)
        aboutMeView.translatesAutoresizingMaskIntoConstraints = false
            
        NSLayoutConstraint.activate([
            aboutMeView.topAnchor.constraint(equalTo: adressView.bottomAnchor, constant: 20),
            aboutMeView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            aboutMeView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            aboutMeView.heightAnchor.constraint(equalToConstant: 170)
        ])
    }
    
    //    MARK: Helpers
    
    private func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
