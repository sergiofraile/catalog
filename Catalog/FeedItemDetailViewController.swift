//
//  FeedItemDetailViewController.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 05/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation
import UIKit

class FeedItemDetailViewController: UIViewController {

  // MARK: Outlets
  
  @IBOutlet weak var mainLabel: UILabel!
  
  // MARK: Vars
  
  var selectedFeedItem: FeedItem?
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setup()
  }
  
  // MARK: Setup
  
  func setup() {
    if let item = selectedFeedItem {
      title = item.name
      mainLabel.text = item.name
    }
  }
}
