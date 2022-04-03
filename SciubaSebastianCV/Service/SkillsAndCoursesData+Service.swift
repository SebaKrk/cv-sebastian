//
//  SkillsAndCoursesData+Service.swift
//  SciubaSebastianCV
//
//  Created by akra on 01/04/2022.
//

import Foundation

class SkillsAndCoursesDataService {
    
    func setSkillsAndCoursesData() -> [Courses] {
        
        let firstCourse = Courses(title: "iOS App Decelopment Bootcamp", author: "Dr. Angela Yu", courseImg: "https://img-c.udemycdn.com/course/240x135/1778502_f4b9_12.jpg", type: "Swift", skills: Skills(
            first: "How to use storyboard", second: "Implement Auto Layout", third: "Basic Netwok Call"))
        
        let secondCourse = Courses(title: "iOS 12 & Swift 4: Build a Pokedex App", author: "Stephan Dowless", courseImg: "https://img-c.udemycdn.com/course/240x135/2153544_0872_3.jpg", type: "Swift", skills: Skills(first: "Build storyboards programmatically", second: "Understand/implement the MVC architecture", third: "Work with UICollectionView"))
        
        let thirdCourse = Courses(title: "Build your first iPhone app using swift 5", author: "Nick Walter", courseImg: "https://zappycode.com/media/course_images/iOS14UIKitCourseImage.png", type: "Swift", skills: Skills(
            first: "Build UI Table View", second: "Use Core Data / REALM", third: "Implement Widgets to iOS App"))
        
        let fourthCourse = Courses(title: "Map Kit Mastery", author: "Stephan Dowless", courseImg: "https://img-c.udemycdn.com/course/240x135/2176534_1118_2.jpg", type: "Swift", skills: Skills(
            first: "Core location fundamentals", second: "Display user location on map", third: "Protocol Oriented Programing"))
        
        let fifthCourse = Courses(title: "iOS 13 & Swift 5: Login, Sign Up & Onboarding with FireBase", author: "Stephan Dowless", courseImg: "https://img-c.udemycdn.com/course/240x135/2884614_6307_2.jpg", type: "Swift", skills: Skills(
            first: "Authenticate users with Firebase", second: "Create users with Firebase", third: "Build an onboarding presentation"))
        
        let sixthCourse = Courses(title: "Programowanie w PHP od podstaw - teoria i praktyka", author: "Tomasz Tomczyk", courseImg: "https://img-c.udemycdn.com/course/240x135/2885672_2a55_7.jpg", type: "PHP", skills: Skills(
            first: "Podstawowa składnia PHP", second: "Podstawy bazy danych MySQL", third: "Dobre praktyki programowania"))
        
        let seventhCourse = Courses(title: "iOS Dev Launchpad - iOS 15", author: "Sean Allen", courseImg: "https://www.filepicker.io/api/file/8NXzNENXQqqSoiiWiYSs", type: "Swift", skills: Skills(
            first: "Intro to the Swift Programming Language", second: "Learn Xcode", third: "Storyboard & Programmatic UI"))
        
        let eighthCourse = Courses(title: "Figma Course - Designing Mobile App", author: "Nima Tahami", courseImg: "https://img-c.udemycdn.com/course/240x135/3032002_37a1_3.jpg", type: "Figma", skills: Skills(first: "Working live with a team inside Figma", second: "Designing the Mobile App UI ", third: "Creating reusable design components"))
        
        let nightCourse = Courses(title: "Build your foundation in SwiftUI", author: "Sean Allen", courseImg: "https://www.filepicker.io/api/file/tIrIh3a0TWegfxnTvtno", type: "SwiftUI", skills: Skills(first: "Fundamentals of SwiftUI Views", second: "Creating Widgets with SwiftUI", third: "Data Flow in SwiftUI"))
        
        return [firstCourse, secondCourse , thirdCourse, fourthCourse, fifthCourse, sixthCourse, seventhCourse, eighthCourse, nightCourse]
    }
}
