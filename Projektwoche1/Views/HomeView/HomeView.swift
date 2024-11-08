//
//  HomeView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) private var modelContext
    @State private var isInitialized = false
    @Query private var wallets: [Wallet]
    @State private var isSheetDeleteCategoryPresented: Bool = false
    @State private var categories: [Category] = [
            Category(id: UUID(), name: "Food", icon: "fork.knife"),
            Category(id: UUID(), name: "Shopping", icon: "cart.fill"),
            Category(id: UUID(), name: "Transport", icon: "car.fill"),
            Category(id: UUID(), name: "Bicycle", icon: "bicycle"),
            Category(id: UUID(), name: "Health", icon: "heart.fill"),
            Category(id: UUID(), name: "Bills", icon: "doc.text"),
            Category(id: UUID(), name: "Entertainment", icon: "gamecontroller.fill"),
            Category(id: UUID(), name: "Education", icon: "book.fill"),
            Category(id: UUID(), name: "Travel", icon: "airplane"),
            Category(id: UUID(), name: "Gifts", icon: "gift.fill"),
            Category(id: UUID(), name: "Home", icon: "house.fill"),
            Category(id: UUID(), name: "Pet", icon: "pawprint.fill"),
            Category(id: UUID(), name: "Savings", icon: "banknote.fill"),
            Category(id: UUID(), name: "Insurance", icon: "shield.fill"),
            Category(id: UUID(), name: "Investment", icon: "chart.line.uptrend.xyaxis"),
            Category(id: UUID(), name: "Family", icon: "person.3.fill"),
            Category(id: UUID(), name: "Work", icon: "briefcase.fill"),
            Category(id: UUID(), name: "Phone", icon: "phone.fill"),
            Category(id: UUID(), name: "Utilities", icon: "bolt.fill"),
            Category(id: UUID(), name: "Miscellaneous", icon: "questionmark.circle.fill")
        ]
    
    var body: some View {
        VStack {
            SheetDeleteCategory(isSheetDeleteCategoryPresented: $isSheetDeleteCategoryPresented, categories: $categories)
            AllMoney(wallet: wallets)
            ListWalletHomeView(wallet: wallets)
            CategoryView(wallets: wallets, categories: $categories)
            Spacer()
            AddNewCategory(categories: $categories)
            
            
        }
        .onAppear {
            initializeData()
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
    HomeView()
}
