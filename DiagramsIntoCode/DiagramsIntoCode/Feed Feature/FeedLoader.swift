//
//  FeedLoader.swift
//  DiagramsIntoCode
//
//  Created by Ana Leticia Camargos on 01/06/20.
//  Copyright © 2020 Ana Leticia Camargos. All rights reserved.
//

import Foundation

protocol FeedLoader {
    func loadFeed(completion: @escaping ([String]) -> Void)
}
