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
            List(wallets, id: \.id) { wallet in
                HStack {
                    Image(systemName: wallet.image)
                    
                    VStack {
                        Text(wallet.name)
                        
                        Text(wallet.balance.formatted())
                    }
                }
                
            }
        }
    }
}

#Preview {
    ListWalletView()
}
