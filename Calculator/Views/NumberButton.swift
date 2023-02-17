//
//  NumberButton.swift
//  Calculator
//
//  Created by Nuah on 2/14/23.
//

import SwiftUI

struct NumberButton: View {
    @EnvironmentObject var viewmodel: CalculatorViewModel
    
    let buttonValue: String
    
    var body: some View {
        Button {
            if viewmodel.operand.count < 45 {
                if buttonValue == "." {
                    if !viewmodel.operand.contains(buttonValue) {
                        if viewmodel.operand == "0.0" || viewmodel.clearField {
                            viewmodel.operand = buttonValue
                            viewmodel.clearField = false
                            
                        } else {
                            viewmodel.operand += buttonValue
                        }
                    }
                } else {
                    if viewmodel.operand == "0.0" || viewmodel.clearField {
                        viewmodel.operand = buttonValue
                        viewmodel.clearField = false

                    } else {
                        viewmodel.operand += buttonValue
                    }
                    
                }
            }
        } label: {
            Text("\(buttonValue)")
                .font(.largeTitle)
                .bold()
                .frame(width:buttonValue == "0" ? 160 : 80, height:80)
                .foregroundColor(Colors.altFont)
                .background(Colors.numberButton)
                .clipShape(Capsule())
        }
    }
}

struct NumberButton_Previews: PreviewProvider {
    static var previews: some View {
        NumberButton(buttonValue: "5").environmentObject(CalculatorViewModel())
    }
}
