//
//  iTunesTrack.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

struct iTunesTrack {
    let artistName: String
    let trackName: String
    let artworkUrl: String
}

// MARK: - Decodable
extension iTunesTrack: Decodable {
    private enum CodingKeys: String, CodingKey {
        case artistName, trackName
        case artworkUrl = "artworkUrl100"
    }
}
