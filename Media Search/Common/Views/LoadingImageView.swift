//
//  LoadingImageView.swift
//  Media Search
//
//  Created by Timur Mustafaev on 17.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

final class LoadingImageView: UIImageView {
    private var loadingUrl: String?

    func loadImage(_ url: URL) {
        image = nil
        loadingUrl = url.absoluteString
        DispatchQueue.global(qos: .background).async {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, _ in
                guard self?.loadingUrl == response?.url?.absoluteString,
                      let data = data else {
                    return
                }
                let image = UIImage(data: data)
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
            task.resume()
        }
    }
}
