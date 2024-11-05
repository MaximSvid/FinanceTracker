//
//  HomeSheetView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI
import SwiftData

struct HomeSheetView: View {
    
    @Environment(\.modelContext) private var context
    
    var wallets: [Wallet]
    
    @Binding var isHomeSheetPresented: Bool
    
    var categoryName: String
    var categoryImage: String
    
    @State private var walletBalanceString: String = ""
    @State private var selectedWallet: Wallet?
    
    
    var body: some View {
        HStack {
            Text("Category: \(categoryName)")
                .font(.title)
            Image(systemName: categoryImage)
                .padding(.leading)
                .font(.title)
                .foregroundStyle(.blue)
        }
        .padding()
        HStack {
            
            ScrollView (.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(wallets, id: \.self) { wallet in
                        ZStack {
                            HStack {
                                Image(systemName: wallet.image)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 45, height: 45)
                                    .background(Color.gray.opacity(0.1))
                                    .clipShape(Circle())
                                    .padding(.leading)
                                
                                HStack {
                                    Text(wallet.name)
                                        .font(.footnote)
                                        .padding(.bottom, 5)
                                    
                                    Spacer()
                                    HStack {
                                        Text("\(wallet.balance.formatted()) Euro")
                                            .font(.footnote)
                                            .foregroundStyle(.gray)
                                    }
                                    
                                }
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: 60)
                        .background(RoundedRectangle(cornerRadius: 10)
                            .fill(.white))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(selectedWallet == wallet ? Color.blue : Color.clear, lineWidth: 2)
                        )
                        .shadow(color: .gray.opacity(0.3), radius: 10)
                        .onTapGesture {
                            selectedWallet = wallet
                        }
                        .padding(.bottom)
                    }
                }
                
                
            }
        }
        VStack(spacing: 10) {
            
            HStack {
                Text("Summe:")
                    .font(.subheadline)
                Spacer()
            }
            .padding()
            
            TextField("Enter amount", text: $walletBalanceString)
                .keyboardType(.decimalPad)
                

                .onSubmit {
                    
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10)
                    .fill(Color.white)
                )
                .shadow(color: .gray.opacity(0.3), radius: 10)
                .padding(.bottom)
                .padding(.leading)
                .padding(.trailing)

            
            VStack {
                Button {
                    saveWalletBalance()
                    isHomeSheetPresented = false
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
    
    private func saveWalletBalance() {
        guard let wallet = selectedWallet, let amount = Double(walletBalanceString) else {
            return print("Invalid amount")
        }
        context.insert(wallet)
        
        walletBalanceString = ""
    }
}

#Preview {
    //    HomeSheetView(isHomeSheetPresented: .constant(true ), categoryName: "")
}
