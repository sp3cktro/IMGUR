//
//  ItemsRouter.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/2/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol ItemsRoutingLogic {
    func routeToSearchPopUp()
    func routeToDetail(indexPath: Int)
    func dismissPresent()
}

protocol ItemDataPassing {
    var dataStore: ItemDataStore? { get }
}

class ItemRouter: ItemsRoutingLogic, ItemDataPassing {
    
    var dataStore: ItemDataStore?
    weak var viewController: ItemsTableViewController?
    
    init(dataStore: ItemDataStore, viewController: ItemsTableViewController) {
        self.dataStore = dataStore
        self.viewController = viewController
    }
    
    func routeToSearchPopUp() {
        let vc = SearchPopUpViewController(nibName: "SearchPopUpViewController", bundle: nil)
        vc.modalPresentationStyle = .overCurrentContext
        viewController?.present(vc, animated: true)
    }
    
     func routeToDetail(indexPath: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let destinationVC = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController else {
            return
        }
        viewController?.navigationController?.pushViewController(destinationVC, animated: true)
        guard var destinationDS = destinationVC.router?.dataStore else {
            fatalError()
        }
        guard let dataStoreSource = dataStore else {
            return
        }
        passDataToDetail(source: dataStoreSource, destination: &destinationDS, indexPath: indexPath)
        
    }
    
    func dismissPresent() {
        viewController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: Passing data
    private func passDataToDetail(source: ItemDataStore, destination: inout DetailDataStore, indexPath: Int) {
        destination.urlImage = source.item.hits[indexPath].largeImageURL
    }

}
