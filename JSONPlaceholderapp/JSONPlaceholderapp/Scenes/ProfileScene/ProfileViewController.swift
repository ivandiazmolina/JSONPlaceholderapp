//
//  ProfileViewController.swift
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

protocol ProfileDisplayLogic: class {
    func setupView(viewModel: Profile.Models.ViewModel)
    func displayLoading(_ show: Bool)
    func displayAlbums()
    func displayTodos()
    func displayPhotos()
}

class ProfileViewController: BaseViewController, ProfileDisplayLogic {
    
    var interactor: ProfileBusinessLogic?
    var router: (NSObjectProtocol & ProfileRoutingLogic & ProfileDataPassing)?
    
    // MARK: LETS AND VARS
    private let CELL_SIZE: CGFloat = 100
    
    // MARK: IBOutlets
    @IBOutlet weak var avatarImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var albumsTableView: UITableView!
    @IBOutlet weak var todosTableView: UITableView!
    
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
        let interactor = ProfileInteractor()
        let presenter = ProfilePresenter()
        let router = ProfileRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    @IBAction func onTapAlbums(_ sender: UIButton) {
        print("onTapAlbums")
        interactor?.loadData(request: Profile.Models.Request(event: .onTouchAlbums))
    }
    
    @IBAction func onTapTodos(_ sender: UIButton) {
        print("onTapTodos")
        interactor?.loadData(request: Profile.Models.Request(event: .onTouchTodos))
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
    
    func setupView(viewModel: Profile.Models.ViewModel) {
        
        // NavigationController
        self.navigationItem.title = "profile".localized;
        
        // Album TableView
        albumsTableView.register(AlbumTableViewCell.cellIdentifier)
        albumsTableView.delegate = self
        albumsTableView.dataSource = self
        
        // Todos TableView
        todosTableView.register(TodoTableViewCell.cellIdentifier)
        todosTableView.delegate = self
        todosTableView.dataSource = self
        
        ui { [weak self] in
            self?.nameLabel.text = viewModel.name
            self?.usernameLabel.text = viewModel.username
            
            if let avatar = viewModel.avatar {
                self?.avatarImageView.image = avatar
            }
        }
    }
    
    func displayLoading(_ show: Bool) {
        show ? showLoading() : dismissLoading()
    }
    
    func displayAlbums() {
        
        ui { [weak self] in
            self?.todosTableView.isHidden = true
            self?.albumsTableView.isHidden = false
        }
    }
    
    func displayTodos() {
        ui { [weak self] in
            self?.albumsTableView.isHidden = true
            self?.todosTableView.isHidden = false
        }
    }
    
    func displayPhotos() {
        router?.routeToPhotos(segue: nil)
    }
    
    // MARK: Private methods
    
    private func setupAlbumTableView(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumTableViewCell.cellIdentifier) as? AlbumTableViewCell else {
            print("Error to cast TableViewCell to AlbumTableViewCell")
            return UITableViewCell()
        }
        
        guard let data = interactor?.getAlbumCellFor(index: indexPath.row) else {
            print("Error to get AlbumTableViewCell from index")
            return UITableViewCell()
        }
        
        cell.updateUI(model: data)
        
        return cell
    }
    
    private func setupTodoTableView(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TodoTableViewCell.cellIdentifier) as? TodoTableViewCell else {
            print("Error to cast TableViewCell to TodoTableViewCell")
            return UITableViewCell()
        }
        
        guard let data = interactor?.getTodoCellFor(index: indexPath.row) else {
            print("Error to get TodoTableViewCell from index")
            return UITableViewCell()
        }
        
        cell.updateUI(model: data)
        
        return cell
    }
}

// MARK: UITableviewDelegate and UITableViewDataSource

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case albumsTableView:
            return interactor?.getAlbumsCount() ?? 0
        default:
            return interactor?.getTodosCount() ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
        switch tableView {
        case albumsTableView:
            return setupAlbumTableView(tableView: tableView, indexPath: indexPath)
        default:
            return setupTodoTableView(tableView: tableView, indexPath: indexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CELL_SIZE
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        switch tableView {
        case albumsTableView:
            interactor?.didSelectedAlbumAt(index: indexPath.row)
        default:
            print("Todos are not clickable")
            return
        }
        
    }
}
