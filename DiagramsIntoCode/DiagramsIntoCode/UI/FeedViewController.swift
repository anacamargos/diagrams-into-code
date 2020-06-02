//
//  FeedViewController.swift
//  DiagramsIntoCode
//
//  Created by Ana Leticia Camargos on 01/06/20.
//  Copyright © 2020 Ana Leticia Camargos. All rights reserved.
//

import UIKit

final class FeedViewController: UIViewController {
    
    // MARK: - Dependencies
    
    private let loader: FeedLoader
    
    // MARK: - Initializers
    
    init(loader: FeedLoader) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - ViewController lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadFeed { loadedItems in
            // Do something
        }
    }
}
