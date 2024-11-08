//
//  WalletView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct WalletView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isInitialized = false
    
    var body: some View {
        NavigationStack {
            VStack {
                AddNewWallet()
                ListWalletView()
                    .onAppear {
                        initializeData()
                    }
            }

        }
       
    }
    
    private func initializeData() {
            if !isInitialized {
                let wallet1 = Wallet(name: "Wallet 1", image: "wallet8", balance: 3000)
                let wallet2 = Wallet(name: "Wallet 2", image: "wallet5", balance: 4000)
                let wallet3 = Wallet(name: "Wallet 3", image: "wallet3", balance: 2500)

                modelContext.insert(wallet1)
                modelContext.insert(wallet2)
                modelContext.insert(wallet3)

                do {
                    try modelContext.save()
                    isInitialized = true
                } catch {
                    print("Failed to save initial data: \(error)")
                }
            }
        }
}

#Preview {
    WalletView()
}
