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
    init(from decoder: Decoder) throws {
        let response = try LastFmRawResponse(from: decoder)
        self.results = response.results.trackmatches.track
    }
}

// I used this structure to unwrap nested objects in Last.fm response.
// MARK: - LastFmRawResponse
fileprivate struct LastFmRawResponse: Decodable {
    struct LastFmTrackMatches: Decodable {
        let track: [LastFmTrack]
    }
    
    struct LastFmResults: Decodable {
        let trackmatches: LastFmTrackMatches
    }
    
    let results: LastFmResults
}
