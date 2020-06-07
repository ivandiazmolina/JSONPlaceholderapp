//
//  CommentRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

protocol CommentRepositoryProtocol {
    func getComments(for post: Post, completion: @escaping([Comment]) -> Void)
}

class CommentRepository {
  
    private var apiRepository: CommentRepositoryProtocol = APICommentRepository()
    
    /// Metodo que obtiene fotos
    /// - Parameter completion: completion
    func getComments(for post: Post, completion: @escaping ([Comment]) -> Void) {
        
        // 1. intento obtener los comentarios de la API
        apiRepository.getComments(for: post) { (comments) in
            
            // 2. devuelvo los comentarios
            completion(comments)
        }
    }
}
