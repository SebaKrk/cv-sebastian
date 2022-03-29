//
//  Networking.swift
//  SciubaSebastianCV
//
//  Created by akra on 25/03/2022.
//

import Foundation

class Networking {
    
  static let shared = Networking()
    
    private let basicURL = "https://api.github.com/users/SebaKrk"
    private let basicRepo = "https://api.github.com/users/SebaKrk/repos"
    
    func fetchUserData(completion: @escaping (Result<User,Error>)->Void) {
        
        guard let url = URL(string: basicURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(NSError()))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NSError()))
                return
            }
            guard let data = data else {
                completion(.failure(NSError()))
                return
            }
            do {
                let decoder = JSONDecoder()
                let user = try decoder.decode(User.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(NSError()))
            }
        } .resume()
    }
    
    func fetchReposData(completion: @escaping (Result<[GitHubRepos],Error>)->Void) {
        
        guard let url = URL(string: basicRepo) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let _ = error {
                completion(.failure(NSError()))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(NSError()))
                return
            }
            guard let data = data else {
                completion(.failure(NSError()))
                return
            }
            do {
                let decoder = JSONDecoder()
                let repo = try decoder.decode([GitHubRepos].self, from: data)
                completion(.success(repo))
            } catch {
                completion(.failure(NSError()))
            }
        } .resume()
    }
}
