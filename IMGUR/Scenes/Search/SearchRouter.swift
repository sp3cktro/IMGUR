//
//  SearchRouter.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/2/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol SearchRoutingLogic {
    func routeToItemsListSearchButton()
    func routeToItemsListCancelButton()
    
}

protocol SearchDataPassing {
    var dataStore: SearchDataStore? { get }
}

class SearchRouter: SearchRoutingLogic, SearchDataPassing{
    func routeToItemsListCancelButton() {
        guard let navigation = viewController?.presentingViewController as? UINavigationController, let destinationVC = navigation.viewControllers.first as? ItemsTableViewController else {
            return
        }
        destinationVC.router?.dismissPresent()
    }
    
    
    var dataStore: SearchDataStore?
    weak var viewController: SearchPopUpViewController?
    
    init(viewController: SearchPopUpViewController, dataStore: SearchDataStore) {
        self.dataStore = dataStore
        self.viewController = viewController
    }
    
    func routeToItemsListSearchButton() {

        guard let navigation = viewController?.presentingViewController as? UINavigationController, let destinationVC = navigation.viewControllers.first as? ItemsTableViewController else {
            return
        }
        
        guard var destinationDS = destinationVC.router?.dataStore else {
            fatalError()
        }
        guard let dataStoreSource = dataStore else {
            return
        }
        passDataToListItems(source: dataStoreSource, destination: &destinationDS)
        destinationVC.router?.dismissPresent()
    }
    
    func passDataToListItems(source: SearchDataStore, destination: inout ItemDataStore) {
        destination.keyword = source.keyword
    }
}
