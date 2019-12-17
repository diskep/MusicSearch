//
// Created by Tymur Mustafaiev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

final class MusicSearchPresenter {
    private let networkClient: NetworkClientType
    private var selectedProvider: MusicProviderType = .iTunes
    weak var input: MusicSearchViewInput?

    init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }
}

// MARK: - Privates
private extension MusicSearchPresenter {
    func iTunesSearch(query: String) {
        networkClient.execute(request: iTunesProvider.tracks(query: query), with: iTunesSearchResponse.self) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error): // TODO: handle errors
                print(error)
            }
        }
    }

    func lastFmSearch(query: String) {
        networkClient.execute(request: LastFmProvider.tracks(query: query), with: LastFmSearchResponse.self) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error): // TODO: handle errors
                print(error)
            }
        }
    }
}

// MARK: - MusicSearchViewOutput
extension MusicSearchPresenter: MusicSearchViewOutput {
    func didChangeProvider(index: Int) {
        guard let provider = MusicProviderType(rawValue: index) else {
            assertionFailure("Unknown provider index")
            return
        }
        selectedProvider = provider
    }

    func didTapSearch(with query: String) {
        switch selectedProvider {
        case .iTunes: iTunesSearch(query: query)
        case .lastFm: lastFmSearch(query: query)
        }
    }
}