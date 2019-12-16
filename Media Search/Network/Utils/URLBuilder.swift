//
//  URLBuilder.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

final class URLBuilder: URLBuilderType {
    func build(from providerRequest: Provider) -> URL {
        let components = providerRequest.params.map { URLQueryItem(name: $0.name, value: $0.value) }
        var urlComponents = URLComponents(url: providerRequest.baseUrl, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = components
        return urlComponents?.url ?? providerRequest.baseUrl
    }
}
