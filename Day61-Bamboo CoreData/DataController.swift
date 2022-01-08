//
//  DataController.swift
//  Bamboo
//
//  Created by Mac on 7.01.2022.
//
import CoreData
import Foundation

@MainActor
class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Bamboo")
    
    init(){
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load \(error.localizedDescription)")
            }
        }
    }
}
