//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation
@testable import Media_Search

protocol TestableProvider where Self: Provider {
    var stubData: Data { get }
}

extension TestableProvider {
    func stubData<T: Encodable>(from object: T) -> Data {
        do {
            let encoder = JSONEncoder()
            return try encoder.encode(object)
        } catch {
            fatalError("TestableProvider.stubData.error \(error)")
        }
    }
}
