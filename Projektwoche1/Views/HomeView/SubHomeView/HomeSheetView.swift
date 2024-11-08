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
    
    @Binding var selectedCategory: Category?
    
    
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
        
        ScrollView (.horizontal, showsIndicators: false){
            HStack(spacing: 10) {
                ForEach (wallets, id: \.id) { wallet in
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Image(wallet.image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 35, maxHeight: 35)
                                .clipShape(.buttonBorder)
                            
                            Spacer()
                        }
                        
                        
                        Text(wallet.name)
                            .font(.callout)
                            .foregroundStyle(.gray)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(wallet.balance.formatted()) Euro")
                            .font(.footnote)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .frame(width: 150, height: 100)
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.white))
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedWallet == wallet ? Color.blue.opacity(0.5) : Color.clear, lineWidth: 2)
//                            .fill(Color.white)
                            
                    )
//                    .shadow(color: selectedWallet == wallet ? Color.blue.opacity(0.4) : Color.gray.opacity(0.3), radius: 10)
                    .onTapGesture {
                        selectedWallet = wallet
                    }
                    
                }
            }
        }
        .shadow(color: .gray, radius: 10, x: 0, y: 5)
        .padding(.leading)
        .padding(.bottom)

//        Divider()
        
        

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
//                    isHomeSheetPresented.toggle()
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
        wallet.balance -= amount
        
        let transaction = MyTransaction(id: UUID(), amount: amount, category: Category(id: UUID(), name: categoryName, icon: categoryImage))
        wallet.transactions.append(transaction)
        
        context.insert(wallet)
        context.insert(transaction)
        
        walletBalanceString = ""
        
        selectedCategory = nil
        
            }
}

#Preview {
//        HomeSheetView()
}
