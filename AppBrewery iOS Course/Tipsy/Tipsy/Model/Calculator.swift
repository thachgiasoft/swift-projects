//
//  Calculator.swift
//  Tipsy
//
//  Created by Ionut Vasile on 03/03/2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Calculator {
    var total : Double?
    var split : Double?
    var tip : Double?
    var result : Double?
    
    mutating func setResult()  {
        let tipSum = (total ?? 0) * (tip ?? 0)
        let totalSum = (total ?? 0) + tipSum
        result = totalSum / (split ?? 1)
    }
    
    func getResult() -> Double {
        return result ?? 0.0
    }
    
    mutating func setSplit(_ double : Double) {
        split = double
    }
    
    func getSplit() -> Double {
        return split ?? 0.0
    }
    
    mutating func setTip(_ double : Double) {
        tip = double
    }
    
    func getTip() -> Double {
        return tip ?? 0.0
    }
    
    mutating func setTotal(_ double : Double) {
        total = double
    }
    
    func getTotal() -> Double {
        return total ?? 0.0
    }
}
