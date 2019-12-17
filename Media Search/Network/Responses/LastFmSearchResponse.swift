//
//  LastFmSearchResponse.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

struct LastFmSearchResponse {
    let results: [LastFmTrack]
}

// MARK: - Decodable
extension LastFmSearchResponse: Decodable {
    private enum CodingKeys: String, CodingKey {
        case results
    }

    init(from decoder: Decoder) throws {
        let welcome = try LastFmRawResponse(from: decoder)
        self.results = welcome.results.trackmatches.track
    }
}

// I used this structure to unwrap nested objects in Last.fm response.
// MARK: - LastFmRawResponse
fileprivate struct LastFmRawResponse: Decodable {
    struct Results: Decodable {
        let trackmatches: Trackmatches
    }

    struct Trackmatches: Decodable {
        let track: [LastFmTrack]
    }

    let results: Results
}
