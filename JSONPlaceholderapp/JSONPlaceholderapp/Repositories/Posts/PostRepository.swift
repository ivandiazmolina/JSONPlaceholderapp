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
    
    /// Method that requests the posts
    /// - Parameter completion: completion
    func getPosts(completion: @escaping ([Post]) -> Void) {
        
        // 1. try to get the local posts
        localRepository.getPosts { [weak self] (posts) in
            
            // 2. return the local posts if it is not empty
            if !posts.isEmpty {
                completion(posts)
            }
            
            // 3. try to get the remote posts
            self?.apiRepository.getPosts { (posts) in
                
                // 4. if it is not empty, save it in local
                if !posts.isEmpty {
                    PostsManager.shared.setPosts(posts)
                }
                
                // 5. return the posts
                completion(posts)
            }
        }
    }
}
