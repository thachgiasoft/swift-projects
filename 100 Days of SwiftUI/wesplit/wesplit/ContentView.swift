//
//  ContentView.swift
//  wesplit
//
//  Created by Ionut Vasile on 16/03/2020.
//  Copyright © 2020 Ionut Vasile. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var splitBy = ""
    @State private var tipSelector = 1
    
    let tipPercentage = [0, 10, 15, 20]
    
    var totalWithTip: Double {
        let tip = Double(tipPercentage[tipSelector])
        let inputAmount = Double(amount) ?? 0
        let tipAmount = (inputAmount / 100) * tip
        let grandTotal = inputAmount + tipAmount
        return grandTotal
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(splitBy) ?? 1
        let tip = Double(tipPercentage[tipSelector])
        let inputAmount = Double(amount) ?? 0
        
        let tipAmount = (inputAmount / 100) * tip
        let grandTotal = inputAmount + tipAmount
        let totalPerPeron = grandTotal / peopleCount
        return totalPerPeron
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $amount)
                        .keyboardType(.decimalPad)
                    
                    TextField("Number of People", text: $splitBy)
                        .keyboardType(.numberPad)
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip Percentage", selection: $tipSelector) {
                        ForEach(0..<tipPercentage.count) {
                            Text("\(self.tipPercentage[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    
                }
                
                Section(header: Text("Total with tip")) {
                    Text("$\(totalWithTip, specifier: "%.2f")")
                    .foregroundColor(tipSelector == 0 ? Color.red : Color.black)
                }
                
                Section(header: Text("Total per person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
            }
            .navigationBarTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
