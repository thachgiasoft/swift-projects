//
//  ContentView.swift
//  timeConversion
//
//  Created by Ionut Vasile on 17/03/2020.
//  Copyright © 2020 Ionut Vasile. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var fromIndex = 1
    @State private var toIndex = 2
    @State private var amount = "0"
    
    let timeUnits = ["Milliseconds", "Seconds", "Minutes", "Hours", "Days"]
    
    var conversionResult: Double {
        var timeInMilliseconds: Double
        var timeInSelectedUnit: Double
        let inputAmount = Double(amount) ?? 0
        
        switch fromIndex {
        case 0:
            timeInMilliseconds = inputAmount
        case 1:
            timeInMilliseconds = inputAmount * 1000
        case 2 :
            timeInMilliseconds = inputAmount * 1000 * 60
        case 3 :
            timeInMilliseconds = inputAmount * 1000 * 60 * 60
        case 4 :
            timeInMilliseconds = inputAmount * 1000 * 60 * 60 * 24
        default:
            timeInMilliseconds = 0
        }
        
        switch toIndex {
            case 0:
                timeInSelectedUnit = timeInMilliseconds
            case 1:
                timeInSelectedUnit = timeInMilliseconds / 1000
            case 2 :
                timeInSelectedUnit = timeInMilliseconds / 1000 / 60
            case 3 :
                timeInSelectedUnit = timeInMilliseconds / 1000 / 60 / 60
            case 4 :
                timeInSelectedUnit = timeInMilliseconds / 1000 / 60 / 60 / 24
            default:
                timeInSelectedUnit = 0
        }
        
        return timeInSelectedUnit
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("From", selection: $fromIndex) {
                        ForEach(0..<timeUnits.count) {
                            Text(self.timeUnits[$0])
                        }
                    }
                    Picker("To", selection: $toIndex) {
                        ForEach(0..<timeUnits.count) {
                            Text(self.timeUnits[$0])
                        }
                    }
                }
                
                Section() {
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("Conversion Result")) {
                    Text("\(conversionResult, specifier: "%.2f") \(timeUnits[toIndex].lowercased())")
                }
            }
            .navigationBarTitle("Time Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
