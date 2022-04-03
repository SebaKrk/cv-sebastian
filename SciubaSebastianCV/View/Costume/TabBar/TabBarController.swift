//
//  TabBarController.swift
//  SciubaSebastianCV
//
//  Created by akra on 15/03/2022.
//

import UIKit

class TabBarController : UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UITabBar.appearance().tintColor = .systemBlue
        UITabBar.appearance().backgroundColor = .white
        viewControllers = [personalDataVC(), workExperienceVC(),educationVC(), skillsAndCoursesC()]
    }
    
    func personalDataVC() -> UINavigationController {
        let perVC = PersonalDataVC()
        let img = UIImage(systemName: "person")
        let title = "Personal Data".localized
        perVC.tabBarItem = UITabBarItem(title: title, image: img, tag: 0)
        return UINavigationController(rootViewController: perVC)
    }
    
    func workExperienceVC() -> UINavigationController {
        let workVC = WorkExperienceVC()
        let img = UIImage(systemName: "tortoise")
        let title = "Work Experience".localized
        workVC.tabBarItem = UITabBarItem(title: title, image: img, tag: 1)
        return UINavigationController(rootViewController: workVC)
    }
    func educationVC() -> UINavigationController {
        let eduVC = EducationVC()
        let img = UIImage(systemName: "alarm")
        let title = "Education".localized
        eduVC.tabBarItem = UITabBarItem(title: title, image: img, tag: 2)
        return UINavigationController(rootViewController: eduVC)
    }
    func skillsAndCoursesC() -> UINavigationController {
        let skilVC = SkillsAndCoursesCV()
        let img = UIImage(systemName: "book")
        let title = "Skills".localized
        skilVC.tabBarItem = UITabBarItem(title: title, image: img, tag: 3)
        return UINavigationController(rootViewController: skilVC)
    }
    
}

