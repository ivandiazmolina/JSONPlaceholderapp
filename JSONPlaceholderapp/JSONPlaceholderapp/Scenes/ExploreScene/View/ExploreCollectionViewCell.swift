//
//  ExploreCollectionViewCell.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 05/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit

class ExploreCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var username: UILabel!
    
    static var cellIdentifier: String {
        return String(describing: ExploreCollectionViewCell.self)
    }
    
    func updateUI(model: Explore.Models.UserCellModel) {
        name.text = model.user?.name
        username.text = String(format: "@%@", model.user?.username ?? "")
        
        if let image = UIImage(named: model.user?.avatar ?? "") {
            avatarImageView.image = image
        }
    }
}
