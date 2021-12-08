//
//  ContentView.swift
//  BetterRest
//
//  Created by Mac on 7.12.2021.
//

import SwiftUI
import CoreML

struct ContentView: View {
    
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showingAlert = false
    
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    var sleepResult : String {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)

            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60

            let prediction = try model.prediction(wake: Double(hour + minute), estimatedSleep: sleepAmount, coffee: Double(coffeeAmount))

            let sleepTime = wakeUp - prediction.actualSleep

            return sleepTime.formatted(date: .omitted, time: .shortened)
        } catch {
            return "An error"
        }
    }
    
    
    var body: some View {
        
        NavigationView {
            
            VStack {
            Form {
                
                Section {
                    
                    HStack {
                    Text("When do you want to wake up?")
                        .font(.headline)
                    Spacer()
                    DatePicker("Please enter a time", selection: $wakeUp, displayedComponents: .hourAndMinute)
                        .labelsHidden()
                    }}
                
                Section {
                    
                    Text("Desired amount of sleep")
                        .font(.headline)
                    
                    Stepper("\(sleepAmount.formatted()) hours", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                
                Section {
                    Text("Daily coffee intake")
                        .font(.headline)
                    
                    Picker("Number of cup:", selection: $coffeeAmount) {
                        ForEach(1 ..< 20) {
                            Text("\($0) cup")
                        }
                    }
                }
                

            }
            .navigationTitle("BetterRest")
                /*
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
                
            .alert(alertTitle, isPresented: $showingAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
                 */
                HStack {
                    Text("Your sleep time is:").font(.body.bold())
                    Spacer()
                    Text(sleepResult).font(.largeTitle.bold())
                }.padding()
                Spacer()
            }
        }
    }



}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
