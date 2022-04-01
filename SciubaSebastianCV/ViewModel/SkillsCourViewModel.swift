//
//  SkillsAndCoursesViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 01/04/2022.
//

import Foundation
class SkillsCourViewModel {
    
    let service = SkillsAndCoursesDataService()
    
    func setSkilsCourData() -> [Courses] {
        service.setSkillsAndCoursesData()
    }
}
