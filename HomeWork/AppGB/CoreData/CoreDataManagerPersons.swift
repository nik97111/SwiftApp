//
//  CoreDataManagerPersons.swift
//  AppGB
//
//  Created by Николай Чупреев on 04.01.2024.
//

import CoreData

struct CoreDataManagerPersons {

    static let shared = CoreDataManagerPersons()

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
    func createPerson(firstName: String, lastName: String) -> Person? {
        let context = persistentContainer.viewContext

        let person = Person(context: context)

        person.firstName = firstName
        person.lastName = lastName

        do {
            try context.save()
            return person
        } catch let error {
            print("Не удалось создать: \(error)")
        }

        return nil
    }

    func fetchPersons() -> [Person]? {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")

        do {
            let persons = try context.fetch(fetchRequest)
            return persons
        } catch let error {
            print("Не удалось получить данные: \(error)")
        }

        return nil
    }

    func fetchPerson(firstName: String, lastName: String) -> Person? {
        let context = persistentContainer.viewContext

        let fetchRequest = NSFetchRequest<Person>(entityName: "Person")
        fetchRequest.fetchLimit = 1
        fetchRequest.predicate = NSPredicate(format: "firstName == %@", "lastName == %@", firstName, lastName)

        do {
            let persons = try context.fetch(fetchRequest)
            return persons.first
        } catch let error {
            print("Не удалось получить: \(error)")
        }

        return nil
    }

    func updatePerson(person: Person) {
        let context = persistentContainer.viewContext

        do {
            try context.save()
        } catch let error {
            print("Не удалось обновить: \(error)")
        }
    }

    func deletePerson(person: Person) {
        let context = persistentContainer.viewContext
        context.delete(person)

        do {
            try context.save()
        } catch let error {
            print("Не удалось удалить: \(error)")
        }
    }
}

func coreDataPersons() {
    // Create
    guard let newPerson = CoreDataManagerPersons.shared.createPerson(firstName: "", lastName: "") else { return }
    print("Создан \(newPerson)")

    // Read
    guard let person = CoreDataManagerPersons.shared.fetchPerson(firstName: "", lastName: "") else { return }
    guard let persons = CoreDataManagerPersons.shared.fetchPersons() else { return }

    // Update
    CoreDataManagerPersons.shared.updatePerson(person: person)
    guard let updatedPerson = CoreDataManagerPersons.shared.fetchPerson(firstName: "", lastName: "") else { return }

    // Delete
    CoreDataManagerPersons.shared.deletePerson(person: updatedPerson)

    print("Количество человек: \(persons)")
    print("Количество человек: \(persons.count)")
}
