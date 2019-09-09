//
//  SearchPopUpViewController.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 8/29/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

class SearchPopUpViewController: UIViewController {
    
    var viewModel: SearchViewModelProtocol?
    
    //MARK: - Outlets
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var keywordTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let searchContainer = searchView
        searchContainer?.layer.cornerRadius = 6
    
        //Navigation controller configuration
        navigationController?.isNavigationBarHidden = true
        
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = UIScreen.main.bounds
        view.insertSubview(blurEffectView, at: 0)
        
        guard let parentNavigationController = presentingViewController as? UINavigationController, let parentViewController = parentNavigationController.viewControllers.first as? ItemsTableViewController else { return }
        
        viewModel = SearchViewModel(parentViewModel:  parentViewController.viewModel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func searchAction(_ sender: Any) {
        guard let entry = keywordTextField.text else { return }
        viewModel?.search(entry)
        dismiss(animated: true, completion: nil)
    }
}
