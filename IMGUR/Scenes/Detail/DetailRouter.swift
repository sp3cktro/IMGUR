//
//  DetailRouter.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/3/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation

protocol DetailRoutingLogic {
}

protocol DetailDataPassing {
    var dataStore: DetailDataStore? { get }
}

class DetailRouter: DetailRoutingLogic, DetailDataPassing {
    var dataStore: DetailDataStore?
    weak var viewController: DetailViewController?
    
    init(dataStore: DetailDataStore, viewController: DetailViewController) {
        self.viewController = viewController
        self.dataStore = dataStore
    }
    
}
