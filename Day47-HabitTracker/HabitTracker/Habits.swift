//
//  AddNewHabit.swift
//  HabitTracker
//
//  Created by Mac on 16.12.2021.
//

import Foundation
import SwiftUI

struct habit: Codable, Identifiable, Equatable {
    var id = UUID()
    var title: String
    var symbol: String
    var description: String
    var completionCount = 0

    static let example = habit(title: "Example habit", symbol: "gear", description: "This is a test habit.")
}


class Habits: ObservableObject {
    @Published var Habits: [habit] {
        didSet {
            if let encoded = try? JSONEncoder().encode(Habits) {
                UserDefaults.standard.set(encoded, forKey: "Habits")
            }
        }
    }

    init() {
        if let saved = UserDefaults.standard.data(forKey: "Habits") {
            if let decoded = try? JSONDecoder().decode([habit].self, from: saved) {
                Habits = decoded
                return
            }
        }

        Habits = []
    }
}
