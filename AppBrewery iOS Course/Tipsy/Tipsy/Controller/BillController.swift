//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class BillController: UIViewController {
    @IBOutlet weak var billTotalInput: UITextField!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var tip0percent: UIButton!
    @IBOutlet weak var tip10percent: UIButton!
    @IBOutlet weak var tip20percent: UIButton!
    
    var calculator = Calculator()
    
    override func viewDidLoad() {
        calculator.setSplit(2)
        calculator.setTip(0.1)
    }

    @IBAction func SplitStepperPressed(_ sender: UIStepper) {
        splitLabel.text = String(format: "%.0f", sender.value)
        calculator.setSplit(sender.value)
    }
    
    @IBAction func tipSizeSelected(_ sender: UIButton) {
        if sender.currentTitle == "0%" {
            tip0percent.isSelected = true
            tip10percent.isSelected = false
            tip20percent.isSelected = false
            calculator.setTip(0.0)
        } else if sender.currentTitle == "10%" {
            tip0percent.isSelected = false
            tip10percent.isSelected = true
            tip20percent.isSelected = false
            calculator.setTip(0.1)
        } else {
            tip0percent.isSelected = false
            tip10percent.isSelected = false
            tip20percent.isSelected = true
            calculator.setTip(0.2)
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTotalInput.text != "" {
            let inputTotal = Double(billTotalInput.text!)
            calculator.setTotal(inputTotal!)
        }

        calculator.setResult()
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultController
            destination.result = calculator.getResult()
            destination.split = calculator.getSplit()
            destination.tip = calculator.getTip()
        }
    }
}

