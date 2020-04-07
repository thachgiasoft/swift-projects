//
//  Quiz.swift
//  Quizzler-iOS13
//
//  Created by Ionut Vasile on 29/02/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Quiz {
    var questionNumber = 0
    var score = 0
    let list = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], ca: "Skin"),
           Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], ca: "100"),
           Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], ca: "Greenwich Mean Time"),
           Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], ca: "Chapeau"),
           Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], ca: "Watch"),
           Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], ca: "Adiós"),
           Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], ca: "Orange"),
           Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], ca: "Rum"),
           Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], ca: "Gorilla"),
           Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], ca: "Australia")
    ]
    
    mutating func nextQuestion() -> Void {
        if questionNumber < list.count - 1 {
           questionNumber += 1
        } else {
           questionNumber = 0
        }
    }
    
    mutating func isAnswerCorrect(_ selectedAnswer : String) -> Bool {
        if selectedAnswer == list[questionNumber].correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getQuestion() -> String {
        return list[questionNumber].text
    }
    
    func getProgress() -> Float {
        let progress = Float(questionNumber) / Float(list.count - 1)
        return progress
    }
    
    func getAnswer(button : Int) -> String {
        return list[questionNumber].answer[button]
    }

}
