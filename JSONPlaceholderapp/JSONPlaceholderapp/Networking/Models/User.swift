//
//  User.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 05/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: Int?
    var name: String?
    var username: String?
    var email: String?
    var website: String?
    var avatar: String?
    
    init() {
        id = -1
        name = ""
        username = ""
        email = ""
        website = ""
        avatar = ""
    }
    
    init(_ data: Data) throws {
        self = try JSONDecoder().decode(User.self, from: data)
    }
    
    init(_ json: String, encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data)
    }
}
