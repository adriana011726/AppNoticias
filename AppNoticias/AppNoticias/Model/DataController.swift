//
//  DataController.swift
//  AppNoticias
//
//  Created by ADRIANA DE SOUZA CORREIA DE OLIVEIRA on 10/05/22.
//

import Foundation
import CoreData

class DataController {
    let persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    init(modelName: String) {
        persistentContainer = NSPersistentContainer(name: modelName)
    }
    
    func loadData(completion: (() -> Void)? = nil) {
        persistentContainer.loadPersistentStores { storeDescription, error in
            guard error == nil else {
                print("error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            completion?()
        }
    }
}
