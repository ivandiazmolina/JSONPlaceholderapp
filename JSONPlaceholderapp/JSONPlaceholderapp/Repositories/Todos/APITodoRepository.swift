//
//  APITodoRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class APITodoRepository: APIBaseRepository, TodoRepositoryProtocol {
    
    func getTodos(for user: User, completion: @escaping ([Todo]) -> Void) {
        
        // 1. try to init the URL
        guard let url = URL(string: String(format: "%@%@", USER_TODOS, "\(user.id ?? 0)")) else {
            completion([])
            return
        }
        
        // 2. execute the request
        background {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                ui {
                    guard let data = data else {
                        completion([])
                        return
                    }
                    
                    do {
                        let decodeTodos = try JSONDecoder().decode([Todo].self, from: data)
                        completion(decodeTodos)
                        return
                    } catch {
                        completion([])
                        return
                    }
                }
            }.resume()
        }
    }
}
