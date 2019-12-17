//
// Created by Tymur Mustafaiev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

protocol Track {
    var artistName: String { get }
    var trackName: String { get }
    var imageUrl: URL { get }
}