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
  
  // MARK: Life cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
  
    setupTabBar(index: 0, type: .movies)
    setupTabBar(index: 1, type: .albums)
    
    let dataManager = DataManager.sharedInstance
    
    dataManager.fetch(.movies, completion: {
      NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.Notifications.MoviesLoadSuccess), object: nil)
    }, failure: nil)
    
    dataManager.fetch(.albums, completion: {
      NotificationCenter.default.post(name: Notification.Name(rawValue: Constants.Notifications.AlbumsLoadSuccess), object: nil)
    }, failure: nil)
  }
  
  // MARK: Setup
  
  func setupTabBar(index:Int, type: FeedType) {
    assignFeedTypeForView(index, type: type)
    self.viewControllers?[index].tabBarItem.title = type.identifier
    self.viewControllers?[index].tabBarItem.image = UIImage(named: type.imageName)
    self.viewControllers?[index].tabBarItem.selectedImage = UIImage(named: type.imageName)
  }
  
  func assignFeedTypeForView(_ position: Int, type: FeedType) {
    if let splitVC = self.viewControllers?[position] as? UISplitViewController{
      splitVC.preferredDisplayMode = .allVisible
      splitVC.delegate = self
      if let masterNavVC = splitVC.viewControllers.first as? UINavigationController {
        if let tableVC = masterNavVC.topViewController as? FeedItemsTableViewController {
          tableVC.itemType = type
          tableVC.title = type.identifier
        }
      }
    }
  }
  
  // MARK: Split View Controller Delegate
  
  func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {

    guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
    guard let topAsDetailController = secondaryAsNavController.topViewController as? FeedItemDetailViewController else { return false }
    if topAsDetailController.selectedFeedItem == nil {
      return true
    }
    return false
  }
}
