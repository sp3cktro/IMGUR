//
//  FetchError.swift
//  IMGUR
//
//  Created by Jordy Xavier Pazaran Reyes on 9/2/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation

enum FetchError: Error {
    case badURL
    case badDecoded
    case networkError
    case unknown
}
