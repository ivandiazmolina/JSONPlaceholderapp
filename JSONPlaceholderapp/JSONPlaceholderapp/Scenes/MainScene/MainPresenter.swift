//
//  MainPresenter.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 04/06/2020.
//  Copyright (c) 2020 Iván Díaz Molina. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol MainPresentationLogic {
    func setupView(response: Main.Models.Response)
    func presentPostsAndUsers(response: Main.Models.Response)
}

class MainPresenter: MainPresentationLogic {
    
    weak var viewController: MainDisplayLogic?
    
    func setupView(response: Main.Models.Response) {
        let viewModel = Main.Models.ViewModel()
        viewController?.setupView(viewModel: viewModel)
    }
    
    func presentPostsAndUsers(response: Main.Models.Response) {
        let viewModel = Main.Models.ViewModel(posts: response.posts, users: response.users)
        viewController?.displayPostsAndUsers(viewModel: viewModel)
    }
}
