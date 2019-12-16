//
//  LastFmTrack.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

struct LastFmTrack {
    let artistName: String
    let trackName: String
    let images: [LastFmTrackImage]
}

// MARK: - Decodable
extension LastFmTrack: Decodable {
    private enum CodingKeys: String, CodingKey {
        case artistName = "artist"
        case trackName = "track"
        case images = "image"
    }
}
