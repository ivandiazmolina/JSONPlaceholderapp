//
//  FeedInteractor.swift
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

protocol FeedBusinessLogic {
    
    func setupView()
    
    // MARK: Posts
    func setPosts(_ posts: [Post])
    func getPostsCount() -> Int
    func getPostCellFor(index: Int) -> Feed.Models.PostCellModel
}

protocol FeedDataStore {
    var posts: [Post]? { get set }
}

class FeedInteractor: FeedBusinessLogic, FeedDataStore {
    
    var presenter: FeedPresentationLogic?
    var worker: FeedWorker?
    
    var posts: [Post]?
    
    func setupView() {
        worker = FeedWorker()
        let response: Feed.Models.Response = Feed.Models.Response()
        presenter?.setupView(response: response)
    }
    
    
    // MARK: Posts
    
    func setPosts(_ posts: [Post]) {
        self.posts = posts
    }
    
    func getPostsCount() -> Int {
        return posts?.count ?? 0
    }
    
    func getPostCellFor(index: Int) -> Feed.Models.PostCellModel {
        guard let post = posts?.getElement(index) else { return Feed.Models.PostCellModel() }
        return Feed.Models.PostCellModel(post: post)
    }
}
