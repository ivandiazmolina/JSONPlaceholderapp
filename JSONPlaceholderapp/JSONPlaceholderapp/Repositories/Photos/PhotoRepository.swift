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
    
    /// Method that requests the photos of an album
    /// - Parameter completion: completion
    func getPhotos(for album: Album, completion: @escaping ([Photo]) -> Void) {
        
        // 1. try to get the remote photos
        apiRepository.getPhotos(for: album) { (photos) in
            
            // 2. return the photos
            completion(photos)
        }
    }
}
