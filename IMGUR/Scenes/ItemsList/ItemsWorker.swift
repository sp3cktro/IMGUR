//
//  SearchWorker.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/2/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation

class ItemsWorker {
    
    //MARK: - Class Methods
    func getImages(for keyword: String, completionHandler: @escaping (Result<ItemsLogicModel.Response.Pixabay, Error>) -> ()) {
        ServiceLayer.request(router: ImageRouter.getImages(keyword)) { (result: Result<ItemsLogicModel.Response.Pixabay, Error>) in
            switch result {
            case .success(let pixabay):
                completionHandler(.success(pixabay))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
