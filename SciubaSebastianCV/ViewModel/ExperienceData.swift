//
//  ExperienceData.swift
//  SciubaSebastianCV
//
//  Created by akra on 21/03/2022.
//

import Foundation

struct ExperienceData {
    let company1 = Experience(company: "Freelance", startDate: "2021-01", endDate: "present", position: "iOS Developer", location: "Krakow", responsibilities: Responsibilities(
        first: "Tworzenie aplikacji na platforme iOS",
        second: "Projektowanie aplikacji oraz zawansowanych intrfejsow",
        third: "Poszukiwanie nowych rozwiazan"))
    
    let company2 = Experience(company: "UTest", startDate: "2020-03", endDate: "2021-01", position: "Software Tester", location: "Krakow", responsibilities: Responsibilities(
        first: "Testowanie manualne aplikacji mobilnych i web",
        second: "Samodzielne prowadzenie analizy przyczyny powstanie bledow",
        third: "Tworzenie scenariuszy i przypadkow testowych"))
    
    let company3 = Experience(company: "Calypso Fitness", startDate: "2018-03", endDate: "present", position: "General Manager", location: "Krakow", responsibilities: Responsibilities(
        first: "Zarzadzanie codziennym funkcionwaniem klubu fitness",
        second: "Rekrutacja, zarzadzanie zespolem oraz placami",
        third: "Dbanie o zaopatrzenie klubu"))
}
