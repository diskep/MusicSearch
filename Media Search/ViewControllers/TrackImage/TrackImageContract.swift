//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

// MARK: - View
protocol TrackImageViewInput: AnyObject {
    func update(image: UIImage)
}

// MARK: - Presenter
protocol TrackImageViewOutput: AnyObject {
    func didAppear()
    func didTapImage()
}

// MARK: - Router
protocol TrackImageViewRouting {
    func dismiss()
}