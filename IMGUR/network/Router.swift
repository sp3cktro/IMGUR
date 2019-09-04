//
//  Router.swift
//  IMGUR
//
//  Created by specktro on 9/1/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation

enum ImageRouter {
    case getImages
    
    var scheme: String {
        return "https"
    }
    
    var host: String {
        switch self {
        case .getImages:
            return "pixabay.com"
        }
    }
    
    var path: String {
        return "/api"
    }
    
    var parameters: [URLQueryItem] {
        let accessToken = "13435762-8cdfa77ad675450cea0066f89"
        
        switch self {
        case .getImages:
            return [URLQueryItem(name: "key", value: accessToken),
            URLQueryItem(name: "q", value: "Scarlett Johansson"),
            URLQueryItem(name: "per_page", value: "2")]
        }
    }
    
    var method: String {
        switch self {
        case .getImages:
            return "GET"
        }
    }
}
