//
// Created by Tymur Mustafaiev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

protocol ReusableCell {
    static var identifier: String { get }
    static var nib: UINib { get }
}