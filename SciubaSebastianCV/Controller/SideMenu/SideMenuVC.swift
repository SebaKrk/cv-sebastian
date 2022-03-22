//
//  SideMenuVC.swift
//  SciubaSebastianCV
//
//  Created by akra on 17/03/2022.
//

import UIKit

protocol TabBarAppranceDelegate {
    func dismissAndShowTabBar()
}

class SideMenuVC : UIViewController {
    
    var delegate : TabBarAppranceDelegate?
    
    let container = UIView()
    let menuContainer = UIView()
    
    let imgButton = UIButton()
    let profileIMG = ProfileIMG(frame: .zero)
    
    let languageLabel = UILabel()
    var lanSegmentedControl = UISegmentedControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSegmentedControl()
        setupView()
       
    }
    
    //    MARK: - SetupView
    
    private func setupView() {
        configureContainer()
        configureMenuContainer()
        configureProfileIMG()
        configureProfileImgButton()
        configureLanguageLabel()
        configureLanSegmentedControl()
        
        addTapGestureRecognizare()
    }
    
    //    MARK: OBJC Func
    
    @objc func handleBackButton() {
        delegate?.dismissAndShowTabBar()
    }
    
    @objc func handleChangeProfileIMG() {
        changeProfileImg()
    }
    
    @objc func handleSegCon(segmentedControl: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            print("EN")
        case 1:
            print("PL")
        default:
            print("EN")
        }
    }
    
    //    MARK: - SegmentedControl
    
    private func setupSegmentedControl() {
        let language = ["EN","PL"]
        lanSegmentedControl = UISegmentedControl(items: language)
        lanSegmentedControl.selectedSegmentIndex = 0
        
        lanSegmentedControl.backgroundColor = .blue
        lanSegmentedControl.tintColor = .white
        lanSegmentedControl.addTarget(self, action: #selector(handleSegCon(segmentedControl:)), for: .valueChanged)
    }
    
    //    MARK: - Constraints
    
    private func configureContainer() {
        view.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        
        container.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.topAnchor),
            container.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            container.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            container.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    private func configureMenuContainer() {
        view.addSubview(menuContainer)
        menuContainer.translatesAutoresizingMaskIntoConstraints = false
        
        menuContainer.backgroundColor = .systemBlue
        
        NSLayoutConstraint.activate([
            menuContainer.topAnchor.constraint(equalTo: view.topAnchor),
            menuContainer.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuContainer.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func configureProfileIMG() {
        menuContainer.addSubview(profileIMG)
        profileIMG.translatesAutoresizingMaskIntoConstraints = false
        
        profileIMG.layer.borderColor = UIColor.white.cgColor
        profileIMG.layer.borderWidth = 1
        
        NSLayoutConstraint.activate([
            profileIMG.centerXAnchor.constraint(equalTo: menuContainer.centerXAnchor),
            profileIMG.topAnchor.constraint(equalTo: menuContainer.safeAreaLayoutGuide.topAnchor, constant: 20),
            profileIMG.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.6),
            profileIMG.heightAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.6)
        ])
    }
    
    private func configureProfileImgButton() {
        menuContainer.addSubview(imgButton)
        imgButton.translatesAutoresizingMaskIntoConstraints = false
        
        imgButton.addTarget(self, action: #selector(handleChangeProfileIMG), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            imgButton.centerXAnchor.constraint(equalTo: menuContainer.centerXAnchor),
            imgButton.topAnchor.constraint(equalTo: menuContainer.safeAreaLayoutGuide.topAnchor, constant: 20),
            imgButton.widthAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.6),
            imgButton.heightAnchor.constraint(equalTo: menuContainer.widthAnchor, multiplier: 0.6)
        ])
    }
    private func configureLanguageLabel() {
        menuContainer.addSubview(languageLabel)
        languageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        languageLabel.text = "Language".localized
        languageLabel.textColor = .white
        languageLabel.font = UIFont.boldSystemFont(ofSize: 18)
        
        NSLayoutConstraint.activate([
            languageLabel.topAnchor.constraint(equalTo: imgButton.bottomAnchor,constant: 40),
            languageLabel.leadingAnchor.constraint(equalTo: menuContainer.leadingAnchor,constant: 20)
        ])
    }
    
    private func configureLanSegmentedControl() {
        menuContainer.addSubview(lanSegmentedControl)
        lanSegmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            lanSegmentedControl.trailingAnchor.constraint(equalTo: menuContainer.trailingAnchor,constant: -20),
            lanSegmentedControl.centerYAnchor.constraint(equalTo: languageLabel.centerYAnchor)
        ])
    }
    
    // MARK: - ImagePickerController
    
    private func changeProfileImg() {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        imgPicker.modalPresentationStyle = .popover
        
        if let popover = imgPicker.popoverPresentationController {
            let sheet = popover.adaptiveSheetPresentationController
            sheet.detents = [.medium(), .large()]
            sheet.largestUndimmedDetentIdentifier = .medium
            sheet.prefersScrollingExpandsWhenScrolledToEdge = false
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        }
        present(imgPicker, animated: true, completion: nil)
    }
    
    //    MARK: - Helpers
    
    private func addTapGestureRecognizare() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleBackButton))
        container.addGestureRecognizer(tap)
    }
}

// MARK: - UIImagePickerControllerDelegate, UINavigationControllerDelegate

extension SideMenuVC : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[.originalImage] as? UIImage {
            profileIMG.image = image
            let data  = image.pngData()
            
            UserDefaults.standard.set(data, forKey: "profileIMG")
            UserDefaults.standard.synchronize()
            
            NotificationCenter.default.post(name: .profileImgObserver, object: nil, userInfo: ["imgPicker" : image])
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
}


