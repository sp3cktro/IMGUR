//
//  ItemsInteractor.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/2/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol ItemBusinesslogic {
    func showItems(request: ItemsLogicModel.Request)
}

protocol ItemDataStore {
    var keyword: String { get set }
    var item: ItemsLogicModel.Response.Pixabay { get set }
}

class ItemsInteractor: ItemBusinesslogic, ItemDataStore {
  
    var item: ItemsLogicModel.Response.Pixabay = ItemsLogicModel.Response.Pixabay(totalHits: 0, hits: [])
    var keyword: String = ""
    var worker = ItemsWorker()
    var presenter: ItemPresentationLogic?
    
    init(presenter: ItemPresentationLogic) {
        self.presenter = presenter
    }
    
    func showItems(request: ItemsLogicModel.Request) {
        let keywordInteractor = keyword
        worker.fetchItems { [weak self] result in
            switch result {
            case .success(let model):
                self?.item = model
                guard let response = self?.item else {
                    return
                }
                self?.presenter?.presentItems(response: response)
            case .failure:
                break
            }
           print(keywordInteractor)
        }
        
       
    }
}
