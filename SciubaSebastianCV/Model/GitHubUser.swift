//
//  GitHubUser.swift
//  SciubaSebastianCV
//
//  Created by akra on 24/03/2022.
//

import Foundation

struct Users : Codable {
    let login : String
    let avatar_url : String
    let html_url : String
    let followers_url : String
    let subscriptions_url : String
    let repos_url : String
    let name : String
    let company : String?
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

//    let login : String
//    let avatar_url : String
//    let html_url : String // "https://github.com/SebaKrk",
//    let followers_url : String // "https://api.github.com/users/SebaKrk/followers",
//    let subscriptions_url : String //"https://api.github.com/users/SebaKrk/subscriptions",
//    let repos_url : String //"https://api.github.com/users/SebaKrk/repos",
//    let name : String //"Sebastian",
//    let company : String? //null,
//    let location : String //"Kraków",
//    let email : String? // null,
//    let hireable : String? //null,
//    let bio : String //"I am currently a student in Krakow Academy: Computer Science and Econometrics - Game Design and VR Applications.\r\nApple brand fan",
//    let twitter_username : String? // null,
//    let public_repos : Int //20,
//    let public_gists : Int //0,
//    let followers : Int //2,
//    let following : Int //25,
//    let created_at : String // "2020-02-13T16:14:25Z",
//    let updated_at : String //"2022-03-14T14:03:31Z"
//}
