//
//  AllMoney.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct AllMoney: View {
    var wallet: [Wallet]
    var body: some View {
        VStack {
            VStack {
                ProgressView(value: wallet.reduce(0) {$0 + $1.balance}, total: 10000) {
                    Text("Total amount of money in euros: \(wallet.reduce(0) {$0 + $1.balance}, specifier: "%.2f") Euro")
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
        .shadow(color: .gray.opacity(0.3), radius: 10)

    }
}

#Preview {
    AllMoney(wallet: [Wallet(name: "Wallet 1", image: "gloab", balance: 5000.0)])
}
