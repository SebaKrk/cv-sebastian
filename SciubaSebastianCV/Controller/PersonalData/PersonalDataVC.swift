//
//  MainViewController.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import UIKit
import SafariServices

protocol PersonalDataBttonDelegate {
    func didTapPhoneButton()
    func didTapGitHubeButton()
    func didTapLinkedInButton()
    func didTapMailButton()
}

class PersonalDataVC : UIViewController {
    
    let topView = UIView()
    let buttonsView = UIView()
    
    let scrollView = UIScrollView()
    let content = UIView()
    
    let contactView = UIView()
    let adressView = UIView()
    let aboutMeView = UIView()
    
    let padding : CGFloat = 10
    
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
        configureScrollView()
        configureContenView()
        
        configureConcatsView()
        configureAdresView()
        configureAboutMeView()
    }
    
    private func setupChildView() {
        let buttonView = ButtonsView()
        buttonView.delegate = self
        
        add(childVC: TopProfileView(), to:  topView)
        add(childVC: buttonView, to: buttonsView)
        add(childVC: ContactDataView(), to: contactView)
        add(childVC: AdressView(), to: adressView)
        add(childVC: AbutMeView(), to: aboutMeView)
    }
    
    //    MARK: - OBJC func
    
    @objc func handleSideMenu() {
        self.tabBarController?.tabBar.isHidden = true
        
        let desVC = SideMenuVC()
        desVC.delegate = self
        desVC.modalPresentationStyle = .overCurrentContext
        present(desVC, animated: false, completion: nil)
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
    
    private func configureScrollView() {
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: buttonsView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func configureContenView() {
        scrollView.addSubview(content)
        content.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: scrollView.topAnchor),
            content.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            content.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
        ])
    }
    
    func configureConcatsView() {
        content.addSubview(contactView)
        contactView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contactView.topAnchor.constraint(equalTo: content.topAnchor,constant: 20),
            contactView.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: padding),
            contactView.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -padding),
            contactView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureAdresView() {
        content.addSubview(adressView)
        adressView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            adressView.topAnchor.constraint(equalTo: contactView.bottomAnchor, constant: 20),
            adressView.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: padding),
            adressView.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -padding),
            adressView.heightAnchor.constraint(equalToConstant: 150),
        ])
    }
    
    private func configureAboutMeView() {
        content.addSubview(aboutMeView)
        aboutMeView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            aboutMeView.topAnchor.constraint(equalTo: adressView.bottomAnchor, constant: 20),
            aboutMeView.centerXAnchor.constraint(equalTo: content.centerXAnchor),
            aboutMeView.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: padding),
            aboutMeView.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -padding),
            aboutMeView.bottomAnchor.constraint(equalTo: content.safeAreaLayoutGuide.bottomAnchor,constant: -83),
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
// MARK: - TabBarAppranceDelegate

extension PersonalDataVC : TabBarAppranceDelegate {
    func dismissAndShowTabBar() {
        dismiss(animated: false) {
            self.tabBarController?.tabBar.isHidden = false
        }
    }
}

// MARK: - PersonalDataBttonDelegate

extension PersonalDataVC : PersonalDataBttonDelegate {
    func didTapPhoneButton() {
        print("didTapPhoneButton")
    }
    
    func didTapGitHubeButton() {
        print("did tap button")
        let desVC = GitHubVC()
        present(desVC,animated: true)
    }
    
    func didTapLinkedInButton() {
        print("didTapLinkedInButton")
        
        let linkedInURL = "https://pl.linkedin.com"
        // https://pl.linkedin.com/in/sebastian-ściuba-5bb021156
       showSafariService(with: linkedInURL)
    }
    
    func didTapMailButton() {
        print("didTapMailButton")
    }
}
