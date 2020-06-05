//
//  PostsManager.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 05/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class PostsManager {
    
    static let shared = PostsManager()
    
    private var posts: [Post] = []
    
    func setPosts(_ posts: [Post]) {
        self.posts = posts
    }
    
    func getPosts() -> [Post] {
        return posts
    }
}
