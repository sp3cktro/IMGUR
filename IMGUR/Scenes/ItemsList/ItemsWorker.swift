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
    func fetchItems(completionHandler: @escaping (Result<ItemsLogicModel.Response.Pixabay,FetchError>) -> ()) {
        let jsonDecoder = JSONDecoder()
        guard let url = Bundle.main.url(forResource: "default", withExtension: "json"), let data = try? Data(contentsOf: url) else {
            completionHandler(.failure(.badURL))
            return
        }
        guard let decodedJSON = try? jsonDecoder.decode(ItemsLogicModel.Response.Pixabay.self, from: data) else {
            completionHandler(.failure(.badDecoded))
            return
        }
        completionHandler(.success(decodedJSON))
    }
}
