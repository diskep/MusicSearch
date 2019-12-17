//
//  MusicSearchViewController.swift
//  Media Search
//
//  Created by Tymur Mustafaiev on 17.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

final class MusicSearchViewController: UIViewController {
    @IBOutlet private var searchBar: UISearchBar!
    @IBOutlet private var tableView: UITableView!
    @IBOutlet private var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    
    @IBAction func didChangeSource(_ sender: Any) {
    }
}

// MARK: - Privates
private extension MusicSearchViewController {
    func setupUI() {
        registerCells()
    }

    func registerCells() {

    }
}

// MARK: - UITableViewDelegate
extension MusicSearchViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}

// MARK: - UITableViewDataSource
extension MusicSearchViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

// MARK: - MusicSearchInput
extension MusicSearchViewController: MusicSearchViewInput {

}