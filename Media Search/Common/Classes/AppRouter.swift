//
// Created by Timur Mustafaev on 17.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

protocol AppRouterType {
    func showRootScreen()
}

final class AppRouter: AppRouterType {
    private(set) var window: UIWindow

    init(window: UIWindow = UIWindow()) {
        self.window = window
    }

    func showRootScreen() {
        let storyboard = UIStoryboard(name: "MusicSearch", bundle: Bundle.main)
        guard let navigationController = storyboard.instantiateInitialViewController() as? UINavigationController,
                let searchViewController = navigationController.viewControllers.first as? MusicSearchViewController else {
            fatalError("Expected to have UINavigationController as initial")
        }

        let urlBuilder = URLBuilder()
        let networkClient = NetworkClient(urlBuilder: urlBuilder)

        let presenter = MusicSearchPresenter(networkClient: networkClient)
        searchViewController.output = presenter
        presenter.input = searchViewController

        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}