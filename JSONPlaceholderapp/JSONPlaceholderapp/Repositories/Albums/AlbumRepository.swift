//
//  AlbumRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

protocol AlbumRepositoryProtocol {
    func getAlbums(for user: User, completion: @escaping([Album]) -> Void)
}

class AlbumRepository {
  
    private var apiRepository: AlbumRepositoryProtocol = APIAlbumRepository()
    
    /// Method that requests the albums of an user
    /// - Parameter completion: completion
    func getAlbums(for user: User, completion: @escaping ([Album]) -> Void) {
        
        // 1. try to get the remote albums
        apiRepository.getAlbums(for: user) { (albums) in
            
            // 2. return the albums
            completion(albums)
        }
    }
}
