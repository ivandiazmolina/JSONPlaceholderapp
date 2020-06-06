//
//  LocalPostRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 06/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class LocalPostRepository: PostRepositoryProtocol {
    
    func getPosts(completion: @escaping ([Post]) -> Void) {
        completion(PostsManager.shared.getPosts())
    }
}
