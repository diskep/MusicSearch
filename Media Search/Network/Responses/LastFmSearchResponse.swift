//
//  LastFmSearchResponse.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

struct LastFmSearchResponse: Codable {
    struct Results: Codable {
        let trackmatches: Trackmatches
    }

    struct Trackmatches: Codable {
        let track: [LastFmTrack]
    }

    let results: Results
}
