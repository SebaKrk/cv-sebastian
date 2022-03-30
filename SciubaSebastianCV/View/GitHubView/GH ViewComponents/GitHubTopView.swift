//
//  GitHubTopView.swift
//  SciubaSebastianCV
//
//  Created by akra on 29/03/2022.
//

import UIKit

protocol GitHubTopViewDelegate: AnyObject {
    func dismissGitHubViewController()
}

class GitHubTopView : UIView {
    
   weak var gitHubTopViewDelegate: GitHubTopViewDelegate!
    
    let doneButton = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureDoneButton()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: - OBJC
    
    @objc func handleDoneButton() {
        gitHubTopViewDelegate.dismissGitHubViewController()
    }
    
    //    MARK: - Constraints
    
    private func configureDoneButton() {
        addSubview(doneButton)
        doneButton.translatesAutoresizingMaskIntoConstraints = false
        
        doneButton.setTitle("done", for: .normal)
        doneButton.setTitleColor(.systemBlue, for: .normal)
        doneButton.addTarget(self, action: #selector(handleDoneButton), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            doneButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            doneButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20)
        ])
    }
}
