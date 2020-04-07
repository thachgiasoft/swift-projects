//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var storyBrain = StoryBrain()
    
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer1: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answer1Submitted(_ sender: UIButton) {
        storyBrain.next(2)
        updateUI()
    }
    
    @IBAction func answer2Submitted(_ sender: UIButton) {
        storyBrain.next(1)
        updateUI()
    }
    
    func updateUI() {
        questionText.text = storyBrain.getQuestion()
        answer2.setTitle(storyBrain.getAnswer(1), for: .normal)
        answer1.setTitle(storyBrain.getAnswer(2), for: .normal)
    }
}

