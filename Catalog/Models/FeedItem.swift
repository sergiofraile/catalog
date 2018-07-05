//
//  FeedItem.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 03/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation

// Feed item model. Extends form Decodable for a quick creation from the
// json response from the server API. It does only include the
// same route information provided by the API.

public struct FeedItem: Decodable {
  
  // MARK: Vars
  
  let id: String
  let artistName: String
  let releaseDate: String
  let name: String
  let contentAdvisoryRating: String?
  let kind: String
  let artworkUrl: String?
  let genres: [Genre]
  let url: String
  let artistId: String?
  let artistUrl: String?
  
  // MARK: Coding keys
  
  public enum FeedItemKeys: String, CodingKey {
    case id
    case artistName
    case releaseDate
    case name
    case contentAdvisoryRating
    case kind
    case artworkUrl = "artworkUrl100"
    case genres
    case url
    case artistId
    case artistUrl
  }
  
  // MARK: Init
  
  public init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: FeedItemKeys.self)
    self.id = try container.decode(String.self, forKey: .id)
    self.artistName = try container.decode(String.self, forKey: .artistName)
    self.releaseDate = try container.decode(String.self, forKey: .releaseDate)
    self.name = try container.decode(String.self, forKey: .name)
    self.contentAdvisoryRating = try container.decodeIfPresent(String?.self, forKey: .contentAdvisoryRating) ?? nil
    self.kind = try container.decode(String.self, forKey: .kind)
    self.artworkUrl = try container.decodeIfPresent(String?.self, forKey: .artworkUrl) ?? nil
    self.url = try container.decode(String.self, forKey: .url)
    self.artistId = try container.decodeIfPresent(String?.self, forKey: .artistId) ?? nil
    self.artistUrl = try container.decodeIfPresent(String?.self, forKey: .artistUrl) ?? nil
    self.genres = try container.decode([Genre].self, forKey: .genres)
//    var genres = [Genre]()
//    var nestedGenres = try container.nestedUnkeyedContainer(forKey: .genres)
//    while (!nestedGenres.isAtEnd) {
//      let genreContainer = try nestedGenres.nestedContainer(keyedBy: GenreKeys.self)
//      let genreId = try genreContainer.decode(String.self, forKey: .genreId)
//      let name = try genreContainer.decode(String.self, forKey: .name)
//      let url = try genreContainer.decode(String.self, forKey: .url)
//      genres.append(Genre(genreId: genreId, name: name, url: url))
//    }
//    self.genres = genres
  }
}
