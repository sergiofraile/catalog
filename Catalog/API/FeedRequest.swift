//
//  FeedRequest.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 03/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation

// FeedRequest extends the protocol Request (find in at Protocols/Request.swift).

struct FeedRequest: Request {
  // We declare that our response tipe, declared in the Request protocol,
  // will be for an element [Route]
  typealias Response = [FeedItem]
  
  let type: FeedType
  
  init(type: FeedType) {
    self.type = type
  }
  
  // Method defined in the Request protocol. We will perform the API fetch for
  // the routes information in here. This method is invoked in DataManager.swift
  func perform(then handler: @escaping Handler) {
    
    // Get the type endpoint
    let endPoint = type.endpoint
    
    // Guard to check the endpoint is a valid url
    guard let url = URL(string: endPoint) else { return }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    
    let session = URLSession(configuration: .default)
    
    let task = session.dataTask(with: url) { (data, response, error) in
      // The response will be executed back in the main queue.
      DispatchQueue.main.async {
        if let error = error {
          // Handle failures based on the Request protocol
          handler(.failure(error))
        } else if let data = data {
          // Decoding the response
          let decoder = JSONDecoder()
          do {
            // The decoding information is in ServerResponse.swift and FeedItem.swift
            let serverResponse = try decoder.decode(ServerResponse.self, from: data)
            let feedItems = serverResponse.results
            handler(.success(feedItems))
          } catch {
            handler(.failure(error))
          }
        } else {
          let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
          handler(.failure(error))
        }
      }
    }
    task.resume()
  }
}

