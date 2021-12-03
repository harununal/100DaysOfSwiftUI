//
//  ContentView.swift
//  UniversalUnitConvertor
//
//  Created by Mac on 3.12.2021.
//

import SwiftUI

struct ContentView: View {
    // MARK: - variables
    let units = ["meters" : 1.0,
                 "kilometers" : 1000.0,
                 "feet" : 0.3048,
                 "yards" : 0.9144,
                 "miles" : 0.01609347]
    
    @State private var selectedInputUnit = 0
    @State private var selectedOutputUnit = 0
    @State private var inputAmount = 1000.0
    @FocusState private var amountIsFocused : Bool
     
    var generalUnitsList: Array<String> {
        let unitsKeys = Array(units.keys).sorted()
        return unitsKeys
    }
    
    var outputValue: Double {
        let inputKey = generalUnitsList[selectedInputUnit]
        let outputKey = generalUnitsList[selectedOutputUnit]
        
        guard let inputValue = units[inputKey] else { return 1.0 }
        guard let outputValue = units[outputKey] else { return 1.0 }
        
        return (inputValue * inputAmount / outputValue)
    }
    
// MARK: - body
    var body: some View {
        
        NavigationView {
            
            Form {

                Section {}
                
                Section {
                    TextField("Amount", value: $inputAmount, format: .number )
                        .keyboardType(.decimalPad)
                        .focused($amountIsFocused)
                } header: {
                    Text("Enter value")
                }
                
                Section {
                    Picker("From", selection: $selectedInputUnit) {
                        let i = generalUnitsList.count
                        ForEach(0..<i) {
                            Text("\(generalUnitsList[$0])")
                        }
                    }

                    Picker("To", selection: $selectedOutputUnit) {
                        let i = generalUnitsList.count
                        ForEach(0..<i) {
                            Text("\(generalUnitsList[$0])")
                        }
                    }
                } header: {
                    Text("convert")
                }
                
                Section {
                    Text("\(outputValue)")
                } header: {
                    Text("result")
                }

            }
            .navigationTitle("Convertor")
        }
    }
}


// MARK: - previews
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
