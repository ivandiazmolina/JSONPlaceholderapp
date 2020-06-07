//
//  PhotoCollectionViewCell.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    static var cellIdentifier: String {
        return String(describing: PhotoCollectionViewCell.self)
    }
    
    func updateUI(model: Photos.Models.PhotoCellModel) {
        
        guard let url = URL(string: model.photo?.url ?? "") else { return }
        
        photoImageView.sd_setImage(with: url) { [weak self] (image, error, cacheType, url) in
            guard let image = image else { return }
            
            self?.photoImageView.image = image
            self?.photoImageView.backgroundColor = .clear
        }
    }

}
