//
// Created by Tymur Mustafaiev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

enum MusicProviderType: Int {
    case iTunes = 0
    case lastFm
}

protocol Track where Self: CellViewAnyModelType {
    var artistName: String { get }
    var trackName: String { get }
    var imageUrl: URL { get }
}

// MARK: - View
protocol MusicSearchViewInput: AnyObject {
    func update(state: ViewState<Track>)
}

// MARK: - Presenter
protocol MusicSearchViewOutput: AnyObject {
    func didChangeProvider(index: Int)
    func didTapSearch(with query: String)
    func didTap(image: UIImage)
}

// MARK: - Router
protocol MusicSearchViewRouting {
    func show(image: UIImage)
}