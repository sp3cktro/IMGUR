//
//  ServiceLayer.swift
//  IMGUR
//
//  Created by specktro on 9/3/19.
//  Copyright © 2019 specktro. All rights reserved.
//

import Foundation

extension URLSession: URLSessionProtocol {}

class ServiceLayer {
    class func request<T: Codable>(session: URLSessionProtocol = URLSession(configuration: .default), router: ImageRouter, completion: @escaping (Result<T, Error>) -> ()) {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        
        guard let url = components.url else {
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            guard error == nil else {
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
            
            do {
                let responseObject = try decoder.decode(T.self, from: data)
                completion(.success(responseObject))
            }
            catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
