//
//  SheetNewWalletView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI
import SwiftData

struct SheetNewWalletView: View {
    
    @Environment(\.modelContext) private var context
    @Binding var isSheetPresented: Bool
    @Binding var newWalletIcon: String
    
    @Binding var walletName: String
    @Binding var walletBalance: Double
    
    
//    var walletIcons = [
//        "dollarsign.circle",
//        "eurosign.circle",
//        "bitcoinsign.circle",
//        "yensign.circle",
//        "sterlingsign.circle",
//        "lirasign.circle",
//        "pesetasign.circle",
//        "pesosign.circle",
//        "shekelsign.circle",
//        "dongsign.circle",
//        "tugriksign.circle",
//        "bahtsign.circle",
//        "kipsign.circle",
//        "rupeesign.circle",
//        "rial.circle",
//        "banknote.circle",
//        "banknote.circle.fill",
//       
//    ]
    
    var walletIcons = [
        "wallet1",
        "wallet2",
        "wallet3",
        "wallet4",
        "wallet5",
        "wallet6",
        "wallet7",
        "wallet8",
        "wallet9"
        
    ]
    
    
    var body: some View {
        VStack {
            
            Text ("Add new Wallet")
                .font(.title)
            
            VStack {
                HStack {
                    Text("Image")
                        .font(.subheadline)
                    Spacer()
                }
                
                Divider()
                
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack (spacing: 10) {
                        ForEach(walletIcons, id: \.self) { walletIcon in
                            Image(walletIcon)
                                .resizable()
                                .frame(maxWidth: 35, maxHeight: 35)
                                .scaledToFit()
                                .cornerRadius(10)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10)
                                    .fill(.white))

                                .onTapGesture {
                                    newWalletIcon = walletIcon
                                }
                                .overlay(newWalletIcon == walletIcon ? RoundedRectangle (cornerRadius: 10).stroke(.blue.opacity(0.5), lineWidth: 3): nil)
                        }
                    }
                }
                
                Divider()
                
                SheetNameSum(walletName: $walletName, walletBalance: $walletBalance)
                
                Button {
                    saveWallet()
                    isSheetPresented.toggle()
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
        
    }
    
    private func saveWallet() {
        let newWallet = Wallet(name: walletName, image: newWalletIcon, balance: walletBalance)
        
        context.insert(newWallet)
        
        walletName = ""
        walletBalance = 0.0
        
    }
    
}

#Preview {
    SheetNewWalletView(isSheetPresented: .constant(true), newWalletIcon: .constant(""), walletName: .constant(""), walletBalance: .constant(0.0))
}
