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
    private lazy var emptyResultsView: UIView? = {
        let nib = UINib(nibName: "EmptyResultsView", bundle: Bundle.main)
        let view = nib.instantiate(withOwner: nil, options: nil).first as? UIView
        return view
    }()
    
    private var dataSource: [Track] = [] {
        didSet {
            tableView.reloadData()
        }
    }

    var output: MusicSearchViewOutput?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    // MARK: - IBActions
    @IBAction func didChangeSource(_ sender: Any) {
        output?.didChangeProvider(index: segmentedControl.selectedSegmentIndex)
    }
}

// MARK: - Privates
private extension MusicSearchViewController {
    func setupUI() {
        registerCells()
    }

    func registerCells() {
        tableView.registerNib(for: MusicTableViewCell.self)
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
        dataSource.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let model = dataSource[indexPath.row]
        return tableView.dequeueReusableCell(for: indexPath, with: model)
    }
}

// MARK: - UISearchBarDelegate
extension MusicSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        output?.didTapSearch(with: searchBar.text ?? "")
    }
}

// MARK: - MusicSearchInput
extension MusicSearchViewController: MusicSearchViewInput {
    func update(state: ViewState<Track>) {
        tableView.backgroundView = nil
        switch state {
        case .loading:
            break
        case .data(let rows):
            dataSource = rows
            tableView.backgroundView = rows.isEmpty ? emptyResultsView : nil
        case .error(let message):
            print(message) // Show error view in future
        }
    }
}
