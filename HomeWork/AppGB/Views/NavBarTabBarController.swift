//
//  NavBarTabBarController.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import UIKit

class NavBarTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let tableVCFriends = ViewControllerFriends()
        let tableVCGroups = ViewControllerGroups()
        let collVCPhotos = ViewControllerPhotos()

        let navControllerFriends = UINavigationController(rootViewController: tableVCFriends)
        navControllerFriends.tabBarItem.title = "Друзья"
        navControllerFriends.navigationBar.topItem?.title = "Друзья"

        let navControllerGroups = UINavigationController(rootViewController: tableVCGroups)
        navControllerGroups.tabBarItem.title = "Сообщества"
        navControllerGroups.navigationBar.topItem?.title = "Сообщества"

        let navControllerPhotos = UINavigationController(rootViewController: collVCPhotos)
        navControllerPhotos.tabBarItem.title = "Фото"
        navControllerPhotos.navigationBar.topItem?.title = "Фото"

        viewControllers = [navControllerFriends, navControllerGroups, navControllerPhotos]
    }
}
