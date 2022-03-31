//
//  EducationData+Service.swift
//  SciubaSebastianCV
//
//  Created by akra on 31/03/2022.
//

import Foundation

class EducationDataService {
    
    func setEducationData() -> [Education] {
        let first = Education(semester: Information(academic_year: "2019/2020 zimowy", sem_from: "25-09-2019", subNummber: 10, score: 4.2))
        let second = Education(semester: Information(academic_year: "2019/2020 letni", sem_from: "19-07-2020", subNummber: 7, score: 3.5))
        let third  = Education(semester: Information(academic_year: "2020/2021 zimowy", sem_from: "01-10-2021", subNummber: 7, score: 4.0))
        let fourth = Education(semester: Information(academic_year: "2020/2021 letni", sem_from: "05-03-2021", subNummber: 9, score: 3.8))
        let fifth = Education(semester: Information(academic_year: "2021/2022 zimowy", sem_from: "24-09-2021", subNummber: 10, score: 3.5))

        return [first,second,third,fourth,fifth]
    }
}
