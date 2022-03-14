//
//  MainViewController.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import UIKit

class MainViewController : UIViewController {
    
    let topView = UIView()
    let buttonsView = UIView()
    
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
        
    }
    
    private func setupChildView() {
        add(childVC: TopProfileView(), to:  topView)
        add(childVC: ButtonsView(), to: buttonsView)
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
            buttonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 5),
            buttonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -5),
            buttonsView.heightAnchor.constraint(equalToConstant: 150)
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
