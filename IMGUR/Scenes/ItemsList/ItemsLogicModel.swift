//
//  ItemsLogicModel.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/4/19.
//  Copyright © 2019 specktro. All rights reserved.
//

struct ItemsLogicModel {
    struct Request {
    }
    struct Response {
        // MARK: - Pixabay
        struct Pixabay: Codable {
            let totalHits: Int
            let hits: [Hit]
        }
        
        // MARK: - Hit
        struct Hit: Codable {
            let largeImageURL: String
            let tags: String
            let user: String
            let userImageURL: String
            let previewURL: String
        }
    }
    
    struct ViewModel {
    }
}
