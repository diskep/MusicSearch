//
//  NetworkContract.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

enum NetworkErrorType: Error {
    case decoding
    case urlEncoding
}

struct NetworkParam {
    let name: String
    let value: String
}

protocol NetworkClientType {
    func execute<Request: Provider, T: Decodable>(request: Request, with type: T.Type, completionHandler: @escaping (Result<T, Error>) -> Void)
}
