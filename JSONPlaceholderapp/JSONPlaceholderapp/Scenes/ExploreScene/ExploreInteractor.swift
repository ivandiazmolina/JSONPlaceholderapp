//
//  ExploreInteractor.swift
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

protocol ExploreBusinessLogic {
    func setupView()
    
    // MARK: Users
    func setUsers(_ users: [User])
    func getUsersCount() -> Int
    func getUserCellFor(index: Int) -> Explore.Models.UserCellModel
}

protocol ExploreDataStore {
    var users: [User]? { get set }
}

class ExploreInteractor: ExploreBusinessLogic, ExploreDataStore {
    var presenter: ExplorePresentationLogic?
    var worker: ExploreWorker?
    
    var users: [User]?
    
    func setupView() {
        worker = ExploreWorker()
        let response: Explore.Models.Response = Explore.Models.Response()
        presenter?.setupView(response: response)
    }
    
    // MARK: Users
    
    func setUsers(_ users: [User]) {
        self.users = users
    }
    
    func getUsersCount() -> Int {
        return users?.count ?? 0
    }
    
    func getUserCellFor(index: Int) -> Explore.Models.UserCellModel {
        guard let user = users?.getElement(index) else { return Explore.Models.UserCellModel() }
        return Explore.Models.UserCellModel(user: user)
    }
}
