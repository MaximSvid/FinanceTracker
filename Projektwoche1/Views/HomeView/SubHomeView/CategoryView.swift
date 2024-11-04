//
//  CategoryView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct CategoryView: View {
    let categories = Array(repeating: "star.fill", count: 20)
    
    let columns = Array(repeating: GridItem(.flexible(), spacing: 20), count: 4)
    
    var body: some View {
        
            LazyVGrid(columns: columns, spacing: 20) {
                ForEach(categories.indices, id: \.self) { index in
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 60, height: 60)    
                        .overlay(
                            Image(systemName: categories[index])
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                        )
                        .shadow(radius: 3)
                }
            }
            .padding(20) // Отступы вокруг сетки
        
    }
    
}

#Preview {
    CategoryView()
}
