//
//  BambooApp.swift
//  Bamboo
//
//  Created by Mac on 6.01.2022.
//

import SwiftUI

@main
struct BambooApp: App {
    
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
