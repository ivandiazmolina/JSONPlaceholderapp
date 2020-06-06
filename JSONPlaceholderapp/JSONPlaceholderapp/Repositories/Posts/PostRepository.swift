//
//  PostRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 06/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

protocol PostRepositoryProtocol {
    func getPosts(completion: @escaping([Post]) -> Void)
}

class PostRepository {
  
    private var apiRepository: PostRepositoryProtocol = APIPostRepository()
    private var localRepository: PostRepositoryProtocol = LocalPostRepository()
    
    /// Metodo que obtiene posts
    /// - Parameter completion: completion
    func getPosts(completion: @escaping ([Post]) -> Void) {
        
        // 1. intento obtener los posts de local
        localRepository.getPosts { [weak self] (posts) in
            
            // 2. devuelvo los posts que tengo en local
            if !posts.isEmpty {
                completion(posts)
            }
            
            // 3. intento obtener los posts de la API
            self?.apiRepository.getPosts { (posts) in
                
                // 4. si llegan posts, los guardo en memoria
                if !posts.isEmpty {
                    PostsManager.shared.setPosts(posts)
                }
                
                // 5. devuelvo los posts
                completion(posts)
            }
        }
    }
}
