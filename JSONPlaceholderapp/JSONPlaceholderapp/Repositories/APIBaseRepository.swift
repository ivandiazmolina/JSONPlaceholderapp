//
//  APIBaseRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 06/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

// Enum to know jsonholder  operation result.
//
// - success: Operation finish without error
// - failure: Operation finish with error
enum APIRequestResult<U> {
    case success(result: U)
    case failure(error: String)
}

class APIBaseRepository {
    
    static internal let BASE_URL = "https://jsonplaceholder.typicode.com"
    internal let POSTS_URL = BASE_URL + "/posts"
    internal let USERS_URL = BASE_URL + "/users"
}
