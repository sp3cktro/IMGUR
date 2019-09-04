//
//  SearchPopUpViewController.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 8/29/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

class SearchPopUpViewController: UIViewController, Storyboarded {

    //MARK: - Architecture variables
    private var presenter: SearchPresenterProtocol?
    
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
        
        presenter = SearchPresenter(viewController: self)
        
        keywordTextField.accessibilityIdentifier = "search_keyword_text_field"
        searchButton.accessibilityIdentifier = "search_search_button"
        cancelButton.accessibilityIdentifier = "search_cancel_button"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        presenter?.cancelTapped()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        guard let entry = keywordTextField.text else { return }
        presenter?.getImages(for: entry)
    }
 
}

extension SearchPopUpViewController: SearchViewControllerProtocol {
    func dismissSearchViewController() {
        dismiss(animated: true, completion: nil)
    }
}
