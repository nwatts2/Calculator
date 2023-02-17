//
//  MiscButton.swift
//  Calculator
//
//  Created by Nuah on 2/14/23.
//

import SwiftUI

struct MiscButton: View {
    @EnvironmentObject var viewmodel: CalculatorViewModel
    
    let operation: String
    
    var body: some View {
        Button {
            switch operation {
            case "AC":
                viewmodel.clear()
            case "+/-":
                viewmodel.negate()
            case "%":
                viewmodel.setValue()
                viewmodel.calculate("100", thisOperator: "/")
            default:
                print("Invalid Operation")
            }
           
        } label: {
            Text(operation)
                .font(.largeTitle)
                .bold()
                .frame(width: 80, height: 80)
                .foregroundColor(Colors.font)
                .background(Colors.miscButton)
                .clipShape(Capsule())
        }
    }
}

struct MiscButton_Previews: PreviewProvider {
    static var previews: some View {
        MiscButton(operation: "AC").environmentObject(CalculatorViewModel())
    }
}
