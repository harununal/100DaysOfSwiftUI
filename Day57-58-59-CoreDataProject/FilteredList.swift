//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Mac on 3.01.2022.
//
import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    @FetchRequest var fetchRequest: FetchedResults<T>

    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content

    var body: some View {
        List(fetchRequest, id: \.self) { singer in
            self.content(singer)
        }
    }
    
    init(beginFilter: String, containsFilter: String, filterKey: String, @ViewBuilder content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [NSSortDescriptor(keyPath: \Singer.lastName, ascending: true)] , predicate:
         NSCompoundPredicate(orPredicateWithSubpredicates: [
            NSPredicate(format: "%K BEGINSWITH[c] %@", filterKey, beginFilter),
            NSPredicate(format: "%K CONTAINS[c] %@", filterKey, containsFilter)
         ])
       )
        
        self.content = content
    }
}
