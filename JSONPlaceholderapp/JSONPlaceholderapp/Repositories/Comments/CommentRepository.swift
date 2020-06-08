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
    
    /// Method that requests the comments of an post
    /// - Parameter completion: completion
    func getComments(for post: Post, completion: @escaping ([Comment]) -> Void) {
        
        // 1. try to get the remote comments
        apiRepository.getComments(for: post) { (comments) in
            
            // 2. return the comments
            completion(comments)
        }
    }
}
