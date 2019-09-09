//
//  ItemsPresenter.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/8/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

protocol ItemsPresenterInterface {
    func getKeyWord(keyword: String)
    func getImages(model: Pixabay)
}

class ItemsPrsenter: ItemsPresenterInterface {
    weak var view: ItemsViewInterface?
    var model: Pixabay
    
    init(view: ItemsViewInterface) {
        self.view = view
    }
    
    func getKeyWord(keyword: String) {
        <#code#>
    }
    
    func getImages(model: Pixabay) {
        <#code#>
    }
}

