//
//  PhotosPresenter.swift
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

protocol PhotosPresentationLogic {
    func setupView()
}

class PhotosPresenter: PhotosPresentationLogic {
    
    weak var viewController: PhotosDisplayLogic?
    
    func setupView() {
        viewController?.setupView()
    }
}