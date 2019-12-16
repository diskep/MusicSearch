//
//  LastFmProvider.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

enum LastFmProvider: Provider {
    case tracks(query: String)
    
    var baseUrl: URL {
        URL(string: "http://ws.audioscrobbler.com/2.0/")!
    }
    
    var params: [NetworkParam] {
        switch self {
        case .tracks(let query):
            return [NetworkParam(name: "method", value: "track.search"), NetworkParam(name: "track", value: query)] + requiredParams
        }
    }
    
    private var requiredParams: [NetworkParam] {
        [NetworkParam(name: "api_key", value: Constants.ApiKeys.lastFm.rawValue), NetworkParam(name: "format", value: "json")]
    }
}
