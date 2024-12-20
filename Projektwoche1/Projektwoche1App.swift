//
//  Projektwoche1App.swift
//  Projektwoche1
//
//  Created by Felix B on 03.11.24.
//

import SwiftUI
import SwiftData

@main
struct Projektwoche1App: App {
    @StateObject var homeViewModel = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            AppNavigation(homeViewModel: homeViewModel)
                .modelContainer(for: [
                    Wallet.self,
                    Category.self,
                    MyTransaction.self
                ])
        }
    }
}
//#Preview {
//    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
//    let container = try! ModelContainer(for: Wallet.self, Category.self,  configurations: configuration)
//    ContentView().modelContainer(container)
//}
