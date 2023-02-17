//
//  Calculator.swift
//  Calculator
//
//  Created by Nuah on 2/14/23.
//

import Foundation

class Calculator: ObservableObject {
    private(set) var currentValue: Double = 0
    
    func addValue(_ num: Double) {
        currentValue += num
    }
    
    func subtractValue(_ num: Double) {
        currentValue -= num
    }
    
    func multiplyValue(_ num: Double) {
        currentValue *= num
    }
    
    func divideValue(_ num: Double) {
        currentValue /= num
    }
    
    func calculateValue(num: Double, thisOperator: String) {
        switch thisOperator {
        case "/":
            divideValue(num)
        case "*":
            multiplyValue(num)
        case "+":
            addValue(num)
        case "-":
            subtractValue(num)
        default:
            print("Invalid Operator Selected")
        }
    }
    
    func reset() {
        currentValue = 0
    }
    
    func updateCurrentValue(_ num: Double) {
        currentValue = num
    }
}
