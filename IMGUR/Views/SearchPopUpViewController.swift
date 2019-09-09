//
//  SearchPopUpViewController.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 8/29/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

class SearchPopUpViewController: UIViewController {

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
        
        let blurEffect = UIBlurEffect(style: .regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.frame
        view.insertSubview(blurEffectView, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        guard let navigation = self.presentingViewController as? UINavigationController, let destinationVC = navigation.viewControllers.first as? ItemsTableViewController else {
            return
        }
        destinationVC.dismissVC()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        guard let keyword = keywordTextField.text else {
            return
        }
        passKeywordToItemsList(keyword: keyword)
    }
    
    func passKeywordToItemsList(keyword: String) {
        guard let navigation = self.presentingViewController as? UINavigationController, let destinationVC = navigation.viewControllers.first as? ItemsTableViewController else {
            return
        }
        
        destinationVC.presenter?.getItems(keyword: keyword)
    }
 
}


