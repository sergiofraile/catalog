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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setup()
    
//    navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
  }
  
  // MARK: Setup
  
  func setup() {
    if let item = selectedFeedItem {
      selectItemLabel.isHidden = true
      itemInfoContainer.isHidden = false
      title = item.name
      nameLabel.text = item.name
      authorLabel.text = item.artistName
      
      if let contentAdvisoryRating = item.contentAdvisoryRating {
        ratingAndDateLabel.text = "\(contentAdvisoryRating) - \(item.releaseDate)"
      } else {
        ratingAndDateLabel.text = "\(item.releaseDate)"
      }
      
      itemImageView.imageFromUrl(stringUrl: item.artworkUrl, withPlaceholder: "placeholder")
    } else {
      itemInfoContainer.isHidden = true
      selectItemLabel.isHidden = false
    }
  }
  
  // MARK: Actions
  
  @IBAction func didTapViewInItunes(_ sender: Any) {
    guard let item = selectedFeedItem, let artistUrl = item.artistUrl else { return }
    let url = URL(string: artistUrl)!
    UIApplication.shared.open(url, options: [:], completionHandler: nil)
  }
  
  @IBAction func didTapShareButton(sender: Any) {
    guard let item = selectedFeedItem else { return }
    
    let data = [
      "Checkout out \(item.name) by \(item.artistName) on iTunes",
      item.url
    ]

    let activityVC = UIActivityViewController(activityItems: data, applicationActivities: nil)
    activityVC.excludedActivityTypes = [
      .airDrop,
      .addToReadingList,
//      .assignToContact,
//      .saveToCameraRoll
    ]
    self.present(activityVC, animated: true, completion: nil)
  }
}
