
//
//  Created by Николай Чупреев on 11.12.2023.
//

import UIKit

class TabBarController: UITabBarController {
    
    let tableVCFriends = ViewControllerFriends()
    let tableVCGroups = ViewControllerGroups()
    let collVCPhotos = ViewControllerPhotos()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableVCFriends.title = "Friends"
        tableVCFriends.tabBarItem.title = "Friends"

        tableVCGroups.title = "Groups"
        tableVCGroups.tabBarItem.title = "Groups"

        collVCPhotos.title = "Photos"
        collVCPhotos.tabBarItem.title = "Photos"
        
        viewControllers = [tableVCFriends, tableVCGroups, collVCPhotos]
    }
}
