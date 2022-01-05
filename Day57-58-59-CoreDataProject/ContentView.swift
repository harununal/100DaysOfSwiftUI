//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Mac on 2.01.2022.
//

import SwiftUI

import CoreData

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var moc

    @State private var beginsWithFilter = ""
    @State private var containsWithFilter = ""


    var body: some View {
        NavigationView{
            VStack {
                Form {
                    Section {
                        HStack{
                            TextField("A...", text: $beginsWithFilter)
                                .frame(width: 50, alignment: .leading)
                            TextField("...a...", text: $containsWithFilter)
                                .scaledToFill()
                        }
                    } header: {
                        Text("SEARCH FOR SURNAME")
                    }
                    
                    Section {
                        FilteredList(beginFilter: beginsWithFilter, containsFilter: containsWithFilter, filterKey: "lastName") { (singer: Singer) in
                            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
                        }
                    } header: {
                        Text("RESULTS")
                    }
                }
            }
            .navigationTitle("Core Data Project")
            .toolbar {
                    Button("+") {
                        let taylor = Singer(context: moc)
                        taylor.firstName = "Taylor"
                        taylor.lastName = "Swift"

                        let ed = Singer(context: moc)
                        ed.firstName = "Ed"
                        ed.lastName = "Sheeran"

                        let adele = Singer(context: moc)
                        adele.firstName = "Adele"
                        adele.lastName = "Adkins"
                        
                        let dua = Singer(context: moc)
                        dua.firstName = "Dua"
                        dua.lastName = "Lipa"
                        
                        let shawn = Singer(context: moc)
                        shawn.firstName = "Shawn"
                        shawn.lastName = "Mendes"

                        try? moc.save()
                    }
                    .font(.largeTitle.bold())
                }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
