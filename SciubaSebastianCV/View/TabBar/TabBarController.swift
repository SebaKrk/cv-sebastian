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
        perVC.tabBarItem = UITabBarItem(title: "Personal Data", image: img, tag: 0)
        return UINavigationController(rootViewController: perVC)
    }
    
    func workExperienceVC() -> UINavigationController {
        let workVC = WorkExperienceVC()
        let img = UIImage(systemName: "tortoise")
        workVC.tabBarItem = UITabBarItem(title: "Work Experience", image: img, tag: 1)
        return UINavigationController(rootViewController: workVC)
    }
    func educationVC() -> UINavigationController {
        let eduVC = EducationVC()
        let img = UIImage(systemName: "alarm") // x.squareroot ?
        eduVC.tabBarItem = UITabBarItem(title: "Education", image: img, tag: 2)
        return UINavigationController(rootViewController: eduVC)
    }
    func skillsAndCoursesC() -> UINavigationController {
        let skilVC = SkillsAndCoursesVC()
        let img = UIImage(systemName: "book")
        skilVC.tabBarItem = UITabBarItem(title: "Skills", image: img, tag: 3)
        return UINavigationController(rootViewController: skilVC)
    }
    
}
