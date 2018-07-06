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
  
  @IBOutlet weak var itemInfoContainer: UIView!
  @IBOutlet weak var itemImageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var ratingAndDateLabel: UILabel!
  @IBOutlet weak var selectItemLabel: UILabel!
  
  // MARK: Vars
  
  var selectedFeedItem: FeedItem?
  
  // MARK: Life cycle
  
//  override func viewDidLoad() {
//    super.viewDidLoad()
//    setup()
//  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setup()
  }
  
  // MARK: Setup
  
  func setup() {
    if let item = selectedFeedItem {
      selectItemLabel.isHidden = true
      itemInfoContainer.isHidden = false
      title = item.name
      nameLabel.text = item.name
      authorLabel.text = item.artistName
      ratingAndDateLabel.text = "\(item.contentAdvisoryRating) - \(item.releaseDate)"
      itemImageView.imageFromUrl(stringUrl: item.artworkUrl, withPlaceholder: "placeholder")
    } else {
      itemInfoContainer.isHidden = true
      selectItemLabel.isHidden = false
    }
  }
  
  // MARK: Actions
  
  @IBAction func didTapViewInItunes(_ sender: Any) {
    
  }
}
