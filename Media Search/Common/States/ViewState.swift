//
// Created by Timur Mustafaev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import Foundation

enum ViewState<T> {
    case loading
    case data(rows: [T])
    case error(message: String)
}