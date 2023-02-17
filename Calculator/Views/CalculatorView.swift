//
//  CalculatorView.swift
//  Calculator
//
//  Created by Nuah on 2/14/23.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewmodel = CalculatorViewModel()
    
    var body: some View {
        ZStack {
            Colors.background.ignoresSafeArea()
            VStack {
                Display()
                Spacer()
                HStack {
                    VStack {
                        HStack {
                            MiscButton(operation: "AC")
                            MiscButton(operation: "+/-")
                            MiscButton(operation: "%")
                        }
                        HStack {
                            NumberButton(buttonValue: "7")
                            NumberButton(buttonValue: "8")
                            NumberButton(buttonValue: "9")
                        }
                        HStack {
                            NumberButton(buttonValue: "4")
                            NumberButton(buttonValue: "5")
                            NumberButton(buttonValue: "6")
                        }
                        HStack {
                            NumberButton(buttonValue: "1")
                            NumberButton(buttonValue: "2")
                            NumberButton(buttonValue: "3")
                        }
                        HStack {
                            NumberButton(buttonValue: "0")
                            NumberButton(buttonValue: ".")
                        }
                    }
                    VStack {
                        OperationButton(operation: "/")
                        OperationButton(operation: "*")
                        OperationButton(operation: "-")
                        OperationButton(operation: "+")
                        OperationButton(operation: "=")
                    }
                }
                Spacer()
            }
            .environmentObject(viewmodel)
        }
        
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
