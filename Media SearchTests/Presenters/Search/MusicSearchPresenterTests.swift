//
// Created by Timur Mustafaev on 18.12.2019.
// Copyright (c) 2019 Timur Mustafaev. All rights reserved.
//

import XCTest
@testable import Media_Search

final class MusicSearchPresenterTests: XCTestCase {
    private var presenter: MusicSearchPresenter!
    private var view: MusicSearchViewControllerMock!
    private var networkClient: NetworkClientMock!
    private var router: MusicSearchViewRouterMock!

    override func setUp() {
        view = MusicSearchViewControllerMock()
        router = MusicSearchViewRouterMock()
        networkClient = NetworkClientMock()
        presenter = MusicSearchPresenter(networkClient: networkClient, router: router)
        presenter.input = view
    }

    func testDidTapSearch() {
        let expectation = XCTestExpectation(description: "Expected to have all fulfills")
        expectation.expectedFulfillmentCount = 2
        
        view.stateHandler = { state in
            switch state {
            case .loading:
                expectation.fulfill()
            case .data(let rows):
                XCTAssert(!rows.isEmpty)
                expectation.fulfill()
            case .error:
                XCTFail("Error state is not expected")
            }
        }
        
        presenter.didTapSearch(with: "Eminem")
        wait(for: [expectation], timeout: 5)
    }
}
