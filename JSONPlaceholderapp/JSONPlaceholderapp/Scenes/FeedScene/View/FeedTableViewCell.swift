//
//  FeedTableViewCell.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit

protocol FeedTableViewCellDelegate {
    func onTouchSeeComments(for post: Post?)
}

class FeedTableViewCell: UITableViewCell {

    // MARK: IBOutlets
    
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var postLabel: UILabel!
    @IBOutlet weak var seeCommentsButton: UIButton!
    
    // MARK: LETS and VARS
    var delegate: FeedTableViewCellDelegate?
    private var post: Post?
    
    static var cellIdentifier: String {
        return String(describing: FeedTableViewCell.self)
    }
    
    func updateUI(model: Feed.Models.PostCellModel) {
        
        post = model.post
        
        userNameLabel.text = String(format: "UserId: %d", model.post?.userId ?? "")
        postLabel.text = model.post?.body
    }
    
    @IBAction func onTouchSeeComments(_ sender: UIButton) {
        delegate?.onTouchSeeComments(for: post)
    }
}
