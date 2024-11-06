//
//  SheetDeleteCategory.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 06.11.24.
//

import SwiftUI

struct SheetDeleteCategory: View {
    @Binding var isSheetDeleteCategoryPresented: Bool
    @Binding var category: [Category]
    
    
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
                        
                        List(category, id: \.self) { categor in
                            HStack {
                                Image(systemName: categor.icon)
                                    .frame(maxWidth: 45, maxHeight: 45)
                                    .clipShape(Circle())
                                
                                Text(categor.name)
                                    .font(.headline)
                            }
                        }
                        .listStyle(PlainListStyle())
                        
                    }
                    .presentationDragIndicator(.visible)
//                    SheetNewWalletView(isSheetPresented: $isSheetPresented, newWalletIcon: $walletImage, walletName: $walletName, walletBalance: $walletBalance)
//                        .presentationDetents([.fraction(0.8)])
//                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

#Preview {
//    SheetDeleteCategory(category: )
}
