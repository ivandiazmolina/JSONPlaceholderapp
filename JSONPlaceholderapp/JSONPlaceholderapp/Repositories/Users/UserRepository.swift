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
    
    /// Metodo que obtiene usuarios
    /// - Parameter completion: completion
    func getUsers(completion: @escaping ([User]) -> Void) {
        
        // 1. intento obtener los usuarios de local
        localRepository.getUsers { [weak self] (users) in
            
            // 2. devuelvo los usuarios que tengo en local
            if !users.isEmpty {
                completion(users)
            }
            
            // 3. intento obtener los posts de la API
            self?.apiRepository.getUsers { (users) in
                
                // 4. si llegan usuarios, los guardo en memoria
                if !users.isEmpty {
                    UsersManager.shared.setUsers(users)
                }
                
                // 5. devuelvo los usuarios
                completion(users)
            }
        }
    }
}
