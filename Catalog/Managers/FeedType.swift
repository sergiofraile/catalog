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
    
  var endpoint: String {
    // We read the endpoints fromm Enpoints.plist
    let serverConfig = NSDictionary(contentsOfFile: Bundle.main.path(forResource: "Endpoints", ofType: "plist")!)!
    // The API endpoint is stored here
    NSLog("The identifier is in here \(self.identifier)")
    return serverConfig.object(forKey: self.identifier) as! String
  }
  
}
