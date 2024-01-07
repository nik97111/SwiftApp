//
//  CoreDataManagerGroups.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import CoreData

struct CoreDataManagerGroups {

    static let shared = CoreDataManagerGroups()

    let persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "Solution_6.DataModel")
        container.loadPersistentStores { (_, error) in
            if let error = error {
                fatalError("Загрузка не удалась \(error)")
            }
        }

        return container
    }()

    @discardableResult
    func createCommunity(name: String) -> Community? {
        let context = persistentContainer.viewContext

        let community = Community(context: context)

        community.name = name

        do {
            try context.save()
            return community
        } catch let error {
            print("Не удалось создать: \(error)")
        }

        return nil
    }

    func fetchCommunities() -> [Community]? {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Community>(entityName: "Community")

        do {
            let communities = try context.fetch(fetchRequest)
            return communities
        } catch let error {
            print("Не удалось получить данные: \(error)")
        }

        return nil
    }

    func fetchCommunity(withName name: String) -> Community? {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Community>(entityName: "Community")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "name == %@", name)

        do {
            let communities = try context.fetch(fetchRequest)
            return communities.first
        } catch let error {
            print("Не удалось получить: \(error)")
        }

        return nil
    }

    func updateCommunity(community: Community) {
        let context = persistentContainer.viewContext

        do {
            try context.save()
        } catch let error {
            print("Не удалось обновить: \(error)")
        }
    }

    func deleteCommunity(community: Community) {
        let context = persistentContainer.viewContext
        context.delete(community)

        do {
            try context.save()
        } catch let error {
            print("Не удалось удалить: \(error)")
        }
    }

}

func coreDataGroups() {
    // Create
    guard let newCommunity = CoreDataManagerGroups.shared.createCommunity(name: "") else { return }
    print("Создан \(newCommunity)")

    // Read
    guard let community = CoreDataManagerGroups.shared.fetchCommunity(withName: "") else { return }
    guard let communities = CoreDataManagerGroups.shared.fetchCommunities() else { return }

    // Update
    CoreDataManagerGroups.shared.updateCommunity(community: community)
    guard let updatedCommunity = CoreDataManagerGroups.shared.fetchCommunity(withName: "") else { return }

    // Delete
    CoreDataManagerGroups.shared.deleteCommunity(community: updatedCommunity)

    print("Количество групп: \(communities)")
    print("Количество групп: \(communities.count)")
}
