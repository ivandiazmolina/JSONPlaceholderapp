//
//  MainInteractor.swift
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

protocol MainBusinessLogic {
    func setupView()
    func getInitialData()
}

protocol MainDataStore {
}

class MainInteractor: MainBusinessLogic, MainDataStore {
    
    var presenter: MainPresentationLogic?
    var worker: MainWorker?
    
    func setupView() {
        worker = MainWorker()
        let response: Main.Models.Response = Main.Models.Response()
        presenter?.setupView(response: response)
    }
    
    /// Method that downloads the initial data. Retrieve the posts and users
    func getInitialData() {
        worker?.getInitialData(completion: { [weak self] (posts, users, error) in
            
            guard error != nil else {
                
                //SUCESS
                UsersManager.shared.setUsers(users ?? [])
                
                let response = Main.Models.Response(posts: posts, users: users)
                
                self?.presenter?.presentPostsAndUsers(response: response)
                return
            }
            
            // FAILURE
            self?.presenter?.presentPostsAndUsers(response: Main.Models.Response())
        })
    }
}
