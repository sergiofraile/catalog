//
//  Request.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 03/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation


enum Result<Value> {
  case success(Value)
  case failure(Error)
}

// Request protocol that defines a Handler, being this a completion block, with an assocaited type of Response.
// This protocol also defines a peform method.
protocol Request {
  associatedtype Response
  
  typealias Handler = (Result<Response>) -> Void
  
  func perform(then handler: @escaping Handler)
}
