//
//  DetailPresenter.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/9/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol DetailPresenterInterface {
    func getImages(image: String)
}

class DetailPresenter: DetailPresenterInterface {
    
    weak var view: DetailViewControllerInterface?
    
    init (view: DetailViewControllerInterface) {
        self.view = view
    }
    
    func getImages(image: String) {
        view?.imageUrl = image
    }
}
