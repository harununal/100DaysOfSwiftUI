//
//  ContentView.swift
//  iExpense
//
//  Created by Paul Hudson on 01/11/2021.
//

import SwiftUI

struct ContentView: View {
    @StateObject var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var isShowingPersonalExpenses = false
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    List {
                        ForEach(expenses.items) { item in
                            
                            if item.type == "Personal" {
                                HStack {
                                    VStack(alignment: .leading) {
                                        Text(item.name)
                                            .font(.headline)
                                        priceStars(amount: item.amount)
                                    }
                                    
                                    Spacer()
                                    
                                    Text(item.amount, format: .currency(code: item.currency))
                                }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                } header : {
                    Text("PERSONAL")
                        .font(.headline.bold())
                }
                
                Section {
                    List {
                        ForEach(expenses.items) { item in
                            if item.type == "Business" {

                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    priceStars(amount: item.amount)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: item.currency))
                            }
                            }
                        }
                        .onDelete(perform: removeItems)
                    }
                } header : {
                    Text("BUSINESS")
                        .font(.headline.bold())
                }
            }
            
            
            
            
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                    Image(systemName: "plus")
                    
                }
                
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
    
    func priceStars(amount: Double) -> Text {
        switch amount {
        case (0..<10):
            return Text("⭐️")
                .font(.caption)
        case (10..<100):
            return Text("⭐️ ⭐️")
                .font(.caption)
        default :
            return Text("⭐️ ⭐️ ⭐️")
                .font(.caption)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
