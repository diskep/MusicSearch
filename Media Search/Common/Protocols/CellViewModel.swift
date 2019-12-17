//
// Created by Tymur Mustafaiev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

protocol CellViewAnyModelType {
    static func cellClass() -> UIView.Type
    func setupDefault(on cell: UIView)
}

protocol CellViewModelType: CellViewAnyModelType {
    associatedtype CellClass: UIView
    func setup(on cell: CellClass)
}

extension CellViewModelType {
    static func cellClass() -> UIView.Type {
        Self.CellClass.self
    }

    func setupDefault(on cell: UIView) {
        guard let cell = cell as? Self.CellClass else {
            fatalError()
        }

        setup(on: cell)
    }
}