//
//  CoreDataHelper.swift
//  Stamurai
//
//  Created by Pavan Kalyan Jonnadula on 19/05/20.
//  Copyright © 2020 Pavan Kalyan Jonnadula. All rights reserved.
//

import Foundation
import CoreData
class CoreDataHelper{
    static let shared = CoreDataHelper()
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Stamurai")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    lazy var context = persistentContainer.viewContext
    // MARK: - Core Data Saving support
    func saveContext () {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func getAllData(entityName : String) -> [Any]{
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do{
            let results = try context.fetch(fetchRequest) as [Any]
            return results
        }catch{
            print("error")
        }
        return []
    }
}
