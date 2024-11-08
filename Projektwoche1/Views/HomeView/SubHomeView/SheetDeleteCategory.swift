//
//  SheetDeleteCategory.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 06.11.24.
//

import SwiftUI

struct SheetDeleteCategory: View {
    @Environment(\.modelContext) private var modelContext
    @Binding var isSheetDeleteCategoryPresented: Bool
    @Binding var categories: [Category]
    
    @State private var showAlert: Bool = false
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button (action: {
                    isSheetDeleteCategoryPresented.toggle()
                }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundStyle(.green)
                        .font(.title)
                }
                .sheet(isPresented: $isSheetDeleteCategoryPresented) {
                    VStack {
                        
                        Text ("Delete Category")
                            .font(.title)
                            .padding(.top)
                        
                        List(categories, id: \.self) { categor in
                            HStack {
                                Image(systemName: categor.icon)
                                    .frame(maxWidth: 45, maxHeight: 45)
                                    .clipShape(Circle())
                                
                                Text(categor.name)
                                    .font(.headline)
                            }
                            .swipeActions {
                                Button(role: .destructive) {
                                    deleteCategory(categor)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                        }
                        
                        }
                        .listStyle(PlainListStyle())
                                                
                        Button(action: {
                            showAlert = true
                        }) {
                            Text("All Deleted")
                        }
                        .alert(isPresented: $showAlert) {
                            Alert(
                                title: Text("Delete all categories?"),
                                primaryButton: .default(
                                    Text("Cancel"),
                                    action: {
                                        showAlert = false
                                    }
                                ),
                                secondaryButton: .destructive(
                                    Text("Delete"),
                                    action: {
                                        showAlert = false
                                        deleteAllCategories()
                                        isSheetDeleteCategoryPresented.toggle()
                                    }
                                )
                            
                            )
                        }
                        
                        
                    }
                    .presentationDragIndicator(.visible)
                }
            }
        }
    }
    
    private func deleteCategory(_ category: Category) {
        modelContext.delete(category)
        
        if let index = categories.firstIndex(where: { $0.id == category.id}) {
            categories.remove(at: index)
        }
    }
    
    private func deleteAllCategories() {
       for category in categories {
           modelContext.delete(category)
        }
        categories.removeAll()
    }
}

#Preview {
//    SheetDeleteCategory(category: )
}
