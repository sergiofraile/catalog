//
//  FeedCell.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 04/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation
import UIKit

// Cell for displaying a feed item

class FeedItemCell: UITableViewCell {
  
  // MARK: Statics
  
  static let height: CGFloat = 70
  static let cellReuseIdentifier = "FeedItemCellReuseIdentifier"
  
  // MARK: Outlets
  
  @IBOutlet weak var itemImageView: UIImageView!
  @IBOutlet weak var mainLabel: UILabel!
  @IBOutlet weak var detailLabel: UILabel!
  
  // MARK: Life cycle
  
  override func prepareForReuse() {
    super.prepareForReuse()
    mainLabel.text = ""
    detailLabel.text = ""
    itemImageView.image = nil
  }
}
