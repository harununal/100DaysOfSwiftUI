//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mac on 3.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    //MARK: - variables
    @State private var showingAlert = false
    @State private var showingScore = false
    @State private var isGameFinished = false
    
    
    
    private let maxQuestion = 8
    @State private var pastQuestions = 0
    @State private var score = 0
    @State private var buttonHeader = ""
    @State private var alertTitle = ""
    @State private var alertBody = ""
    @State private var isAnyButtonTapped = false
    @State private var selectionIndex = 0

    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    //MARK: - body
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Text("Guess the Flag")
                    .font(.largeTitle.weight(.bold))
                    .foregroundColor(.white)
                Spacer()
                Spacer()
                Text(String("Score : \(score)"))
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
                
                VStack (spacing: 15){
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    
                    ForEach(0..<3) { i in
                        
                        Button {
                            withAnimation {
                                self.flagTapped(i)
                            }
                        } label: {
                            FlagImage(country: countries[i])
                        }
                        .rotation3DEffect(.degrees(self.isAnyButtonTapped && self.selectionIndex == i ? 360.0 : 0.0), axis: (x: 0, y: 1, z: 0))
                        .opacity(self.isAnyButtonTapped && !(self.selectionIndex == i) ? 0.25 : 1)
                        .scaleEffect(self.isAnyButtonTapped && !(self.selectionIndex == i) ? 0.25 : 1)
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
            }
            .padding()
            
            
        }
        .alert(alertTitle, isPresented: $showingScore) {
            
            Button(buttonHeader, action: buttonAction)
        } message: {
            Text(alertBody)
        }
        
        
    }
    
    
    func flagTapped(_ selection: Int) {
        
        self.selectionIndex = selection
        isAnyButtonTapped = true
        
        if selection == correctAnswer {
            score += 1
            alertTitle = "Correct"
            
        } else {
            alertTitle = "Wrong"
        }
        pastQuestions += 1
        showingScore = true
        
        if pastQuestions == maxQuestion {
            alertBody = "Game finished.\nYour Score : \(score)\nPlay again?"
            pastQuestions = 0
            score = 0
            buttonHeader = "Play again"
        } else {
            alertBody = "Last question : \(maxQuestion-pastQuestions)"
            buttonHeader = "Continue"
        }
    }
    
    func buttonAction() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        isAnyButtonTapped = false
    }
    
}
//MARK: - prewiews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct FlagImage: View {
    var country: String
    
    var body: some View {
        Image(country)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
        
        
        
    }
}

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundColor(.blue)
            .padding()
    }
}
extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
}
