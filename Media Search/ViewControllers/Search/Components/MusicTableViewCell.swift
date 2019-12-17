//
//  MusicTableViewCell.swift
//  Media Search
//
//  Created by Tymur Mustafaiev on 17.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

final class MusicTableViewCell: UITableViewCell {
    @IBOutlet private(set) var iconView: LoadingImageView! {
        didSet {
            iconView.layer.cornerRadius = 8
        }
    }
    @IBOutlet private(set) var artistLabel: UILabel!
    @IBOutlet private(set) var trackLabel: UILabel!
}
