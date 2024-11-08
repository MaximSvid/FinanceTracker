//
//  CategoryView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct CategoryView: View {
    
    

    
    var wallets: [Wallet]
    @Binding var categories: [Category]
    
    
    @State private var isHomeSheetOpen: Bool = false
    @State private var selectedCategory: Category?

    
    
    
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 24), count: 4)
    
    var body: some View {
        
        
        ScrollView {
            LazyVGrid(columns: columns, spacing: 24) {
                ForEach(categories, id: \.self) { category in
                    Circle()
                        .fill(Color.white)
                        .shadow(color: .gray.opacity(0.3), radius: 10)
                        .frame(width: 60, height: 60)
                        .overlay(
                            Image(systemName: category.icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(randomColor2())
                        )
//                        .shadow(radius: 3)
                        .onTapGesture {
                            selectedCategory = category
                            isHomeSheetOpen = true
                        }
                }
                
            }
            .padding(20)
            .sheet(item: $selectedCategory) { category in
                HomeSheetView(wallets: wallets, isHomeSheetPresented: $isHomeSheetOpen, categoryName: category.name, categoryImage: category.icon, selectedCategory: $selectedCategory)
                        .presentationDetents([.fraction(0.7)])
                        .presentationDragIndicator(.visible)
                }

        }
                        
            
    }
    private func randomColor() -> Color {
        Color.init(hue: .random(in: 0...1), saturation: .random(in: 0...1), brightness: .random(in: 0...1), opacity: 1)
    }
    private func randomColor2() -> Color {
            let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple, .pink, .teal, .indigo]
            return colors.randomElement() ?? .gray
        }
    
}

#Preview {
    CategoryView(wallets: [Wallet(name: "", image: "", balance: 0.0)], categories: .constant([]))
}
