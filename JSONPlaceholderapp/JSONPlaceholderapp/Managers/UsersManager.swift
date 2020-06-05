//
//  UsersManager.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 05/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class UsersManager {
    
    static let shared = UsersManager()
    
    private var users: [User] = []
    
    func setUsers(_ users: [User]) {
        self.users = users
    }
    
    func getUsers() -> [User] {
        return users
    }
}
