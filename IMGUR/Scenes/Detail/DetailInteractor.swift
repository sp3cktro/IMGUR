//
//  DetailInteractor.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/3/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation

protocol DetailBusinesslogic {
    func showImage(request: DetailLogicModel.Request)
}

protocol DetailDataStore {
    var urlImage: String { get set }
}

class DetailInteractor: DetailBusinesslogic, DetailDataStore {
    
    var urlImage: String = ""
    var presenter: DetailPresentationLogic?
    
    init(presenter: DetailPresentationLogic) {
        self.presenter = presenter
    }
    
    func showImage(request: DetailLogicModel.Request) {
        let response = DetailLogicModel.Response(largeImageURL: urlImage)
        presenter?.presentImage(response: response)
    }
    
}
