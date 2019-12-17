//
// Created by Tymur Mustafaiev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

enum MusicProviderType: Int {
    case iTunes = 0
    case lastFm
}

// MARK: - View
protocol MusicSearchViewInput: AnyObject {

}

// MARK: - Presenter
protocol MusicSearchViewOutput: AnyObject {
    func didChangeProvider(index: Int)
    func didTapSearch(with query: String)
}