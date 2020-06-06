//
//  JSONPlaceholderManager.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

// Enum to know jsonholder  operation result.
//
// - success: Operation finish without error
// - failure: Operation finish with error
enum JSONPlaceholderRequestResult<U> {
    case success(result: U)
    case failure(error: String)
}

class JSONPlaceholderManager {
    static let shared = JSONPlaceholderManager()
    private let baseURL = "https://jsonplaceholder.typicode.com"
    private init() {}
    
    /// Metodo que obtiene los usuarios
    /// - Parameter userID: id del usuario del que quiero obtener los post
    /// - Parameter completion: completion
    func getUsers(userID: String? = "", completion: @escaping (JSONPlaceholderRequestResult<[User]>) -> Void) {
        
        // 1. set the endPoint
        let endPoint: String = "/users"
        
        // 2. try to init the URL
        guard let url = URL(string: String(format: "%@%@", baseURL, endPoint)) else {
            completion(.failure(error: "networking.error.downloadingusers".localized))
            return
        }

        // 3. execute the request
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            ui {
                guard let data = data else {
                    completion(.failure(error: "networking.error.downloadingusers".localized))
                    return
                }
                                
                do {
                    let decodeUsers = try JSONDecoder().decode([User].self, from: data)
                    completion(.success(result: decodeUsers))
                    return
                } catch {
                    completion(.failure(error: "networking.error.downloadingusers".localized))
                    return
                }
            }
        }.resume()
    }
}
