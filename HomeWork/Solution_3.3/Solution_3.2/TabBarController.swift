//
//  TabBarController.swift
//  Solution_3.2
//
//  Created by Николай Чупреев on 09.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    let tableVCFrends = ViewControllerFrends()
    let tableVCGroups = ViewControllerGroups()
    let collVCPhotos = ViewControllerPhotos()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVCFrends.title = "Frends"
        tableVCFrends.tabBarItem.title = "Frends"

        tableVCGroups.title = "Groups"
        tableVCGroups.tabBarItem.title = "Groups"

        collVCPhotos.title = "Photos"
        collVCPhotos.tabBarItem.title = "Photos"
        
        viewControllers = [tableVCFrends, tableVCGroups, collVCPhotos]
    }
}

