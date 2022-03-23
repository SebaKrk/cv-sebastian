//
//  ExperianceViewModel.swift
//  SciubaSebastianCV
//
//  Created by akra on 23/03/2022.
//

import Foundation

class ExperianceViewModel {
    
    let service = ExperienceDataService()
    
    func getExpData() -> [Experience] {
        service.getExpData()
    }
}
