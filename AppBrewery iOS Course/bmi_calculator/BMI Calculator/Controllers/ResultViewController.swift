//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Ionut Vasile on 02/03/2020.
//  Copyright © 2020 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController : UIViewController {
    
    var bmiValue : Float?
    var bmiAdvice : String?
    var bmiColor : UIColor?
    
    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var recommendationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = bmiColor ?? .white
        updateUI()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        recommendationLabel.text = bmiAdvice
        bmiLabel.text = String(format: "%.1f", bmiValue ?? 0.0)
    }
    
}
