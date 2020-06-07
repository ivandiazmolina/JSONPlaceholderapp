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
    
    // MARK: Common
    static internal let BASE_URL = "https://jsonplaceholder.typicode.com"
    
    internal let POSTS_URL = BASE_URL + "/posts"
    
    // MARK: User
    internal let USERS_URL = BASE_URL + "/users"
    internal let USER_ALBUMS = BASE_URL + "/albums?userId="
    internal let USER_TODOS = BASE_URL + "/todos?userId="
    
    // MARK: Album
    internal let ALBUM_PHOTOS = BASE_URL + "/photos?albumId="
}
