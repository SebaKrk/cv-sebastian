//
//  CostumeButtonView.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import UIKit

class CostumeButtonView : UIViewController {
    
    var container = UIView()
    var stackView = UIStackView()
    let costumeImg = UIImageView()
    let costumeLabel = UILabel()
    let actionButton = UIButton()

    let padding : CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupStackView()
        configureContainer()
        configureStackView()
    }
    
    init(imageName: UIImage , title: String) {
        super.init(nibName: nil, bundle: nil)

        costumeImg.image = imageName
        costumeImg.contentMode = .scaleAspectFit
        costumeImg.tintColor = .systemBlue
    
        costumeLabel.text = title
        costumeLabel.textColor = .systemBlue
        costumeLabel.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupStackView() {
        stackView = UIStackView(arrangedSubviews: [costumeImg, costumeLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
    }
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            container.heightAnchor.constraint(equalToConstant: 70),
            container.widthAnchor.constraint(equalToConstant: 90)
        ])
    }
    
    func configureStackView() {
        container.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: container.topAnchor,constant: padding),
            stackView.leadingAnchor.constraint(equalTo: container.leadingAnchor,constant: padding),
            stackView.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -padding),
            stackView.bottomAnchor.constraint(equalTo: container.bottomAnchor,constant: -padding)
        ])
    }
}
