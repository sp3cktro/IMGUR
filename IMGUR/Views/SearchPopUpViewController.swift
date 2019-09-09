//
//  SearchPopUpViewController.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 8/29/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol SearchPopUpViewControllerInterface {
    func passKeywordToItemsList(keyword: String)
}

final class SearchPopUpViewController: UIViewController {
    
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
        
        keywordTextField.accessibilityIdentifier = "search_keyword_text_field"
        searchButton.accessibilityIdentifier = "search_search_button"
        cancelButton.accessibilityIdentifier = "search_cancel_button"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction private func cancelAction(_ sender: Any) {
        guard let navigation = self.presentingViewController as? UINavigationController, let destinationVC = navigation.viewControllers.first as? ItemsTableViewController else {
            return
        }
        destinationVC.dismissVC()
    }
    
    @IBAction private func searchAction(_ sender: Any) {
        keywordIsEmpty()
    }
    
    func passKeywordToItemsList(keyword: String) {
        guard let navigation = self.presentingViewController as? UINavigationController, let destinationVC = navigation.viewControllers.first as? ItemsTableViewController else {
            return
        }
        
        destinationVC.presenter?.getItems(keyword: keyword)
    }
    
    func keywordIsEmpty() {
        guard let keyword = keywordTextField.text else {
            return
        }
        let keywordWithoutWhiteSpaces = keyword.trimmingCharacters(in: .whitespaces).isEmpty
        
        if !keywordWithoutWhiteSpaces {
            passKeywordToItemsList(keyword: keyword)
        } else {
            keywordTextField.placeholder = "Your search is empty"
        }
    }
}
