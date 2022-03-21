//
//  ButtonsView.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import Foundation
import UIKit

class ButtonsView : UIViewController {
    
    var stackView = UIStackView()
    
    let phoneView = UIView()
    let gitView = UIView()
    let linkedInView = UIView()
    let mailView = UIView()

    let phoneVC = CostumeButtonView(imageName: UIImage(systemName: "phone.fill")!, title: NSLocalizedString("Phone", comment: ""))
    let gitVC = CostumeButtonView(imageName: UIImage(named: "Github")!, title: "GitHub")
    let linkedInVC = CostumeButtonView(imageName: UIImage(named: "LinkedIn")!, title: "LinkedIn")
    let mailVC = CostumeButtonView(imageName: UIImage(systemName: "envelope.fill")!, title: NSLocalizedString("Email", comment: ""))
                                    
    //    MARK: - ViewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupStackView()
        configureViews()
        configureStackView()
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
