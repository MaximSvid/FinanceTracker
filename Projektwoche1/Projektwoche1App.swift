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
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: [
                    Wallet.self,
                    Category.self,
                    Transaction.self
                ])
        }
    }
}
#Preview {
    let configuration = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: Wallet.self, configurations: configuration)
    ContentView().modelContainer(container)
}
