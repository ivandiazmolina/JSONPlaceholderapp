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


//"id": 1,
//"name": "Leanne Graham",
//"username": "Bret",
//"email": "Sincere@april.biz",
//"address": {
//  "street": "Kulas Light",
//  "suite": "Apt. 556",
//  "city": "Gwenborough",
//  "zipcode": "92998-3874",
//  "geo": {
//    "lat": "-37.3159",
//    "lng": "81.1496"
//  }
