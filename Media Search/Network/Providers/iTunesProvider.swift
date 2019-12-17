//
//  iTunesProvider.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

enum iTunesProvider: Provider {
    case tracks(query: String)
    
    var baseUrl: URL {
        URL(string: "https://itunes.apple.com/search")!
    }
    
    var params: [NetworkParam] {
        switch self {
        case .tracks(let query):
            return [NetworkParam(name: "term", value: query), NetworkParam(name: "media", value: "music")]
        }
    }
}
