//
//  Addhabit.swift
//  HabitTracker
//
//  Created by Mac on 19.12.2021.
//

import SwiftUI

struct AddHabit: View {
    @ObservedObject var data: Habits
    @State private var title = ""
    @State private var symbol = ""
    @State private var description = ""

    @Environment(\.dismiss) var dismiss

    let symbolList = ["heart.text.square", "pills.circle", "cart", "dollarsign.circle.fill", "drop", "pawprint", "figure.walk", "gear"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Title", text: $title)
                } header: {
                    Text("Enter a habit name")
                }
                
                Section {
                    Picker("Symbol", selection: $symbol) {
                        ForEach(symbolList, id:\.self) {
                            Image(systemName: $0)
                        }
                    }
                } header: {
                    Text("Select a symbol for your habit:")
                }
                
                Section {
                    TextField("Description", text: $description)
                        .keyboardType(.default)
                } header: {
                    Text("Enter a description")
                }
            }
            .navigationTitle("New habit")
            .toolbar {
                Button("Save") {
                    let trimmedTitle = title.trimmingCharacters(in: .whitespaces)
                    guard trimmedTitle.isEmpty == false else { return }

                    let habit = habit(title: trimmedTitle, symbol: symbol, description: description)
                    data.Habits.append(habit)
                    dismiss()
                }
            }
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabit(data: Habits())
    }
}
