//
//  WalletDetailView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 05.11.24.
//

import SwiftUI
import SwiftData

struct WalletDetailView: View {
    var wallet: Wallet
    @Query private var transactions: [MyTransaction]
    
    var body: some View {
        VStack {
            Text ("Wallet: \(wallet.name)")
                .font(.headline)
            
            List(wallet.transactions) { transaction in
                HStack() {
                    VStack {
                        Text(transaction.category.name)
                            .font(.subheadline)
                            .foregroundStyle(.gray)
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Spacer()
                            Text("\(transaction.amount.formatted()) Euro")
                                .font(.footnote)
                        }
                       
                        
                        HStack {
                            Spacer()
                            
                            Text(transaction.date, style: .time)
                                .font(.caption)
                                .foregroundStyle(.gray.opacity(0.7))
                            
                            Text(transaction.date, style: .date)
                                .font(.caption)
                                .foregroundStyle(.gray.opacity(0.7))
                        }
                        
                       
                    }
                    Divider()
                }
//                .listRowSeparator(.hidden)
                .swipeActions {
                    Button(role: .destructive) {
                        transaction.deleteTransaction()
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }
                }
            }
            .listStyle(PlainListStyle())
            
            Divider()
        }
    }
}

#Preview {
    WalletDetailView(wallet: Wallet(name: "", image: "", balance: 0.0))
}
