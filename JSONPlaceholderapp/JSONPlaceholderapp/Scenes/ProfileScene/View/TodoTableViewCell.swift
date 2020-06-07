//
//  TodoTableViewCell.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright © 2020 Iván Díaz Molina. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var titleLabel: UILabel!
    
    // MARK: LETS and VARS
    
    static var cellIdentifier: String {
        return String(describing: TodoTableViewCell.self)
    }
    
    func updateUI(model: Profile.Models.TodoCellModel) {
        titleLabel.text = model.todo?.title
        self.accessoryType = model.todo?.completed ?? false ? .checkmark : .none
    }
}
