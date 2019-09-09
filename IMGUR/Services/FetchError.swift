//
//  FetchError.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/8/19.
//  Copyright © 2019 specktro. All rights reserved.
//

enum FetchError: Error {
    case badURL
    case badDecoded
    case networkError
    case unknown
}
