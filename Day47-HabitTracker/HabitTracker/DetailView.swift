//
//  habitView.swift
//  HabitTracker
//
//  Created by Mac on 19.12.2021.
//

import SwiftUI

struct DetailView: View {
    @ObservedObject var data: Habits
    @State private var animationAmount = 1.2

    var habit: habit

    var body: some View {
        
        GeometryReader { geo in
            
            VStack {
                Text(habit.title)
                    .padding()
                    .font(.largeTitle.bold())
                    .foregroundColor(.blue)
                
                Text(habit.description)
                    .padding()
                    .font(.headline.bold())
                    .foregroundColor(.black)
                    .frame(alignment: .leading)
                
                Spacer()
                VStack {
                    Text("Completion count: ")                    
                    Text("\(habit.completionCount)")
                }
                .font(.title3.bold())
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        var newhabit = habit
                        newhabit.completionCount += 1

                        if let index = data.Habits.firstIndex(of: habit) {
                            data.Habits[index] = newhabit
                        }
                    } label: {
                        Image(systemName: habit.symbol)
                            .font(.system(size: CGFloat(geo.size.width/8)).bold())
                    }
                    .overlay(
                        Circle()
                            .stroke(.red)
                            .scaleEffect(animationAmount)
                            .opacity(2 - animationAmount)
                    )
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: true),
                        value: animationAmount
                    )
                    Spacer()
                }
                Spacer()
            }
        }
        .onAppear {
            animationAmount += 1.0
        }
    }
        
}
        
        
        
        
        
        
        


struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(data: Habits(), habit: habit.example)
    }
}



