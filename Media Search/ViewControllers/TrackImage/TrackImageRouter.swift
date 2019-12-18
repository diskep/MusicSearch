//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

final class TrackImageRouter: TrackImageViewRouting {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }

    func dismiss() {
        viewController?.dismiss(animated: true)
    }
}