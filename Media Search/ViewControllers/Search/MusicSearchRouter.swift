//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

final class MusicSearchViewRouter: NSObject {
    private weak var viewController: UIViewController?

    init(viewController: UIViewController) {
        self.viewController = viewController
    }
}

extension MusicSearchViewRouter: MusicSearchViewRouting {
    func show(image: UIImage) {
        let storyboard = UIStoryboard(name: "TrackImage", bundle: Bundle.main)
        guard let trackImageViewController = storyboard.instantiateInitialViewController() as? TrackImageViewController,
                let transitionAnimator = viewController as? UIViewControllerTransitioningDelegate else {
            fatalError("Expected to have TrackImageViewOutput as initial view controller of TrackImage.storyboard")
        }
        let router = TrackImageRouter(viewController: trackImageViewController)
        let presenter = TrackImagePresenter(image: image, router: router)
        trackImageViewController.output = presenter
        presenter.input = trackImageViewController
        trackImageViewController.transitioningDelegate = transitionAnimator
        trackImageViewController.modalPresentationStyle = .custom
        DispatchQueue.main.async { [weak self] in
            // I had to add this workaround. By some reasons present function works with delay in some cases
            self?.viewController?.present(trackImageViewController, animated: true)
        }
    }
}
