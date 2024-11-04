//
//  AddNewWallet.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct AddNewWallet: View {
    
//    @State var descriptionOfExpenditures: String = ""
    @State private var isSheetPresented: Bool = false
    
    @State var walletImage: String = ""
    @State var walletName: String = ""
    @State var walletBalance: Double = 0.0
    
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                
                Button (action: {
                    isSheetPresented.toggle()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.green)
                        .font(.title)
                }
                .sheet(isPresented: $isSheetPresented) {
                    SheetNewWalletView(isSheetPresented: $isSheetPresented, newWalletIcon: $walletImage, walletName: $walletName, walletBalance: $walletBalance)
                        .presentationDetents([.fraction(0.8)])
                        .presentationDragIndicator(.visible)
                }
            }
        }
    }
}

#Preview {
    AddNewWallet()
}
