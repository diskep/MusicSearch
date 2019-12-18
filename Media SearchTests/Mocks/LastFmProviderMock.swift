//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation
@testable import Media_Search

extension LastFmProvider: TestableProvider {
    var stubData: Data {
        switch self {
        case .tracks(let query):
            return stubData(from: LastFmSearchResponse.stub(query: query))
        }
    }
}
