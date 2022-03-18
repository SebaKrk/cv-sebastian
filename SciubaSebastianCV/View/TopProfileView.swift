//
//  TopProfileView.swift
//  SciubaSebastianCV
//
//  Created by Sebastian Sciuba on 14/03/2022.
//

import UIKit

class TopProfileView : UIViewController {

    let profileImg = ProfileIMG(frame: .zero)
    let namelabel = UILabel()
    let positionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupObserver()
    }
    
    private func setupView() {
        view.backgroundColor = .white
        configureProfileImg()
        configureNameLabel()
        configurePositionLabel()
    }
    
    //    MARK: - setupObserver
    
    @objc func handleProfileImgObserver(notification: NSNotification) {
        let imgPicker = notification.userInfo?["imgPicker"] as? UIImage
        guard let imgPicker = imgPicker else {return}
        profileImg.image = imgPicker
    }
    
    private  func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleProfileImgObserver(notification:)), name: .profileImgObserver, object: nil)
    }
    
    // MARK: - Constraints
    
    private func configureProfileImg() {
        view.addSubview(profileImg)
        profileImg.translatesAutoresizingMaskIntoConstraints = false

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
