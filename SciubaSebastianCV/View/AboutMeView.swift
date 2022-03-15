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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureContainer()
    }
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = .systemGray6
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
}
