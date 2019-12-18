//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation
@testable import Media_Search

extension iTunesSearchResponse {
    static func stub(query: String) -> iTunesSearchResponse {
        let track = iTunesTrack(artistName: query, trackName: query, artworkUrl: URL(string: "https://google.com")!)
        return iTunesSearchResponse(resultCount: 1, results: [track])
    }
}
