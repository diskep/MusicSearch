//
//  ViewController.swift
//  Media Search
//
//  Created by Timur Mustafaev on 16.12.2019.
//  Copyright © 2019 Timur Mustafaev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var networkClient: NetworkClient!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.networkClient = NetworkClient(urlBuilder: URLBuilder())
        networkClient.execute(request: LastFmProvider.tracks(query: "Michael Jackson"), with: LastFmSearchResponse.self) { result in
            switch result {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        // Do any additional setup after loading the view.
    }


}

