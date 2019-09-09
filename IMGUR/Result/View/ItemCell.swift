//
//  ItemCell.swift
//  IMGUR
//
//  Created by Fernando De La Rosa Salas on 8/27/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    @IBOutlet weak var itemImage: UIImageView?
    @IBOutlet weak var itemTitle: UILabel?
    @IBOutlet weak var userName: UILabel?
    
    var viewModel: Hit? {
        didSet {
            itemTitle?.text = viewModel?.tags
            userName?.text = viewModel?.user
            itemImage?.load(from: viewModel?.largeImageURL)
        }
    }
}
