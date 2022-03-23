//
//  ButtonsView.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import Foundation
import UIKit

class ButtonsView : UIViewController {
    
    var delegate : PersonalDataBttonDelegate!
    
    var stackView = UIStackView()
    
    let phoneView = UIView()
    let gitView = UIView()
    let linkedInView = UIView()
    let mailView = UIView()
    
    let phoneVC = CostumeButtonView(imageName: UIImage(systemName: "phone.fill")!, title: "Phone".localized)
    let gitVC = CostumeButtonView(imageName: UIImage(named: "Github")!, title: "GitHub")
    let linkedInVC = CostumeButtonView(imageName: UIImage(named: "LinkedIn")!, title: "LinkedIn")
    let mailVC = CostumeButtonView(imageName: UIImage(systemName: "envelope.fill")!, title: "Email".localized)
    
    //    MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupStackView()
        configureViews()
        configureStackView()
        
        addGestureToButtons()
    }
    
    //    MARK: - StackView
    
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [phoneView,gitView,linkedInView,mailView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
    }
    
    private func configureViews() {
        add(childVC: phoneVC, to: phoneView)
        add(childVC: gitVC, to: gitView)
        add(childVC: linkedInVC, to: linkedInView)
        add(childVC: mailVC, to: mailView)
    }
    
    //    MARK: - OBJC Func
    
    @objc func handlePhoneTapGes() {
        delegate.didTapPhoneButton()
    }
    
    @objc func handleGitHubTapGes() {
        delegate.didTapGitHubeButton()
    }
    
    @objc func handleLinkedInTapGes() {
        delegate.didTapLinkedInButton()
    }
    
    @objc func hadleEmailTapGes() {
        delegate.didTapMailButton()
    }
    
    //    MARK: - GestureRecognizer
    
    private func addGestureToButtons() {
        
        let phoneTapGesture = UITapGestureRecognizer(target: self, action: #selector(handlePhoneTapGes))
        phoneVC.view.addGestureRecognizer(phoneTapGesture)
        
        let gitHubTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleGitHubTapGes))
        gitVC.view.addGestureRecognizer(gitHubTapGesture)
        
        let linkedInTapGesture = UITapGestureRecognizer(target: self, action: #selector(handleLinkedInTapGes))
        linkedInVC.view.addGestureRecognizer(linkedInTapGesture)
        
        let mailTapGesture = UITapGestureRecognizer(target: self, action: #selector(hadleEmailTapGes))
        mailVC.view.addGestureRecognizer(mailTapGesture)
    }
    
    
    //    MARK: - Constraints
    
    func configureStackView() {
        view.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    //    MARK: Helpers
    
    func add(childVC: UIViewController, to containerView: UIView) {
        addChild(childVC)
        containerView.addSubview(childVC.view)
        childVC.view.frame = containerView.bounds
        childVC.didMove(toParent: self)
    }
}
