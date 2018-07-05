//
//  FeedItemsTableViewController.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 03/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import UIKit

class FeedItemsTableViewController: UITableViewController {
  
  // MARK: Vars
  
  var itemType: FeedType?
  var items: [FeedItem] = []
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    addObservers()
    loadFeedData()
  }
  
  deinit {
    NotificationCenter.default.removeObserver(self)
  }
  
  // MARK: Data reading
  
  @objc func loadFeedData() {
    if let itemType = itemType {
      
      let dataManager = DataManager.sharedInstance
      
      switch itemType {
      case .movies:
        items = dataManager.movies
      case .albums:
        items = dataManager.albums
      }
      
      tableView.reloadData()
    }
  }
  
  func addObservers() {
    // Adding observer for data loaded
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(self.loadFeedData),
      name: NSNotification.Name(rawValue: Constants.Notifications.MoviesLoadSuccess),
      object: nil
    )
    
    NotificationCenter.default.addObserver(
      self,
      selector: #selector(self.loadFeedData),
      name: NSNotification.Name(rawValue: Constants.Notifications.AlbumsLoadSuccess),
      object: nil
    )
  }
  
  // MARK: Table View
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return FeedItemCell.height
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    selectedIndex = indexPath.row
    tableView.deselectRow(at: indexPath, animated: true)
//    performSegue(withIdentifier: "showRouteInfo", sender: self)
  }
  
  // MARK: Table View Data Source
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: FeedItemCell.cellReuseIdentifier, for: indexPath) as! FeedItemCell
    let feedItem = items[indexPath.row]
    
    cell.mainLabel.text = feedItem.name
    cell.detailLabel.text = feedItem.artistName
    // The imageFromUrl method is defined in Extensions/UIImageView+Extension.swift
    cell.itemImageView.imageFromUrl(stringUrl: feedItem.artworkUrl, withPlaceholder: "placeholder")

    return cell
  }
}
