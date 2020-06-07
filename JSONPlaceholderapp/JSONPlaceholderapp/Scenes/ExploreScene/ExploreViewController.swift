//
//  ExploreViewController.swift
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

protocol ExploreDisplayLogic: class {
    func setupView(viewModel: Explore.Models.ViewModel)
    func displayLoading(_ show: Bool)
    func displayUsers(viewModel: Explore.Models.ViewModel)
    func displayAlbumsAndTodos()
}

class ExploreViewController: BaseViewController, ExploreDisplayLogic {
    
    var interactor: ExploreBusinessLogic?
    var router: (NSObjectProtocol & ExploreRoutingLogic & ExploreDataPassing)?
    
    // MARK: IBOutlets
    @IBOutlet weak var exploreCollectionView: UICollectionView!
    
    let CELL_SIZE: CGFloat = 220
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ExploreInteractor()
        let presenter = ExplorePresenter()
        let router = ExploreRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: Routing
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let scene = segue.identifier {
            let selector = NSSelectorFromString("routeTo\(scene)WithSegue:")
            if let router = router, router.responds(to: selector) {
                router.perform(selector, with: segue)
            }
        }
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.setupView()
    }
    
    func setupView(viewModel: Explore.Models.ViewModel) {
        
        // NavigationController
        self.navigationItem.title = "explore".localized;
        
        //CollectionView
        exploreCollectionView.register(ExploreCollectionViewCell.cellIdentifier)
        exploreCollectionView.delegate = self
        exploreCollectionView.dataSource = self
        
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.itemSize = CGSize(width: UIScreen.main.bounds.width/2-10, height: CELL_SIZE)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        flowLayout.minimumInteritemSpacing = 0.0
        exploreCollectionView.collectionViewLayout = flowLayout
    }
    
    func displayLoading(_ show: Bool) {
        show ? showLoading() : dismissLoading()
    }
    
    func displayUsers(viewModel: Explore.Models.ViewModel) {
        print(viewModel)
        
        reloadData()
    }
    
    func displayAlbumsAndTodos() {
        router?.routeToProfile(segue: nil)
    }
    
    func reloadData() {
        ui { [weak self] in
            self?.exploreCollectionView.reloadData()
        }
    }
}

// MARK: UICollectionViewDelegate, UICollectionViewDatasource
extension ExploreViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExploreCollectionViewCell.cellIdentifier, for: indexPath) as? ExploreCollectionViewCell else {
            print("Error to cast UICollectionViewCell to ExploreCollectionViewCell")
            return UICollectionViewCell()
        }
        
        guard let data = interactor?.getUserCellFor(index: indexPath.row) else {
            print("Error to get UserCellModel from index")
            return UICollectionViewCell()
        }
        
        cell.updateUI(model: data)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        interactor?.didSelectedItemAt(index: indexPath.row)
    }
    
}

// MARK: MainDelegate

extension ExploreViewController: MainDelegate {
   
    func fetchedUsers(users: [User]) {
        reloadData()
    }
}
