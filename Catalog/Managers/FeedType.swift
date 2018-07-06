//
//  FeedTypeEnum.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 03/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation

enum FeedType: String {
  case movies
  case albums
  
  var identifier: String {
    switch self {
    case .movies:
      return "Movies"
    case .albums:
      return "Albums"
    }
  }
  
  var imageName: String {
    switch self {
    case .movies:
      return "film"
    case .albums:
      return "music"
    }
  }
    
  var endpoint: String {
    // We read the endpoints fromm Enpoints.plist
    let serverConfig = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Endpoints", ofType: "plist")!)!
    // The API endpoint is stored here
    return serverConfig.object(forKey: self.identifier) as! String
  }
  
}
