//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation
@testable import Media_Search

extension LastFmSearchResponse {
    static func stub(query: String) -> LastFmSearchResponse {
        let image = LastFmTrackImage(url: URL(string: "https://google.com")!, size: .extralarge)
        let track = LastFmTrack(artistName: query, trackName: query, images: [image])
        let trackMatches = LastFmSearchResponse.Trackmatches(track: [track])
        let results = LastFmSearchResponse.Results(trackmatches: trackMatches)
        return LastFmSearchResponse(results: results)
    }
}