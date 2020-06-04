//
//  String+Additions.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import Foundation

extension String {
    
    /// Get the localized of String from Localizable.strings
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
