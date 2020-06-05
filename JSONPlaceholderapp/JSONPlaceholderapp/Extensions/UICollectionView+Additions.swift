//
//  UICollectionView+Additions.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 05/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit

extension UICollectionView {
    
    func register(_ identifier: String) {
        register(UINib(nibName: identifier, bundle: nil), forCellWithReuseIdentifier: identifier)
    }
}
