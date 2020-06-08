//
//  TodoRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

protocol TodoRepositoryProtocol {
    func getTodos(for user: User, completion: @escaping([Todo]) -> Void)
}

class TodoRepository {
  
    private var apiRepository: TodoRepositoryProtocol = APITodoRepository()
    
    /// Method that requests the todos of an user
    /// - Parameter completion: completion
    func getTodos(for user: User, completion: @escaping ([Todo]) -> Void) {
        
        // 1. try to get the remote todos
        apiRepository.getTodos(for: user) { (posts) in
            
            // 2. return the todos
            completion(posts)
        }
    }
}
