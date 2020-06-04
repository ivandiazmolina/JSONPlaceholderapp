//
//  ExplorePresenter.swift
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

protocol ExplorePresentationLogic {
  func presentSomething(response: Explore.Something.Response)
}

class ExplorePresenter: ExplorePresentationLogic {
  weak var viewController: ExploreDisplayLogic?
  
  // MARK: Do something
  
  func presentSomething(response: Explore.Something.Response) {
    let viewModel = Explore.Something.ViewModel()
    viewController?.displaySomething(viewModel: viewModel)
  }
}
