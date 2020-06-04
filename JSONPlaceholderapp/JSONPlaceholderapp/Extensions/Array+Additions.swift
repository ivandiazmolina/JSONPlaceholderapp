//
//  Array+Additions.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

extension Array {
    
    /// Get the element of Index from Array if the index is valid, else return nil
    /// - Parameter index: index from Array
    func getElement(_ index: Int) -> Element? {
        guard index >= 0, index < self.count else {
            return nil
        }
        return self[index]
    }
}
