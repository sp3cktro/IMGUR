//
//  SearchPresenter.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/2/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol SearchPresentationLogic {
    func presentTellItemsTable(response: SearchLogicModel.Response)
}

class SearchPresenter: SearchPresentationLogic {
    
    weak var viewController: SearchDisplayLogcic?
    
    init(viewController: SearchDisplayLogcic) {
        self.viewController = viewController
    }
    
    func presentTellItemsTable(response: SearchLogicModel.Response) {
        let viewModel = SearchLogicModel.ViewModel()
        viewController?.displayKeyword(model: viewModel)
    }
}
