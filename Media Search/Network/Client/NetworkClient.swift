//
//  NetworkClient.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

final class NetworkClient: NetworkClientType {
    private let urlBuilder: URLBuilderType
    
    init(urlBuilder: URLBuilderType) {
        self.urlBuilder = urlBuilder
    }
    
    func execute<Request, T>(request: Request, with type: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void) where Request : Provider, T : Decodable {
        DispatchQueue.global(qos: .default).async { [weak self] in
            guard let self = self else { return }
            
            let url = self.urlBuilder.build(from: request)
            let task = URLSession.shared.dataTask(with: url) { data, response, error in
                DispatchQueue.main.async {
                    if let error = error {
                        completionHandler(.failure(error))
                    } else if let data = data {
                        let decoder = JSONDecoder()
                        do {
                            let responseModel = try decoder.decode(type, from: data)
                            completionHandler(.success(responseModel))
                        } catch let error {
                            print("Error due to decoding = \(error)")
                            completionHandler(.failure(NetworkErrorType.decoding))
                        }
                    }
                }
            }
            task.resume()
        }
        
    }
    
}
