//
//  DetailViewController.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol DetailViewControllerInterface: class {
    var imageUrl: String { get set }
}

class DetailViewController: UIViewController, DetailViewControllerInterface {

    //MARK: - Properties
    var presenter: DetailPresenterInterface?
    var imageUrl: String = ""
    //MARK: - Outles
    
    @IBOutlet weak var imageDetail: UIImageView?
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        //MARK: - Prepare image
        guard let url = URL(string: imageUrl) else { return }
        imageDetail?.load(from: url)
        
        navigationController?.isNavigationBarHidden = false
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
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
}
