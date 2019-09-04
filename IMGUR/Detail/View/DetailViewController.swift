//
//  DetailViewController.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, DetailViewControllerProtocol, Storyboarded {
    
    //MARK: - Variables for the architecture
    var presenter: DetailPresenterProtocol?
    
    //MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView?
    
    //MARK: - Class variables
    var imageURL: URL?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let imageURL = imageURL else { return }
        imageView?.load(from: imageURL)
        
        navigationItem.leftBarButtonItem?.accessibilityIdentifier = "detail_back_button"
    }
}
