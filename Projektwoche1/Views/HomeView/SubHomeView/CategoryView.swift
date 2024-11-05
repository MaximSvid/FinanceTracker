//
//  CategoryView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct CategoryView: View {
    
    let categories: [Category] = [
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
    
    var wallets: [Wallet]
    
    
    @State private var isHomeSheetOpen: Bool = false
    @State private var selectedCategory: Category?
    
//    @State private var categoryName: String = ""
//    @State private var categoryIcon: String = ""
    
    
    
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 24), count: 4)
    
    var body: some View {
        
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(categories, id: \.self) { category in
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 60)    
                        .overlay(
                            Image(systemName: category.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        )
                        .shadow(radius: 3)
                        .onTapGesture {
                            selectedCategory = category
                            isHomeSheetOpen = true
                        }
                }
                
            }
            .padding(20) 
            .sheet(item: $selectedCategory) { category in
                    HomeSheetView(wallets: wallets, isHomeSheetPresented: $isHomeSheetOpen, categoryName: category.name, categoryImage: category.icon)
                        .presentationDetents([.fraction(0.6)])
                        .presentationDragIndicator(.visible)
                }
            
            
    }
    
}

#Preview {
    CategoryView(wallets: [Wallet(name: "", image: "", balance: 0.0)])
}
