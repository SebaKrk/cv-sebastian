//
//  EducationViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 31/03/2022.
//

import Foundation

class EducationViewModel {
    let service = EducationDataService()
    
    func setEduData() -> [Education] {
        service.setEducationData()
    }
}
