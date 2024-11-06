//
//  ListWalletView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI
import SwiftData

struct ListWalletView: View {
    
    @Query private var wallets: [Wallet]
    
    var body: some View {
        VStack {
            HStack {
                Text("Wallets")
                    .font(.title.bold())
                    .padding(.leading)
            }
            Divider()
            
            
            List(wallets, id: \.id) { wallet in
                NavigationLink(destination: WalletDetailView(wallet: wallet)) {
                    ListWalletUniversalView(wallet: wallet)
                        .swipeActions {
                            Button(role: .destructive) {
                                wallet.deleteWallet()
                            } label: {
                                Label("Delete", systemImage: "trash")
                            }
                        }
                }
                .listRowSeparator(.hidden)
                
            }
            .listRowSeparator(.hidden)
            .background(Color.clear)
            .listStyle(PlainListStyle())
        }
        
        
    }
}

#Preview {
    ListWalletView()
}
