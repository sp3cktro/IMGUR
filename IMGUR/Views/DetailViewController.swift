//
//  DetailViewController.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol DetailViewControllerInterface: class {
    func showImage(image: String)
}

class DetailViewController: UIViewController, DetailViewControllerInterface {
    //MARK: - Properties
    var presenter: DetailPresenterInterface?
    //MARK: - Outles
    
    @IBOutlet weak var imageDetail: UIImageView?
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationController?.isNavigationBarHidden = false
    }
    
    //MARK: - Setup
    func setupView(presenter: DetailPresenterInterface) {
        self.presenter = presenter
    }
    func setup() {
        let view = self
        let presenter = DetailPresenter(view: view)
        setupView(presenter: presenter)
    }
    //MARK: - Methods
    func showImage(image: String) {
        guard let url = URL(string: image) else {
            return
        }
        print(image)
        imageDetail?.load(from: url)
    }
}
