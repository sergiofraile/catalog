//
//  ServerResponse.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 03/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation

struct ServerResponse: Decodable {
  
  // MARK: Vars
  
  let id: String
  let title: String
  let results: [FeedItem]
  
  // MARK: Coding keys
  
  enum ServerResponseKeys: String, CodingKey {
    case feed
    case id
    case title
    case results
  }
  
  // MARK: Init
  
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ServerResponseKeys.self)

    let feed = try container.nestedContainer(keyedBy: ServerResponseKeys.self, forKey: .feed)

    self.id = try feed.decode(String.self, forKey: .id)
    self.title = try feed.decode(String.self, forKey: .title)
    self.results = try feed.decode([FeedItem].self, forKey: .results)
  }
}
