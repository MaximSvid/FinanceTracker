//
//  AddNewCategory.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct AddNewCategory: View {
    @State var isSheetNewCategoryPresented: Bool = false
    @Binding var categories: [Category]
    
    var body: some View {
        VStack {
            
            
            Button(action: {
                isSheetNewCategoryPresented.toggle()
            }) {
                
                Text("Add New Category")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .padding()
                    .background(.green.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .sheet(isPresented: $isSheetNewCategoryPresented) {
                SheetAddNewCategory(isSheetNewCategoryPresented: $isSheetNewCategoryPresented, categories: $categories)
                    .presentationDetents([.fraction(0.5)])
                    .presentationDragIndicator(.visible)
            }
        }
        .padding(.leading)
        .padding(.trailing)
        .padding(.bottom)
        }
    }


#Preview {
    AddNewCategory(categories: .constant([]))
}
