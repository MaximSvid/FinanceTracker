//
//  SheetNameSum.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct SheetNameSum: View {
    
    @Binding var walletName: String
    @Binding var walletBalance: Double
    @State var walletBalanceString: String = ""
    
    var body: some View {
        VStack {
            HStack {
                Text("Name")
                    .font(.subheadline)
                Spacer()
            }
            TextField("Name of Wallet", text: $walletName)
                .onSubmit {
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                )
                .shadow(color: .gray.opacity(0.3), radius: 10)
                .padding(.bottom)
            
            HStack {
                Text("Summe")
                    .font(.subheadline)
                Spacer()
            }
            TextField("Summe of money", text: $walletBalanceString)
                .keyboardType(.decimalPad)
                .onSubmit {
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                )
                .shadow(color: .gray.opacity(0.3), radius: 10)
                .padding(.bottom)
                .onChange(of: walletBalanceString) { newValue in
                    if let value = Double(newValue) {
                        walletBalance = value
                    } else {
                        walletBalance = 0.0
                    }
                    
                }
            
        }
    }
}

#Preview {
    SheetNameSum(walletName: .constant(""), walletBalance: .constant(0.0))
}
