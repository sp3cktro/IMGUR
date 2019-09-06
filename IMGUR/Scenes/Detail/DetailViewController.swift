//
//  DetailViewController.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol DetailDisplayLogic: class {
    func displayImage(imageUrl: DetailLogicModel.Response)
}

class DetailViewController: UIViewController, DetailDisplayLogic {
    
    var router: (DetailRoutingLogic & DetailDataPassing)?
    var interactor: DetailBusinesslogic?
    let request = DetailLogicModel.Request()
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = false
        super.viewDidLoad()
        showImage(request: request)
        navigationItem.leftBarButtonItem?.accessibilityIdentifier = "detail_back_button"
    }
    //Setup Scenes
    func setupViewController(interactor: DetailBusinesslogic, router: (DetailRoutingLogic & DetailDataPassing)) {
        self.interactor = interactor
        self.router = router
    }
    
    private func setupScene() {
        let viewController = self
        let presenter = DetailPresenter(viewController: viewController)
        let interactor = DetailInteractor(presenter: presenter)
        let router = DetailRouter(dataStore: interactor, viewController: viewController)
        setupViewController(interactor: interactor, router: router)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupScene()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        setupScene()
    }
    
    func displayImage(imageUrl: DetailLogicModel.Response) {
        guard let url = URL(string: imageUrl.largeImageURL) else {
            return
        }
        imageView.load(from: url)
    }
    
    func showImage(request: DetailLogicModel.Request) {
        interactor?.showImage(request: request)
    }
}
