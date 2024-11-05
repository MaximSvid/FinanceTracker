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
            HStack {
                Text ("All the money:")
                    .font(.headline)
                Text("\(wallet.reduce(0) {$0 + $1.balance}, specifier: "%.2f") Euro")
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
        .shadow(color: .gray.opacity(0.3), radius: 10)

    }
}

#Preview {
    AllMoney(wallet: [Wallet(name: "", image: "", balance: 0.0)])
}
