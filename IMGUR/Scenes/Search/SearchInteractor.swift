//
//  SearchInteractor.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/2/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol SearchBusinessLogic {
    var keyword: String { get set }
    func getKeyword(request: SearchLogicModel.Request)
}

protocol SearchDataStore {
    var keyword: String { get set }
}

class SearchInteractor: SearchBusinessLogic, SearchDataStore {
    
    var keyword: String = ""
    var presenter: SearchPresentationLogic?
    
    init(presenter: SearchPresentationLogic) {
        self.presenter = presenter
    }
    
    func getKeyword(request: SearchLogicModel.Request) {
            keyword = request.keyword
            let response = SearchLogicModel.Response()
            presenter?.presentTellItemsTable(response: response)
    }
}
