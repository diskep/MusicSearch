//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

final class TrackImagePresenter {
    private let image: UIImage
    weak var input: TrackImageViewInput?
    private let router: TrackImageViewRouting

    init(image: UIImage, router: TrackImageViewRouting) {
        self.image = image
        self.router = router
    }
}

// MARK: - TrackImageViewOutput
extension TrackImagePresenter: TrackImageViewOutput {
    func didAppear() {
        input?.update(image: image)
    }

    func didTapImage() {
        router.dismiss()
    }
}