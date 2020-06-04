//
//  UITableView+Additions.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit

extension UITableView {
    
    func register(_ identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)
    }
}
