//
//  MainWorker.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright (c) 2020 Iván Díaz Molina. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class MainWorker {
    
    
    func getInicialData(completion: @escaping([Post]?, [User]?, String?) -> Void) {
        
        // VARS
        var mPosts: [Post]?
        var mUsers: [User]?
        var mError: String?
        let dispatchGroup = DispatchGroup()
        let postRepository = PostRepository()
        
        // Get Posts
        dispatchGroup.enter()
        postRepository.getPosts() { posts in
            print(posts)
            mPosts = posts
            dispatchGroup.leave()
        }
        
        // Get Users
        dispatchGroup.enter()
        JSONPlaceholderManager.shared.getUsers { (response) in
            
            switch response {
            case .success(let result):
                mUsers = result
            case .failure(let error):
                mUsers = []
                mError = error
            }
            
            dispatchGroup.leave()
        }
        
        // COMMON
        dispatchGroup.notify(queue: .main) {
            
            guard mError != nil else {
                completion(mPosts, mUsers, nil)
                return
            }
            
            completion([], [], "")
        }
    }
}
