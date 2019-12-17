//
// Created by Tymur Mustafaiev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

// MARK: - Reusable
extension UITableView {
    func dequeueReusableCell(for indexPath: IndexPath, with model: CellViewAnyModelType) -> UITableViewCell {
        let cellIdentifier = String(describing: type(of: model).cellClass())
        let cell = dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        model.setupDefault(on: cell)
        return cell
    }
}

// MARK: - Cell Registration
extension UITableView {
    func registerNib(for cellClass: UITableViewCell.Type) {
        register(cellClass.nib, forCellReuseIdentifier: cellClass.identifier)
    }
}
