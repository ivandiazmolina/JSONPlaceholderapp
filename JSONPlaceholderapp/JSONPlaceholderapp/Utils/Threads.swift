//
//  Threads.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

/// Execute a function on UI Thread
/// - Parameter f: function
func ui(_ f: @escaping () -> Void) {
    
    DispatchQueue.main.async {
        f()
    }
}

/// Execute a function on Background Thread
/// - Parameter f: function
func background(_ f: @escaping () -> Void) {
    
    DispatchQueue.global(qos: .background).async {
        f()
    }
}
