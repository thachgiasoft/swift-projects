//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var quiz = Quiz()
    
    @IBOutlet weak var question: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var score: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    @IBAction func answerSubmitted(_ sender: UIButton) {
        
        let selectedAnswer = sender.currentTitle!
        let answerIsCorrect = quiz.isAnswerCorrect(selectedAnswer)
        
        if answerIsCorrect {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quiz.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        resetButtonColor()
        score.text = "Score: \(quiz.getScore())"
        question.text = quiz.getQuestion()
        answer0.setTitle(quiz.getAnswer(button: 0), for: .normal)
        answer1.setTitle(quiz.getAnswer(button: 1), for: .normal)
        answer2.setTitle(quiz.getAnswer(button: 2), for: .normal)
        progressBar.progress = quiz.getProgress()
    }
    
    func resetButtonColor() {
        answer0.backgroundColor = UIColor.clear
        answer1.backgroundColor = UIColor.clear
        answer2.backgroundColor = UIColor.clear
    }
    
}

