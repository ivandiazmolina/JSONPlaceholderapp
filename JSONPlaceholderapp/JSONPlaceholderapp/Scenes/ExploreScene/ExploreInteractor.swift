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
    func didSelectedItemAt(index: Int)
    
    // MARK: Users
    func setUsers(_ users: [User])
    func getUsersCount() -> Int
    func getUserCellFor(index: Int) -> Explore.Models.UserCellModel
}

protocol ExploreDataStore {
    var users: [User]? { get set }
    var selectedUser: User? { get set }
    var albums: [Album]? { get set }
    var todos: [Todo]? { get set }
}

class ExploreInteractor: ExploreBusinessLogic, ExploreDataStore {
    
    var presenter: ExplorePresentationLogic?
    var worker: ExploreWorker?
    
    var users: [User]?
    var selectedUser: User?
    var albums: [Album]?
    var todos: [Todo]?
    
    func setupView() {
        worker = ExploreWorker()
        let response: Explore.Models.Response = Explore.Models.Response()
        presenter?.setupView(response: response)
    }
    
    func didSelectedItemAt(index: Int) {
        
        guard let user = users?.getElement(index) else { return }
        
        selectedUser = user
        
        presenter?.displayLoading(true)
        
        let deadlineTime = DispatchTime.now() + 1.5
        DispatchQueue.main.asyncAfter(deadline: deadlineTime) { [weak self] in
            self?.worker?.getAlbumsAndTodos(for: user, completion: { [weak self] (albums, todos, error) in
                
                self?.albums = albums
                self?.todos = todos
                
                self?.presenter?.displayLoading(false)
                self?.presenter?.presentAlbumsAndTodos()
            })
        }
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
