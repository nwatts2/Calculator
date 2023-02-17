//
//  Display.swift
//  Calculator
//
//  Created by Nuah on 2/14/23.
//

import SwiftUI

struct Display: View {
    @EnvironmentObject var viewmodel: CalculatorViewModel
    @Environment(\.colorScheme) var colorScheme
    
    var displayValue: String {
        return String(format: "%.1f", viewmodel.operand)
    }
    
    var body: some View {
        VStack (spacing: 0) {
            ZStack (alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                Colors.display
                    .ignoresSafeArea()
                    .frame(height: 320)
                Text("\(viewmodel.operand)")
                    .padding()
                    .font(.system(size: 45))
                    .bold()
                    .multilineTextAlignment(.trailing)
                    .foregroundColor(Colors.font)
            }
            Rectangle()
                .frame(height: 6)
                .background(colorScheme == .dark ? Colors.displayBorderDark : Colors.displayBorderLight)
        }
    }
}

struct Display_Previews: PreviewProvider {
    static var previews: some View {
        Display().environmentObject(CalculatorViewModel())
    }
}
