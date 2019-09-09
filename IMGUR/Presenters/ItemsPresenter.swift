//
//  ItemsPresenter.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/8/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol ItemsPresenterInterface {
    func getItems(keyword: String)
    func fetchItems(for keyword: String, completionHandler: @escaping (Result<Pixabay, Error>) -> ())
}

final class ItemsPrsenter: ItemsPresenterInterface {
    private weak var view: ItemsViewInterface?
    
    init(view: ItemsViewInterface) {
        self.view = view
    }
    
    func getItems(keyword: String) {
        self.fetchItems(for: keyword) { [weak self] result in
            switch result {
            case .success(let response):
                self?.view?.showItems(response: response)
            case .failure:
                break
            }
        }
    }
    
    func fetchItems(for keyword: String, completionHandler: @escaping (Result<Pixabay, Error>) -> ()) {
        ServiceLayer.request(router: ImageRouter.getImages(keyword)) { (result: Result<Pixabay, Error>) in
            switch result {
            case .success(let pixabay):
                completionHandler(.success(pixabay))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}

