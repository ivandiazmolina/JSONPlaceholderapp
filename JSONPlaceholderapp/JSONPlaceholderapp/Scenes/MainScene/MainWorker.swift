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
    
    func getInitialData(completion: @escaping([Post]?, [User]?, String?) -> Void) {
        
        // LETS and VARS
        var mPosts: [Post]?
        var mUsers: [User]?
        
        let dispatchGroup = DispatchGroup()
        
        let postRepository = PostRepository()
        let userRepository = UserRepository()
        
        
        // Get Posts
        dispatchGroup.enter()
        postRepository.getPosts() { posts in
            print(posts)
            mPosts = posts
            dispatchGroup.leave()
        }
        
        // Get Users
        dispatchGroup.enter()
        userRepository.getUsers() { users in
            print(users)
            mUsers = users
            dispatchGroup.leave()
        }

        // DispatchGroup
        dispatchGroup.notify(queue: .main) {
            
            var usersArray: [User] =  []
            
            for user in mUsers ?? [] {
                usersArray.append(self.assignAvatar(for: user))
            }
            
            completion(mPosts, usersArray, nil)
        }
    }
    
    /// Method that assigns an avatar to an user
    /// - Parameter user: user
    func assignAvatar(for user: User) -> User {
        
        var mUser = user
        
        let names = [
            Constants.Avatar.bender,
            Constants.Avatar.homer,
            Constants.Avatar.ironman,
            Constants.Avatar.mario,
            Constants.Avatar.stormtrooper
        ]

        mUser.avatar = names.randomElement()
        
        return mUser
    }
}
