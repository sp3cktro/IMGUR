//
//  DetailViewController.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, Storyboarded {
    
    @IBOutlet weak var imageView: BoundImageView!
    
    var viewModel: DetailViewModelProtocol?

    override func viewDidLoad() {
        navigationController?.isNavigationBarHidden = false
        super.viewDidLoad()
        guard let image = viewModel?.image else { return }
        imageView.bind(to: image)
        viewModel?.image.value = viewModel?.image.value
    }
    
    func setViewModel(viewModel: DetailViewModelProtocol? = DetailViewModel()) {
        self.viewModel = viewModel
    }
    
    func setImage(from urlString: String?) {
        viewModel?.setImage(from: urlString)
    }
}
