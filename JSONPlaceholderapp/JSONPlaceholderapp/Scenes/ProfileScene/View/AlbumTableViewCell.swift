//
//  AlbumTableViewCell.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var albumImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: LETS and VARS
    
    static var cellIdentifier: String {
        return String(describing: AlbumTableViewCell.self)
    }
    
    func updateUI(model: Profile.Models.AlbumCellModel) {
        titleLabel.text = model.album?.title
    }
}
