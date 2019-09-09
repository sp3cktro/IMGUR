//
//  ItemsPresenter.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/3/19.
//  Copyright © 2019 specktro. All rights reserved.
//

protocol ItemPresentationLogic {
    func presentItems(response: ItemsLogicModel.Response.Pixabay)
}

class ItemsPresenter: ItemPresentationLogic {
    
    weak var viewController: ItemDisplayLogic?
    
    init(viewController: ItemDisplayLogic) {
        self.viewController = viewController
    }
    
    func presentItems(response: ItemsLogicModel.Response.Pixabay) {
        let items = response
        viewController?.displayItems(itemsFetched: items)
    }
    
}
