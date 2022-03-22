//
//  ExperienceData.swift
//  SciubaSebastianCV
//
//  Created by akra on 21/03/2022.
//

import Foundation

//struct ExperienceData {
//    let company1 = Experience(company: "Freelance", startDate: "2021-01", endDate: "present", position: "iOS Developer", location: "Krakow", responsibilities: Responsibilities(
//        first: "Tworzenie aplikacji na platforme iOS",
//        second: "Projektowanie aplikacji oraz zawansowanych intrfejsow",
//        third: "Poszukiwanie nowych rozwiazan"))
//    
//    let company2 = Experience(company: "UTest", startDate: "2020-03", endDate: "2021-01", position: "Software Tester", location: "Krakow", responsibilities: Responsibilities(
//        first: "Testowanie manualne aplikacji mobilnych i web",
//        second: "Samodzielne prowadzenie analizy przyczyny powstanie bledow",
//        third: "Tworzenie scenariuszy i przypadkow testowych"))
//    
//    let company3 = Experience(company: "Calypso Fitness", startDate: "2018-03", endDate: "present", position: "General Manager", location: "Krakow", responsibilities: Responsibilities(
//        first: "Zarzadzanie codziennym funkcionwaniem klubu fitness",
//        second: "Rekrutacja, zarzadzanie zespolem oraz placami",
//        third: "Dbanie o zaopatrzenie klubu"))
//}

func getExpData() -> [Experience] {
    let company1 = Experience(company: "ARKA", startDate: "2022-03", endDate: "present", position: "Intern iOS Developer", location: "Krakow", responsibilities: Responsibilities(first: "Learning", second: "Learning", third: "Learning"))
    let company2 = Experience(company: "Freelance", startDate: "2021-01", endDate: "2022-02", position: "iOS Developer", location: "Krakow", responsibilities: Responsibilities(
        first: "Tworzenie aplikacji na platforme iOS",
        second: "Projektowanie aplikacji oraz zawansowanych intrfejsow",
        third: "Poszukiwanie nowych rozwiazan"))
    
    let company3 = Experience(company: "UTest", startDate: "2020-03", endDate: "2021-01", position: "Software Tester", location: "Krakow", responsibilities: Responsibilities(
        first: "Testowanie manualne aplikacji mobilnych i web",
        second: "Samodzielne prowadzenie analizy przyczyny powstanie bledow",
        third: "Tworzenie scenariuszy i przypadkow testowych"))
    
    let company4 = Experience(company: "Calypso Fitness", startDate: "2018-03", endDate: "present", position: "General Manager", location: "Krakow", responsibilities: Responsibilities(
        first: "Zarzadzanie codziennym funkcionwaniem klubu fitness",
        second: "Rekrutacja, zarzadzanie zespolem oraz placami",
        third: "Dbanie o zaopatrzenie klubu"))
    
    let company5 = Experience(company: "Jatomi Fitness", startDate: "2016-09", endDate: "2018-02", position: "General Manager", location: "Krakow", responsibilities: Responsibilities(
        first: "Zarzadzanie codzienna dzialanoscia klubu",
        second: "Zarzadzanie dzialem sprzedazy",
        third: "Rekrytacja na wszystkich sczeblach"))
    
    let company6 = Experience(company: "Pure Helth&Fitness", startDate: "2013-01", endDate: "2015-08", position: "Sales Consultant", location: "Krakow", responsibilities: Responsibilities(
        first: "Sprzedaz czlonkostw",
        second: "Pozyskiwanie kontaktow",
        third: "Dbanie o pozytywne relacje z klubowiczami"))
    
    return [company1,company2,company3,company4,company5,company6]
}

