//
//  ProfilePresenter.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 06/06/2020.
//  Copyright (c) 2020 Iván Díaz Molina. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ProfilePresentationLogic {
    func setupView(response: Profile.Models.Response)
    func displayLoading(_ show: Bool)
    func presentAlbums()
    func presentTodos()
    func presentPhotos()
}

class ProfilePresenter: ProfilePresentationLogic {
    
    weak var viewController: ProfileDisplayLogic?
    
    func setupView(response: Profile.Models.Response) {
        
        let username = String(format: "@%@", response.user?.username ?? "")
        var avatar: UIImage?
        
        if let image = UIImage(named: response.user?.avatar ?? "") {
            avatar = image
        }
        
        let viewModel = Profile.Models.ViewModel(name: response.user?.name, username: username, avatar: avatar)
        viewController?.setupView(viewModel: viewModel)
    }
    
    func displayLoading(_ show: Bool) {
        viewController?.displayLoading(show)
    }
    
    func presentAlbums() {
        viewController?.displayAlbums()
    }
    
    func presentTodos() {
        viewController?.displayTodos()
    }
    
    func presentPhotos() {
        viewController?.displayPhotos()
    }
}
