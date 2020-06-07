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
    
    /// Metodo que obtiene albums
    /// - Parameter completion: completion
    func getAlbums(for user: User, completion: @escaping ([Album]) -> Void) {
        
        // 3. intento obtener los albums de la API
        apiRepository.getAlbums(for: user) { (albums) in
            
            // 5. devuelvo los albums
            completion(albums)
        }
    }
}
