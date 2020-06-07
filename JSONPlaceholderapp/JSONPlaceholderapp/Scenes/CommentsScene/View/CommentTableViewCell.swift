//
//  CommentTableViewCell.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit

class CommentTableViewCell: UITableViewCell {

    @IBOutlet weak var body: UILabel!
    
    static var cellIdentifier: String {
        return String(describing: CommentTableViewCell.self)
    }
    
    func updateUI(model: Comments.Models.CommentCellModel) {
        
        body.text = model.comment?.body
    }
}
