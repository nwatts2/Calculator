//
//  OperationButton.swift
//  Calculator
//
//  Created by Nuah on 2/14/23.
//

import SwiftUI

struct OperationButton: View {
    @EnvironmentObject var viewmodel: CalculatorViewModel
    @Environment(\.colorScheme) var colorScheme
    let operation: String
    
    var body: some View {
        Button {
            switch operation {
            case "=":
                if viewmodel.currentOperator != "" {
                    viewmodel.calculate(viewmodel.operand, thisOperator: viewmodel.currentOperator)
                } else {
                    viewmodel.calculate(viewmodel.prevOperand, thisOperator: viewmodel.prevOperator)
                }
                
                viewmodel.currentOperator = ""
                viewmodel.clearField = true
                
            case "/", "+", "-", "*":
                if viewmodel.currentOperator == "" {
                    viewmodel.setValue()
                } else {
                    if !viewmodel.clearField {
                        viewmodel.calculate(viewmodel.operand, thisOperator: viewmodel.currentOperator)
                    }
                }
                
                viewmodel.currentOperator = operation
                viewmodel.clearField = true
                
            default:
                print("Invalid Operation")
            }
        } label: {
            Text("\(operation)")
                .font(.largeTitle)
                .bold()
                .frame(width: 80, height: 80)
                .foregroundColor(Colors.font)
                .background(Circle().fill(viewmodel.currentOperator == operation ? Colors.operationButtonSelected : Colors.operationButton))
                .animation(.easeInOut(duration:0.2))
        }
    }
}

struct OperationButton_Previews: PreviewProvider {
    static var previews: some View {
        OperationButton(operation: "+").environmentObject(CalculatorViewModel())
    }
}
