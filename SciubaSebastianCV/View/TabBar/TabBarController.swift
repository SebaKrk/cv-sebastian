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
        let title = NSLocalizedString("Personal Data", comment: "")
        perVC.tabBarItem = UITabBarItem(title: title, image: img, tag: 0)
        return UINavigationController(rootViewController: perVC)
    }
    
    func workExperienceVC() -> UINavigationController {
        let workVC = WorkExperienceVC()
        let img = UIImage(systemName: "tortoise")
        let title = NSLocalizedString("Work Experience", comment: "")
        workVC.tabBarItem = UITabBarItem(title: title, image: img, tag: 1)
        return UINavigationController(rootViewController: workVC)
    }
    func educationVC() -> UINavigationController {
        let eduVC = EducationVC()
        let img = UIImage(systemName: "alarm")
        let title = NSLocalizedString("Education", comment: "")
        eduVC.tabBarItem = UITabBarItem(title: title, image: img, tag: 2)
        return UINavigationController(rootViewController: eduVC)
    }
    func skillsAndCoursesC() -> UINavigationController {
        let skilVC = SkillsAndCoursesVC()
        let img = UIImage(systemName: "book")
        let title = NSLocalizedString("Skills", comment: "")
        skilVC.tabBarItem = UITabBarItem(title: title, image: img, tag: 3)
        return UINavigationController(rootViewController: skilVC)
    }
    
}

