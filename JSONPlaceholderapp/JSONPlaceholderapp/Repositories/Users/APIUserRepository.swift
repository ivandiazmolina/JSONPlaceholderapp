//
//  APIUserRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 06/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class APIUserRepository: APIBaseRepository, UserRepositoryProtocol {
    func getUsers(completion: @escaping ([User]) -> Void) {
        
        // 1. try to init the URL
        guard let url = URL(string: USERS_URL) else {
            completion([])
            return
        }

        // 3. execute the request
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            ui {
                guard let data = data else {
                    completion([])
                    return
                }
                                
                do {
                    let decodeUsers = try JSONDecoder().decode([User].self, from: data)
                    completion(decodeUsers)
                    return
                } catch {
                    completion([])
                    return
                }
            }
        }.resume()
    }
}
