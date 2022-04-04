//
//  SkillsAndCoursesCV.swift
//  SciubaSebastianCV
//
//  Created by akra on 01/04/2022.
//

import Foundation
import UIKit

class SkillsAndCoursesVC: UIViewController {
    
    var coursesCollectionView : UICollectionView!
    var collectionReuseIdentifier = "collectionReuseIdentifier"
    let skillsAndCoursesViewModel = SkillsCourViewModel()
    var courseListArry : [Courses] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupCollectionView()
        configureCollectionView()
        setupData()
    }
    
//    MARK: - SetupView
    
    private func setupView() {
        title = "Courses".localized
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
//    MARK: - SetupCollectionView
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        
        coursesCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        coursesCollectionView?.register(SkillsAndCoursesCell.self, forCellWithReuseIdentifier: collectionReuseIdentifier)
        coursesCollectionView?.delegate = self
        coursesCollectionView?.dataSource = self
    }
//    MARK: - SetupData
    
    private func setupData() {
        courseListArry = skillsAndCoursesViewModel.setSkilsCourData()
    }
    
    
//    MARK: - Constraints
    
    private func configureCollectionView() {
        view.addSubview(coursesCollectionView)
        coursesCollectionView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            coursesCollectionView.topAnchor.constraint(equalTo: view.topAnchor),
            coursesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coursesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coursesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension SkillsAndCoursesVC: UICollectionViewDelegate, UICollectionViewDataSource , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courseListArry.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = coursesCollectionView.dequeueReusableCell(withReuseIdentifier: collectionReuseIdentifier, for: indexPath) as! SkillsAndCoursesCell
        let data = courseListArry[indexPath.row]
        
        cell.courseTitleLabel.text = data.title
        cell.authorLabel.text = data.author
        
        cell.dowloadImage(from: data.courseImg)
        cell.typeImg.image = UIImage(named: data.type)

        cell.skillOneLabel.text = "- \(data.skills.first)"
        cell.skillSecondLabel.text = "- \(data.skills.second)"
        cell.skillThirdLabel.text = "- \(data.skills.third)"
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
         return CGSize(width: view.frame.size.width , height: 175)
     }
}
