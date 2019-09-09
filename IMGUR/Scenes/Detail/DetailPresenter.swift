//
//  DetailPresenter.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/3/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation

protocol DetailPresentationLogic {
    func presentImage(response: DetailLogicModel.Response)
}

class DetailPresenter: DetailPresentationLogic {
    
     weak var viewController: DetailDisplayLogic?
    
    init(viewController: DetailDisplayLogic) {
        self.viewController = viewController
    }
    
    func presentImage(response: DetailLogicModel.Response) {
        let imageUrl = response
        viewController?.displayImage(imageUrl: imageUrl)
    }
}
