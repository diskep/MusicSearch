//
//  iTunesSearchResponse.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

struct iTunesSearchResponse: Decodable {
    let resultCount: Int
    let results: [iTunesTrack]
}
