//
//  CalculatorViewModel.swift
//  Calculator
//
//  Created by Nuah on 2/14/23.
//

import Foundation

class CalculatorViewModel: ObservableObject {
    @Published var calculator = Calculator()
    @Published var currentOperator: String = ""
    @Published var operand: String = "0.0"
    
    var clearField: Bool = false
    var prevOperand: String = ""
    var prevOperator: String = ""
    
    var currentValue: Double {
        return calculator.currentValue
    }
    
    func calculate (_ num: String, thisOperator: String) {
        if let convertedNum = Double(num) {
            prevOperand = num
            prevOperator = thisOperator
            
            calculator.calculateValue(num: convertedNum, thisOperator: thisOperator)

            operand = String(currentValue)
        }
    }
    
    func clear() {
        operand = "0.0"
        currentOperator = ""
        calculator.reset()
    }
    
    func negate() {
        if operand != "0.0" {
            if operand.contains("-") {
                let index = operand.index(operand.startIndex, offsetBy: 1)
                operand = String(operand[index...])
            } else {
                operand = "-" + operand
            }
        }
        
    }
    
    func setValue() {
        if let convertedOperand = Double(operand) {
            calculator.updateCurrentValue(convertedOperand)
        }
    }
}
