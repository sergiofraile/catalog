//
//  Genre.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 03/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation

struct Genre: Decodable {
  let genreId: String
  let name: String
  let url: String
  
  enum GenreKeys: String, CodingKey {
    case genreId
    case name
    case url
  }
  
  init(genreId: String, name: String, url: String) {
    self.genreId = genreId
    self.name = name
    self.url = url
  }
}




