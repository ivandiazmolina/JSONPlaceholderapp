//
//  Post.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

struct Post: Codable {
    var userId: Int?
    var id: Int?
    var title: String?
    var body: String?
    
    init() {
        userId = -1
        id = -1
        title = ""
        body = ""
    }
    
    init(_ data: Data) throws {
        self = try JSONDecoder().decode(Post.self, from: data)
    }
    
    init(_ json: String, encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data)
    }
}
