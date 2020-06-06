//
//  LocalUserRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 06/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class LocalUserRepository: APIBaseRepository, UserRepositoryProtocol {
    
    func getUsers(completion: @escaping ([User]) -> Void) {
        completion(UsersManager.shared.getUsers())
    }
}
