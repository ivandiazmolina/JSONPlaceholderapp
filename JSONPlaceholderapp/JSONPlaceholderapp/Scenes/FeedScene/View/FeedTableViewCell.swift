//
//  FeedTableViewCell.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit

class FeedTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var seeCommentsButton: UIButton!
    
    // MARK: LETS and VARS
    
    static var cellIdentifier: String {
        return String(describing: FeedTableViewCell.self)
    }
    
    func updateUI(model: Feed.Models.PostCellModel) {

        self.applyStyle()
        
        userNameLabel.text = String(format: "%d", model.post?.userId ?? "")
        postLabel.text = model.post?.body
        
    }

    func applyStyle() {
       
//        user.textColor = UIColor.greenPersonal
//        bgView.backgroundColor = UIColor.orange
    }
    
}
