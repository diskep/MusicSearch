//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation
@testable import Media_Search

final class NetworkClientMock: NetworkClientType {
    func execute<Request: Provider, T: Decodable>(request: Request, with type: T.Type, completionHandler: @escaping (Result<T, Error>) -> ()) {
        guard let provider = request as? TestableProvider else {
            fatalError("Cannot perform testing for this request \(request)")
        }
        let response = provider.stubData
        let jsonDecoder = JSONDecoder()
        do {
            let decodedResponse = try jsonDecoder.decode(type, from: response)
            completionHandler(.success(decodedResponse))
        } catch let error {
            completionHandler(.failure(error))
        }
    }
}