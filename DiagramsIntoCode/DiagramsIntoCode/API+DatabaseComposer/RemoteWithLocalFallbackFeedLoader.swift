//
//  RemoteWithLocalFallbackFeedLoader.swift
//  DiagramsIntoCode
//
//  Created by Ana Leticia Camargos on 01/06/20.
//  Copyright © 2020 Ana Leticia Camargos. All rights reserved.
//

import Foundation

struct Reachability {
    static let networkAvailable = false
}

final class RemoteWithLocalFallbackFeedLoader: FeedLoader {
    
    // MARK: - Dependencies
    
    private let local: FeedLoader
    private let remote: FeedLoader
    
    // MARK: - Initializer
    
    init(
        local: FeedLoader = LocalFeedLoader(),
        remote: FeedLoader = RemoteFeedLoader()
    ) {
        self.local = local
        self.remote = remote
    }
    
    // MARK: - FeedLoader
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        let load = Reachability.networkAvailable ? remote.loadFeed : local.loadFeed
        load(completion)
    }
}
