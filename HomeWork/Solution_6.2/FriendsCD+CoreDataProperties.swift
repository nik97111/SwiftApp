//
//  FriendsCD+CoreDataProperties.swift
//  Solution_6
//
//  Created by Николай Чупреев on 29.12.2023.
//
//

import Foundation
import CoreData


extension FriendsCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendsCD> {
        return NSFetchRequest<FriendsCD>(entityName: "FriendsCD")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?

}

extension FriendsCD : Identifiable {

}
