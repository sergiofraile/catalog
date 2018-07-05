//
//  Constants.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 05/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation

// Constants define a global structure to store constants in
// subsections
struct Constants {
  // The subsection notifications stores the values for internal
  // use of the notification center
  struct Notifications {
    static let MoviesLoadSuccess = "movies_loaded_successfully"
    static let AlbumsLoadSuccess = "albums_loaded_successfully"
  }
}
