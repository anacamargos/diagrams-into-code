import UIKit

protocol FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void)
}

final class FeedViewController: UIViewController {
    private let loader: FeedLoader
    
    init(loader: FeedLoader) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loader.loadFeed { loadedItems in
            // Update UI
        }
    }
}

final class RemoteFeedLoader: FeedLoader {
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // Do something
    }
}

final class LocalFeedLoader: FeedLoader {
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        // Do something
    }
}

struct Reachability {
    static let networkAvailable = false
}

final class RemoteWithLocalFallbackFeedLoader: FeedLoader {
    
    private let local: FeedLoader
    private let remote: FeedLoader
    
    init(
        local: FeedLoader = LocalFeedLoader(),
        remote: FeedLoader = RemoteFeedLoader()
    ) {
        self.local = local
        self.remote = remote
    }
    
    func loadFeed(completion: @escaping ([String]) -> Void) {
        let load = Reachability.networkAvailable ? remote.loadFeed : local.loadFeed
        load(completion)
    }
}
