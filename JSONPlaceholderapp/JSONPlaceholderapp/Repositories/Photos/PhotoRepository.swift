//
//  PhotoRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

protocol PhotoRepositoryProtocol {
    func getPhotos(for album: Album, completion: @escaping([Photo]) -> Void)
}

class PhotoRepository {
  
    private var apiRepository: PhotoRepositoryProtocol = APIPhotoRepository()
    
    /// Metodo que obtiene fotos
    /// - Parameter completion: completion
    func getPhotos(for album: Album, completion: @escaping ([Photo]) -> Void) {
        
        // 1. intento obtener las fotos de la API
        apiRepository.getPhotos(for: album) { (photos) in
            
            // 2. devuelvo las fotos
            completion(photos)
        }
    }
}
