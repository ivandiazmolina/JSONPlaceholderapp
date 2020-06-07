//
//  PhotosSceneRouter.swift
//  JSONPlaceholderapp
//
//  Created by Iván Díaz Molina on 07/06/2020.
//  Copyright (c) 2020 Iván Díaz Molina. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

@objc protocol PhotosSceneRoutingLogic {
}

protocol PhotosSceneDataPassing {
    var dataStore: PhotosSceneDataStore? { get }
}

class PhotosSceneRouter: NSObject, PhotosSceneRoutingLogic, PhotosSceneDataPassing {
    weak var viewController: PhotosSceneViewController?
    var dataStore: PhotosSceneDataStore?
}
