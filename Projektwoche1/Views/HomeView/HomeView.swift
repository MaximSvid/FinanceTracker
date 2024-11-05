//
//  HomeView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Query private var wallets: [Wallet]
    var body: some View {
        VStack {
            AllMoney(wallet: wallets)
            ListWalletHomeView(wallet: wallets)
            CategoryView(wallets: wallets)
            Spacer()
            AddNewCategory()
            
            
        }
    }
}

#Preview {
    HomeView()
}
