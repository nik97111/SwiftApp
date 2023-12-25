//
//  NavBarTabBarController.swift
//  Solution_5.1
//
//  Created by Николай Чупреев on 24.12.2023.
//

import UIKit

class NavBarTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tableVCFriends = ViewControllerFriends()
        let tableVCGroups = ViewControllerGroups()
        let collVCPhotos = ViewControllerPhotos()
        
        let navControllerFriends = UINavigationController(rootViewController: tableVCFriends)
        navControllerFriends.tabBarItem.title = "Friends"
        navControllerFriends.navigationBar.topItem?.title = "Friends"
        
        let navControllerGroups = UINavigationController(rootViewController: tableVCGroups)
        navControllerGroups.tabBarItem.title = "Groups"
        navControllerGroups.navigationBar.topItem?.title = "Groups"
        
        let navControllerPhotos = UINavigationController(rootViewController: collVCPhotos)
        navControllerPhotos.tabBarItem.title = "Photos"
        navControllerPhotos.navigationBar.topItem?.title = "Photos"
        
        viewControllers = [navControllerFriends, navControllerGroups, navControllerPhotos]
    }
}

