//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit
@testable import Media_Search

final class MusicSearchViewControllerMock: MusicSearchViewInput {
    var stateHandler: ((ViewState<Track>) -> Void)?

    func update(state: ViewState<Track>) {
        stateHandler?(state)
    }
}
