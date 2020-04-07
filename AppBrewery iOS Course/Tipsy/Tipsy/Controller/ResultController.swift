//
//  ResultController.swift
//  Tipsy
//
//  Created by Ionut Vasile on 03/03/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    
    var result : Double?
    var split : Double?
    var tip : Double?
    
    @IBOutlet weak var totalPerPerson: UILabel!
    @IBOutlet weak var tipDescription: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalPerPerson.text = "\(result ?? 0.0)"
        tipDescription.text = "Split between \(String(format: "%.0f", split ?? 0)) people with \(String(format: "%.0f", (tip ?? 0) * 100))% tip."
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
