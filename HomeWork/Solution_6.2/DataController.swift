//
//  DataController.swift
//  Solution_6
//
//  Created by Николай Чупреев on 29.12.2023.
//


import UIKit
import CoreData

class DataController: NSObject {
    var managedObjectContext: NSManagedObjectContext
    
    override init() {
        guard let modelURL = Bundle.main.url(forResource: "Solution_6.ModelData",
                                             withExtension: "momd") else {
            fatalError("Failed to find Solution_6.ModelData")
        }
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Failed to create model from file: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        let dirURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last
        let fileURL = URL(string: "Solution_6.ModelData.sql", relativeTo: dirURL)
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType,
                                       configurationName: nil,
                                       at: fileURL, options: nil)
        } catch {
            fatalError("Error configuring persistent store: \(error)")
        }
        
        let moc = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        moc.persistentStoreCoordinator = psc
        
        self.managedObjectContext = moc // Инициализируем свойство managedObjectContext
    }
}
