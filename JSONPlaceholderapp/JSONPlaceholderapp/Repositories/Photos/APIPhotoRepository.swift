//
//  APIPhotoRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class APIPhotoRepository: APIBaseRepository, PhotoRepositoryProtocol {
    
    func getPhotos(for album: Album, completion: @escaping ([Photo]) -> Void) {
        
        // 1. try to init the URL
        guard let url = URL(string: String(format: "%@%@", ALBUM_PHOTOS, "\(album.id ?? 0)")) else {
            completion([])
            return
        }
        
        print("URL: \(url)")
        
        // 2. execute the request
        background {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                
                ui {
                    guard let data = data else {
                        completion([])
                        return
                    }
                    
                    do {
                        let decodePhotos = try JSONDecoder().decode([Photo].self, from: data)
                        completion(decodePhotos)
                        return
                    } catch {
                        completion([])
                        return
                    }
                }
            }.resume()
        }
    }
}
