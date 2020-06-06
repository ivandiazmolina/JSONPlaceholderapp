//
//  APIPostRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 06/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class APIPostRepository: APIBaseRepository, PostRepositoryProtocol {
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        
        // 1. try to init the URL
        guard let url = URL(string: POSTS_URL) else {
//            completion(.failure(error: "networking.error.downloadingusers".localized))
            completion([])
            return
        }
        
        // 4. execute the request
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            ui {
                guard let data = data else {
//                    completion(.failure(error: "networking.error.downloadingusers".localized))
                    completion([])
                    return
                }
                
                do {
                    let decodePosts = try JSONDecoder().decode([Post].self, from: data)
//                    completion(.success(result: decodeUsers))
                    completion(decodePosts)
                    return
                } catch {
//                    completion(.failure(error: "networking.error.downloadingusers".localized))
                    completion([])
                    return
                }
            }
        }.resume()
    }
}
