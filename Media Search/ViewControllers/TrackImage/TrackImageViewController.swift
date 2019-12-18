//
//  TrackImageViewController.swift
//  Media Search
//
//  Created by Timur Mustafaev on 18.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

final class TrackImageViewController: UIViewController {
    @IBOutlet private var imageView: UIImageView!
    var output: TrackImageViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        output?.didAppear()
        addTapGesture()
    }

    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        imageView.addGestureRecognizer(tapGesture)
    }

    @objc func didTapImage() {
        output?.didTapImage()
    }
}

// MARK: - TrackImageViewInput
extension TrackImageViewController: TrackImageViewInput {
    func update(image: UIImage) {
        imageView.image = image
    }
}