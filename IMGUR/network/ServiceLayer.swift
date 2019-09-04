//
//  ServiceLayer.swift
//  IMGUR
//
//  Created by specktro on 9/3/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation

class ServiceLayer {
    class func request<T: Codable>(router: ImageRouter, completion: @escaping (Result<[String: [T]], Error>) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        guard let url = components.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
                debugPrint(error!.localizedDescription)
                completion(.failure(error!))
                return
            }
            
            guard response != nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            let decoder = JSONDecoder()
            let responseObject = try! decoder.decode([String: [T]].self, from: data)
            completion(.success(responseObject))
        }
        
        task.resume()
    }
}
