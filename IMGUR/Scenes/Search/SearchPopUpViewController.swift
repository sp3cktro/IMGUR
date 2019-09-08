//
//  SearchPopUpViewController.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 8/29/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol SearchDisplayLogcic: class {
    func displayKeyword(model: SearchLogicModel.ViewModel)
}

final class SearchPopUpViewController: UIViewController, SearchDisplayLogcic {

    //MARK: - Outlets
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var keywordTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    //MARK: - Properties
    var router: (SearchRoutingLogic & SearchDataPassing)?
    var interactor: SearchBusinessLogic?
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScene()
        
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
    
    //Setup Scenes
    func setupViewController(interactor: SearchBusinessLogic, router: (SearchRoutingLogic & SearchDataPassing)) {
        self.interactor = interactor
        self.router = router
    }
    
    private func setupScene() {
        let viewController = self
        let presenter = SearchPresenter(viewController: viewController)
        let interactor = SearchInteractor(presenter: presenter)
        let router = SearchRouter(viewController: viewController, dataStore: interactor)
        setupViewController(interactor: interactor, router: router)
    }
    
    //MARK: - Methods
    @IBAction func cancelAction(_ sender: Any) {
        router?.routeToItemsListCancelButton()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        guard let keyword = keywordTextField.text else {
            return
        }
        showKeyword(keywordNeedIt: keyword)
    }
 
    func showKeyword (keywordNeedIt: String) {
        
        let keywordWithoutWhiteSpaces = keywordNeedIt.trimmingCharacters(in: .whitespaces).isEmpty
        
        if !keywordWithoutWhiteSpaces {
            let request = SearchLogicModel.Request(keyword: keywordNeedIt )
            interactor?.getKeyword(request: request)
        } else {
            
        }
    }
    
    func displayKeyword(model: SearchLogicModel.ViewModel) {
        router?.routeToItemsListSearchButton()
    }
}


