//
//  FeedTabBarController.swift
//  Catalog
//
//  Created by Sergio Fraile Carmena on 04/07/2018.
//  Copyright © 2018 Sergio Fraile. All rights reserved.
//

import Foundation
import UIKit

class FeedTabBarController: UITabBarController, UISplitViewControllerDelegate {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    assignFeedTypeForView(0, type: .movies)
    self.viewControllers?[0].tabBarItem.title = FeedType.movies.identifier
    
    assignFeedTypeForView(1, type: .albums)
    self.viewControllers?[1].tabBarItem.title = FeedType.albums.identifier
    
    let dataManager = DataManager.sharedInstance
    
    dataManager.fetch(.movies) {
      NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.Notifications.MoviesLoadSuccess), object: nil)
    }
    
    dataManager.fetch(.albums) {
      NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.Notifications.AlbumsLoadSuccess), object: nil)
    }
  }
  
  func assignFeedTypeForView(_ position: Int, type: FeedType) {
    if let splitVC = self.viewControllers?[position] as? UISplitViewController{
      splitVC.preferredDisplayMode = .allVisible
      splitVC.delegate = self
      if let navVC = splitVC.viewControllers.first as? UINavigationController {
        if let tableVC = navVC.topViewController as? FeedItemsTableViewController {
          tableVC.itemType = type
          tableVC.title = type.identifier
        }
      }
    }
  }
  
  // MARK: Split View Controller Delegate
  
  func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
      return true
  }
}
