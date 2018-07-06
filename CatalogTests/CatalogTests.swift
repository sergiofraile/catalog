//
//  CatalogTests.swift
//  CatalogTests
//
//  Created by Sergio Fraile Carmena on 03/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import XCTest
@testable import Catalog

class CatalogTests: XCTestCase {
  
  func testDecodableClasses() {
    
    // Testing models decoding capabilities
    
    // Json example
    let json = """
      {
      "feed": {
      "title": "Top Films",
      "id": "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/100/explicit.json",
      "author": {
      "name": "iTunes Store",
      "uri": "http://wwww.apple.com/us/itunes/"
      },
      "links": [
      {
      "self": "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/100/explicit.json"
      },
      {
      "alternate": "https://itunes.apple.com/WebObjects/MZStore.woa/wa/viewTop?genreId=33&popId=15"
      }
      ],
      "copyright": "Copyright © 2018 Apple Inc. Todos los derechos reservados.",
      "country": "us",
      "icon": "http://itunes.apple.com/favicon.ico",
      "updated": "2018-07-05T01:43:51.000-07:00",
      "results": [
      {
      "artistName": "Steven Spielberg",
      "id": "1354248992",
      "releaseDate": "2018-03-29",
      "contentAdvisoryRating": "PG-13",
      "name": "Ready Player One",
      "kind": "movie",
      "artworkUrl100": "https://is3-ssl.mzstatic.com/image/thumb/Video118/v4/e2/76/58/e2765818-c896-277b-f0a2-de1a00014737/pr_source.lsr/200x200bb.png",
      "genres": [
      {
      "genreId": "4401",
      "name": "Action & Adventure",
      "url": "https://itunes.apple.com/us/genre/id4401"
      }
      ],
      "url": "https://itunes.apple.com/us/movie/ready-player-one/id1354248992"
      },
      {
      "artistName": "Kay Cannon",
      "id": "1361705379",
      "releaseDate": "2018-04-06",
      "contentAdvisoryRating": "R",
      "name": "Blockers",
      "kind": "movie",
      "artworkUrl100": "https://is3-ssl.mzstatic.com/image/thumb/Video128/v4/9a/3d/ba/9a3dba17-2498-500f-fc92-298a1ec6e1b1/02491_MLNA_Blockers_LSR_2000x3000.lsr/200x200bb.png",
      "genres": [
      {
      "genreId": "4404",
      "name": "Comedy",
      "url": "https://itunes.apple.com/us/genre/id4404"
      }
      ],
      "url": "https://itunes.apple.com/us/movie/blockers/id1361705379"
      }
      ]}}
      """.data(using: .utf8)!
    
    do {
      // Decoding our data in the serverResponse model
      let serverResponse = try JSONDecoder().decode(ServerResponse.self, from: json)
      XCTAssertEqual(serverResponse.title, "Top Films")
      XCTAssertEqual(serverResponse.id, "https://rss.itunes.apple.com/api/v1/us/movies/top-movies/all/100/explicit.json")
      XCTAssertEqual(serverResponse.results.count, 2)
      XCTAssertEqual(serverResponse.results.last!.artistName, "Kay Cannon")
      XCTAssertEqual(serverResponse.results.last!.id, "1361705379")
      XCTAssertEqual(serverResponse.results.last!.releaseDate, "2018-04-06")
      XCTAssertEqual(serverResponse.results.last!.contentAdvisoryRating, "R")
      XCTAssertEqual(serverResponse.results.last!.name, "Blockers")
    } catch {
      XCTFail("Model is not decodable")
    }
  }
  
  func testingAPIs() {
    
    // Testing APIs fetching and deocidng is in place
    
    let dataManager = DataManager.sharedInstance
    
    dataManager.fetch(.movies, completion: {
      XCTAssertGreaterThanOrEqual(dataManager.movies.count, 0)
    }) { (error) in
      NSLog("Error fetching movies data: \(error.localizedDescription)")
      XCTFail("Error fetching movies data")
    }
    
    dataManager.fetch(.albums, completion: {
      XCTAssertGreaterThanOrEqual(dataManager.albums.count, 0)
    }) { (error) in
      NSLog("Error fetching albums data: \(error.localizedDescription)")
      XCTFail("Error fetching albums data")
    }
  }
  
}
