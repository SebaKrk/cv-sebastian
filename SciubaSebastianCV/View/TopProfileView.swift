//
//  TopProfileView.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import UIKit

class TopProfileView : UIViewController {
    
    let profileImg = UIImageView()
    let namelabel = UILabel()
    let positionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            setupView()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        configureProfileImg()
        configureNameLabel()
        configurePositionLabel()
    }
    
    private func configureProfileImg() {
        view.addSubview(profileImg)
        profileImg.translatesAutoresizingMaskIntoConstraints = false
        
        profileImg.image = UIImage(named: "ŚciubaS")
        profileImg.layer.cornerRadius = 75
        profileImg.layer.borderColor = UIColor.systemBlue.cgColor
        profileImg.layer.borderWidth = 1
        profileImg.layer.masksToBounds = true
        profileImg.contentMode = .scaleAspectFill
        
        
        NSLayoutConstraint.activate([
            profileImg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileImg.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            profileImg.heightAnchor.constraint(equalToConstant: 150),
            profileImg.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configureNameLabel() {
        view.addSubview(namelabel)
        namelabel.translatesAutoresizingMaskIntoConstraints = false
        
        namelabel.text = "\(Constants.firstName) \(Constants.lastName)"
        namelabel.font = UIFont.boldSystemFont(ofSize: 32)
        
        NSLayoutConstraint.activate([
            namelabel.topAnchor.constraint(equalTo: profileImg.bottomAnchor, constant: 20),
            namelabel.centerXAnchor.constraint(equalTo: profileImg.centerXAnchor),
        ])
    }
    
    private func configurePositionLabel() {
        view.addSubview(positionLabel)
        positionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        positionLabel.text = Constants.position
        
        NSLayoutConstraint.activate([
            positionLabel.topAnchor.constraint(equalTo: namelabel.bottomAnchor,constant: 10),
            positionLabel.centerXAnchor.constraint(equalTo: profileImg.centerXAnchor)
        ])
    }
    
    
}
