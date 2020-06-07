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
    
    /// Metodo que obtiene todos
    /// - Parameter completion: completion
    func getTodos(for user: User, completion: @escaping ([Todo]) -> Void) {
        
        // 3. intento obtener los todos de la API
        apiRepository.getTodos(for: user) { (posts) in
            
            // 5. devuelvo los todos
            completion(posts)
        }
    }
}
