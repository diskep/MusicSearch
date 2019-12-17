//
// Created by Tymur Mustafaiev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

final class MusicSearchPresenter {
    private let networkClient: NetworkClientType
    private var selectedProvider: MusicProviderType = .iTunes
    private var models: [MusicProviderType: [Track]] = [:]
    weak var input: MusicSearchViewInput?

    init(networkClient: NetworkClientType) {
        self.networkClient = networkClient
    }
}

// MARK: - Privates
private extension MusicSearchPresenter {
    func iTunesSearch(query: String) {
        networkClient.execute(request: iTunesProvider.tracks(query: query), with: iTunesSearchResponse.self) { [weak self] result in
            switch result {
            case .success(let response):
                let tracks = response.results.map { MusicTableViewCellModel(trackName: $0.trackName, artistName: $0.artistName, imageUrl: $0.artworkUrl) }
                self?.didReceive(tracks: tracks, for: .iTunes)
            case .failure(let error): // TODO: handle errors
                print(error)
            }
        }
    }

    func lastFmSearch(query: String) {
        networkClient.execute(request: LastFmProvider.tracks(query: query), with: LastFmSearchResponse.self) { [weak self] result in
            switch result {
            case .success(let response):
                let tracks = response.results.compactMap { item -> MusicTableViewCellModel? in
                    guard let image = item.images.last else { return nil }
                    return MusicTableViewCellModel(trackName: item.trackName, artistName: item.artistName, imageUrl: image.url)
                }
                self?.didReceive(tracks: tracks, for: .lastFm)
            case .failure(let error): // TODO: handle errors
                print(error)
            }
        }
    }

    func didReceive(tracks: [MusicTableViewCellModel], for providerType: MusicProviderType) {
        models[providerType] = tracks
        if selectedProvider == providerType {
            input?.update(dataSource: tracks)
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