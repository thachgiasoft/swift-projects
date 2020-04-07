//
//  ContentView.swift
//  rockpaperscissors
//
//  Created by Ionut Vasile on 18/03/2020.
//  Copyright © 2020 Ionut Vasile. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var options = ["Rock", "Paper", "Scissors"]
    @State private var randomChoice = Int.random(in: 0..<3)
    @State private var playerShouldWin = Bool.random()
    @State private var score = 0
    @State private var counter = 1
    @State private var showAlert = false
    
    var body: some View {
        VStack {
            Text("Question \(counter) out of 10")
            Spacer()
            Text("Computer chose \(options[randomChoice])")
            Text("Pick to \(playerShouldWin ? "win" : "loose")")
            Spacer()
            HStack {
                ForEach(0..<3) { number in
                   Button(action: {
                    self.optionTapped(number)
                   }) {
                    Text(self.options[number])
                        .frame(width: 100, height: 60)
                    }
                }
            }
            Spacer()
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Game Over"), message: Text("You guessed \(score) out of 10!"), dismissButton: .default(Text("Reset")) { self.resetGame() })
        }
    }
    
    func resetGame() {
        counter = 1
        score = 0
        options.shuffle()
        randomChoice = Int.random(in: 0..<3)
        playerShouldWin = Bool.random()
    }
    
    func optionTapped(_ number: Int) {
        let answer = options[number]
        let computerChoice = options[randomChoice]
        
        if computerChoice == "Rock" {
            if playerShouldWin {
                if answer == "Paper" {
                    score += 1
                }
            } else {
                if answer != "Paper" {
                    score += 1
                }
            }
        } else if computerChoice == "Paper" {
            if playerShouldWin {
                if answer == "Scissors" {
                    score += 1
                }
            } else {
                if answer != "Scissors" {
                    score += 1
                }
            }
        } else {
            if playerShouldWin {
                if answer == "Rock" {
                    score += 1
                }
            } else {
                if answer != "Rock" {
                    score += 1
                }
            }
        }
        
        options.shuffle()
        randomChoice = Int.random(in: 0..<3)
        playerShouldWin = Bool.random()
        
        if counter == 10 {
            showAlert = true
        } else {
            counter += 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
