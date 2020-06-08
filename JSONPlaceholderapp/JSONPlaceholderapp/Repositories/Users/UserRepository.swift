//
//  UserRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 06/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

protocol UserRepositoryProtocol {
    func getUsers(completion: @escaping([User]) -> Void)
}

class UserRepository {
  
    private var apiRepository: UserRepositoryProtocol = APIUserRepository()
    private var localRepository: UserRepositoryProtocol = LocalUserRepository()
    
    /// Method that requests the users
    /// - Parameter completion: completion
    func getUsers(completion: @escaping ([User]) -> Void) {
        
        // 1. try to get the local users
        localRepository.getUsers { [weak self] (users) in
            
            // 2. return the local users if it is not empty
            if !users.isEmpty {
                completion(users)
            }
            
            // 3. try to get the remote users
            self?.apiRepository.getUsers { (users) in
                
                // 4. if it is not empty, save it in local
                if !users.isEmpty {
                    UsersManager.shared.setUsers(users)
                }
                
                // 5. return the users
                completion(users)
            }
        }
    }
}
