//
//  GitHubUser.swift
//  SciubaSebastianCV
//
//  Created by akra on 24/03/2022.
//

import Foundation

struct User : Codable {
    let login : String
    let avatar_url : String
    let html_url : String
    let followers_url : String
    let subscriptions_url : String
    let repos_url : String
    let name : String
    let company : String
    let location : String
    let email : String?
    let hireable : String?
    let bio : String
    let twitter_username : String?
    let public_repos : Int
    let public_gists : Int
    let followers : Int
    let following : Int
    let created_at : String
    let updated_at : String
}
