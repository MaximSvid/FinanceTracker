//
//  WalletDetailView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 05.11.24.
//

import SwiftUI

struct WalletDetailView: View {
    var wallet: Wallet
    var body: some View {
        VStack {
            Text ("Wallet: \(wallet.name)")
                .font(.headline)
            
            List(wallet.transactions) { transaction in
                VStack(alignment: .leading) {
                    Text("\(transaction.amount.formatted()) Euro")
                    Text(transaction.category.name)
                    Text(transaction.date, style: .date)
                }
            }
        }
    }
}

#Preview {
    WalletDetailView(wallet: Wallet(name: "", image: "", balance: 0.0))
}
