//
//  BmiCalculator.swift
//  BMI Calculator
//
//  Created by Ionut Vasile on 02/03/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

struct BMICalculator {
    var weight : Float = 100
    var height : Float = 1.50
    var bmi : BMI?
    
    mutating func setWeight(_ newWeight : Float) {
        weight = newWeight
    }
    
    mutating func setHeight(_ newHeight : Float) {
        height = newHeight
    }
    
    mutating func calculateBMI() {
        let result = weight / pow(height, 2)
        let advice : String?
        let color : UIColor?
        if result < 18.5 {
            advice = "Eat some more food!"
            color = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        } else if result >= 18.5 && result < 24.9 {
            advice = "Good to go!"
            color = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            advice = "Let the cookies go!"
            color = #colorLiteral(red: 0.9176470588, green: 0.368627451, blue: 0.368627451, alpha: 1)
        }
        bmi = BMI(value: result, advice: advice ?? "", color: color ?? .white)
    }
}
