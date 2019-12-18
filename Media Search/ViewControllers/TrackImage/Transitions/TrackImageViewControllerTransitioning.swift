//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

enum TransitionMode {
    case present
    case dismiss
}

final class TrackImageViewControllerTransitioning: NSObject, UIViewControllerAnimatedTransitioning {
    private let originFrame: CGRect
    private let imageView: UIImageView
    private let transitionMode: TransitionMode

    init(originFrame: CGRect, imageView: UIImageView, transitionMode: TransitionMode) {
        self.originFrame = originFrame
        self.imageView = imageView
        self.transitionMode = transitionMode
    }

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toView = transitionContext.viewController(forKey: .to),
              let fromView = transitionContext.viewController(forKey: .from) else { return }
        switch transitionMode {
        case .present:
            present(toView: toView, fromView: fromView, transitionContext: transitionContext)
        case .dismiss:
            dismiss(toView: fromView, fromView: toView, transitionContext: transitionContext)
        }
    }

    private func present(toView: UIViewController, fromView: UIViewController, transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let targetFrame = transitionContext.finalFrame(for: toView)
        let duration = transitionDuration(using: transitionContext)
        containerView.addSubview(toView.view)

        let imageViewCopy = copyImageView()

        containerView.addSubview(imageViewCopy)
        toView.view.alpha = 0

        imageView.isHidden = true

        UIView.animate(withDuration: duration, animations: {
            toView.view.alpha = 1
            imageViewCopy.frame = targetFrame
        }, completion: { completed in
            imageViewCopy.removeFromSuperview()
            transitionContext.completeTransition(completed)
        })
    }

    private func dismiss(toView: UIViewController, fromView: UIViewController, transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        let targetFrame = transitionContext.initialFrame(for: toView)
        let duration = transitionDuration(using: transitionContext)
        containerView.addSubview(toView.view)

        let imageViewCopy = copyImageView()
        imageViewCopy.frame = targetFrame
        containerView.addSubview(imageViewCopy)
        toView.view.frame = targetFrame
        toView.view.alpha = 1

        UIView.animate(withDuration: duration, animations: { [unowned self] in
            toView.view.alpha = 0
            imageViewCopy.frame = self.originFrame
        }, completion: { [unowned self] completed in
            imageViewCopy.removeFromSuperview()
            self.imageView.isHidden = false
            transitionContext.completeTransition(completed)
        })
    }

    private func copyImageView() -> UIImageView {
        let imageView = UIImageView(frame: originFrame)
        imageView.image = self.imageView.image
        imageView.contentMode = self.imageView.contentMode
        imageView.layer.cornerRadius = self.imageView.layer.cornerRadius
        imageView.backgroundColor = .clear
        return imageView
    }
}