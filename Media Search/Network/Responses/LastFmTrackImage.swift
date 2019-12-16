//
//  LastFmTrackImage.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

enum LastFmImageSize: String, Decodable {
    case small, medium, large, extraLarge
}

struct LastFmTrackImage {
    let url: URL
    let size: LastFmImageSize
}

// MARK: - LastFmTrackImage: Decodable
extension LastFmTrackImage: Decodable {
    private enum CodingKeys: String, CodingKey {
        case url = "#text"
        case size
    }
}
