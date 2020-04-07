//
//  ContentView.swift
//  guesstheflag
//
//  Created by Ionut Vasile on 17/03/2020.
//  Copyright © 2020 Ionut Vasile. All rights reserved.
//

import SwiftUI

struct CustomTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
    }
}

extension View {
    func customTitle() -> some View {
        self.modifier(CustomTitle())
    }
}

struct FlagImage: View {
    let name: String
    
    var body: some View {
        Image(name)
            .renderingMode(.original)
            .clipShape(Capsule())
    }
}

struct ContentView: View {
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var selectedAnswer = 0
    @State private var isScoreShowing = false
    @State private var scoreTitle = ""
    @State private var score = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 30) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                    .customTitle()
                }
                .foregroundColor(.white)
                
                ForEach(0..<3) { number in
                   Button(action: {
                    self.flagTapper(number)
                   }) { FlagImage(name: self.countries[number]) }
                }
                
                Spacer()
                
                Text("Current score: \(score)")
                .foregroundColor(.white)
                .customTitle()

            }
        }
        .alert(isPresented: $isScoreShowing) {
            Alert(title: Text(scoreTitle), message: Text("That's the flag of \(countries[selectedAnswer])"), dismissButton: .default(Text("Continue")) { self.askQuestion() })
        }
    }
        
    func flagTapper(_ number: Int) {
        scoreTitle = number == correctAnswer ? "Correct" : "False"
        score += number == correctAnswer ? 1 : 0
        selectedAnswer = number
        isScoreShowing = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
