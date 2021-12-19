//
//  ContentView.swift
//  HabitTracker
//
//  Created by Mac on 16.12.2021.
//

import SwiftUI



struct ContentView: View {
    @StateObject var data = Habits()
    @State private var addingNewhabit = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(data.Habits) {
                    habit in
                    NavigationLink {
                        DetailView(data: data, habit: habit)
                    } label: {
                        HStack {
                            Image(systemName: habit.symbol)
                                .foregroundColor(Color.indigo)
                                .font(.title2.bold())
                            
                            Text(habit.title)
                            Spacer()
                            Text(String(habit.completionCount))
                                .font(Font.headline.bold())
                                .foregroundColor(.black)
                                .padding(10)
                                .frame(minWidth: 50)
                                .clipShape(Capsule())
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habits")
            
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
                
                ToolbarItem(placement: .bottomBar) {
                    Button {
                        addingNewhabit.toggle()
                    } label: {
                        Label("New habit", systemImage: "plus")
                            .labelStyle(.titleAndIcon)
                    }
                }
            }
            .sheet(isPresented: $addingNewhabit) {
                AddHabit(data: data)
            }
        }
    }
    
    
    func removeItems(at offsets: IndexSet) {
        data.Habits.remove(atOffsets: offsets)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
