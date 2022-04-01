//
//  Networking.swift
//  SciubaSebastianCV
//
//  Created by akra on 25/03/2022.
//

import Foundation

enum DataError : Error {
    case network(Error)
    case invalidResponse
    case invalidData
    case decoding
}


class Networking {
    
  static let shared = Networking()
    
    static let basicUserURL = "https://api.github.com/users/SebaKrk"
    static let basicRepoURL = "https://api.github.com/users/SebaKrk/repos"
    
    typealias Completion<T> = (Result<T,DataError>) -> Void
    
    func fetchData<T: Decodable>(from url: URL, completion: @escaping Completion<T>) {
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(.network(error)))
                return
            }
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completion(.failure(.invalidResponse))
                return
            }
            guard let data = data else {
                completion(.failure(.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let decodeData = try decoder.decode(T.self, from: data)
                completion(.success(decodeData))
            } catch  {
                completion(.failure(.decoding))
            }
        }.resume()
    }
    
    
}
