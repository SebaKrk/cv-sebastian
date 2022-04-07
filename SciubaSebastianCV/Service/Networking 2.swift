//
//  Networking.swift
//  SciubaSebastianCV
//
//  Created by akra on 25/03/2022.
//

import Foundation

class Networking {
    
    func getGitHubData() {
        let url = URL(string: "https://api.github.com/users/SebaKrk")
        guard let url = url else {return}
        URLSession.shared.dataTask(with: url) { data, response, error in
            if error != nil {
                print(error?.localizedDescription)
                return
            }
            do {
                let result  = try JSONDecoder().decode(Users.self, from: data!)
                print(result)
            } catch {
                print("error")
            }
        }.resume()
    }
}
