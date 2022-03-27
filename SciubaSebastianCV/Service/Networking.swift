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
    
    func getUserData(completion: @escaping (Result<Users,Error>)->Void) {
        
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
                let user = try decoder.decode(Users.self, from: data)
                completion(.success(user))
            } catch {
                completion(.failure(NSError()))
            }
        } .resume()
    }
}
