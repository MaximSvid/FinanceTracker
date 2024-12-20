//
//  AppNavigation.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI
import SwiftData

struct AppNavigation: View {
    
    @StateObject  var homeViewModel: HomeViewModel
    
    var body: some View {
        TabView {
            Tab("Home", systemImage: "house") {
                HomeView(homeViewModel: homeViewModel)
            }
            
            Tab("Wallet", systemImage: "creditcard") {
                WalletView()
            }
            
            Tab("Settings", systemImage: "gearshape") {
                SettingsView()
            }
        }
    }
}

#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Wallet.self, Category.self, MyTransaction.self, configurations: configuration)
    AppNavigation(homeViewModel: HomeViewModel()).modelContainer(container)
}
 
