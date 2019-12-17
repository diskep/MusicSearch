//
// Created by Tymur Mustafaiev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

struct MusicTableViewCellModel: Track {
    let trackName: String
    let artistName: String
    let imageUrl: URL
}

// MARK: - CellViewModelType
extension MusicTableViewCellModel: CellViewModelType {
    func setup(on cell: MusicTableViewCell) {
        cell.artistLabel.text = artistName
        cell.trackLabel.text = trackName
    }
}