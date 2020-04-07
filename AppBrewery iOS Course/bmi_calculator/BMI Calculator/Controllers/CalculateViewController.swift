//
//  ViewController.swift
//  BMI Calculator
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    @IBOutlet weak var hLabel: UILabel!
    @IBOutlet weak var wLabel: UILabel!
    @IBOutlet weak var hSlider: UISlider!
    @IBOutlet weak var wSlider: UISlider!
    
    var bmiCalculator = BMICalculator()

    @IBAction func updateHLabel(_ sender: UISlider) {
        bmiCalculator.setHeight(sender.value)
        hLabel.text = "\(String(format: "%.2f", sender.value))m"
    }
    
    @IBAction func updateWLabel(_ sender: UISlider) {
        bmiCalculator.setWeight(sender.value)
        wLabel.text = "\(String(format: "%.0f", sender.value))kg"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            destination.bmiValue = bmiCalculator.bmi?.value
            destination.bmiAdvice = bmiCalculator.bmi?.advice
            destination.bmiColor = bmiCalculator.bmi?.color
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        bmiCalculator.calculateBMI()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
}

