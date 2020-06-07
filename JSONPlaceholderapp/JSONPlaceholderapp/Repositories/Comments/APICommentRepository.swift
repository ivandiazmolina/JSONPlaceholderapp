//
//  APICommentRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class APICommentRepository: APIBaseRepository, CommentRepositoryProtocol {
    
    func getComments(for post: Post, completion: @escaping ([Comment]) -> Void) {
        
        // 1. try to init the URL
        guard let url = URL(string: String(format: "%@%@", POST_COMMENTS, "\(post.id ?? 0)")) else {
            completion([])
            return
        }
        
        print("URL: \(url)")
        
        // 2. execute the request
        background {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                ui {
                    guard let data = data else {
                        completion([])
                        return
                    }
                    
                    do {
                        let decodeComments = try JSONDecoder().decode([Comment].self, from: data)
                        completion(decodeComments)
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
