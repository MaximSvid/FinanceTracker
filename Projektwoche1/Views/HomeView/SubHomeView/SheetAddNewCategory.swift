//
//  SheetAddNewCategory.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 06.11.24.
//

import SwiftUI
import SwiftData

struct SheetAddNewCategory: View {
    
    @Environment(\.modelContext) private var modelContext
    @Binding var isSheetNewCategoryPresented: Bool
    @Binding var categories: [Category]
    
    @State private var categoryName: String = ""
    @State private var newCategoryIcon: String = ""
    
    var categoryIcons = [
        "cart.fill",
        "fork.knife",
        "car.fill",
        "house.fill",
        "bolt.fill",
        "phone.fill",
        "graduationcap.fill",
        "tshirt.fill",
        "cross.fill",
        "sparkles",
        "briefcase.fill",
        "airplane",
        "book.fill",
        "gamecontroller.fill",
        "film.fill",
        "music.note",
        "pawprint.fill",
        "sportscourt.fill",
        "bicycle",
        "gift.fill",
        "heart.fill",
        "figure.walk",
        "chart.line.uptrend.xyaxis",
        "creditcard.fill",
        "bed.double.fill",
        "leaf.fill",
        "bus.fill",
        "fuelpump.fill",
        "desktopcomputer",
        "wand.and.stars"
    ]
    
    
    var body: some View {
        VStack {
            
            Text ("Add new Category")
                .font(.title)
            
            VStack {
                HStack {
                    Text("Choose the icon")
                        .font(.subheadline)
                    Spacer()
                }
                
            }
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack (spacing: 10) {
                    ForEach(categoryIcons, id: \.self) { categoryIcon in
                        Image(systemName: categoryIcon)
                            .resizable()
                            .frame(maxWidth: 35, maxHeight: 35)
                            .scaledToFit()
                            .cornerRadius(10)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10)
                                .fill(.white))
                        
                            .onTapGesture {
                                newCategoryIcon = categoryIcon
                            }
                            .overlay(newCategoryIcon == categoryIcon ? RoundedRectangle (cornerRadius: 10).stroke(.blue.opacity(0.5), lineWidth: 3): nil)
                    }
                }
            }
            
            HStack {
                Text("Category name")
                    .font(.subheadline)
                Spacer()
            }
            TextField("Category name", text: $categoryName)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                )
                .shadow(color: .gray.opacity(0.3), radius: 10)
                .padding(.bottom)
            
            Button {
                saveNewCategory()
                isSheetNewCategoryPresented.toggle()
            } label: {
                Text ("Save")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .padding()
                    .background(.blue.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(.leading)
        .padding(.trailing)
        
    }
    private func saveNewCategory() {
        let newCategory = Category(id: UUID(), name: categoryName, icon: newCategoryIcon)
        
        modelContext.insert(newCategory)
        
        categories.append(newCategory)
        
        categoryName = ""
        
    }
}


#Preview {
    SheetAddNewCategory(isSheetNewCategoryPresented: .constant(true), categories: .constant([]))
}
