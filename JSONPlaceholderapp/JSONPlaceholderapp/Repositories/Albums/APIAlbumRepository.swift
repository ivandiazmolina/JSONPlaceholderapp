//
//  APIAlbumRepository.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

class APIAlbumRepository: APIBaseRepository, AlbumRepositoryProtocol {
    
    func getAlbums(for user: User, completion: @escaping ([Album]) -> Void) {
        
        // 1. try to init the URL
        guard let url = URL(string: String(format: "%@%@", USER_ALBUMS, "\(user.id ?? 0)")) else {
            completion([])
            return
        }
        
        print("URL: \(url)")
        
        // 2. execute the request
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            ui {
                guard let data = data else {
                    completion([])
                    return
                }
                
                do {
                    let decodeAlbums = try JSONDecoder().decode([Album].self, from: data)
                    completion(decodeAlbums)
                    return
                } catch {
                    completion([])
                    return
                }
            }
        }.resume()
    }
}
