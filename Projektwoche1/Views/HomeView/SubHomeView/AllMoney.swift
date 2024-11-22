//
//  AllMoney.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI
import SwiftData

struct AllMoney: View {
    @StateObject private var homeViewModel: HomeViewModel
    
    @Environment(\.modelContext) private var context
    var wallet: [Wallet]
    
    init(wallet: [Wallet], context: ModelContext) {
        self.wallet = wallet
        self._homeViewModel = StateObject(wrappedValue: HomeViewModel(context: context))
    }
    
    var body: some View {
        ZStack {
            if homeViewModel.totalAmount == 0 {
                HStack {
                    Text("Set the amount")
                        .font(.headline)
                        .padding()
                    
                    Button(action: {
                        homeViewModel.isPresented.toggle()
                    }) {
                        Image(systemName: "pencil")
                            .font(.title2)
                            .frame(width: 10, height: 10)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                            .foregroundStyle(.white)
                            .shadow(radius: 3)
                    }
                }
                .frame(width: .infinity, height: 50)
                
                
            } else {
                let currentBalance = wallet.reduce(0) { $0 + $1.balance }
                let totalOperationsAmount = wallet.flatMap { $0.transactions }.reduce(0) { $0 + $1.amount }
                let remainingAmount = homeViewModel.totalAmount - totalOperationsAmount
                

                
                HStack {
                    if remainingAmount > 0 {
                        ProgressView(value: remainingAmount, total: homeViewModel.totalAmount) {
                            Text("Total amount: \(currentBalance, specifier: "%.2f") Euro")
                            Divider()
                            Text("Planned monthly expenses: \(remainingAmount, specifier: "%.2f") Euro")
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            homeViewModel.isPresented.toggle()
                        }) {
                            Image(systemName: "pencil")
                                .font(.title2)
                                .frame(width: 10, height: 10)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                                .foregroundStyle(.white)
                                .shadow(radius: 3)

                        }
                    } else  {
                        Text("Set the amount")
                            .font(.headline)
                            .padding()
                        
                        Button(action: {
                            homeViewModel.isPresented.toggle()
                        }) {
                            Image(systemName: "pencil")
                                .font(.title)
                                .frame(width: 10, height: 10)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                                .foregroundStyle(.white)
                        }
                    }
                    
                }
                .frame(width: .infinity, height: 50)
                .onAppear {

                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
        .shadow(color: .gray.opacity(0.3), radius: 10)
        .sheet(isPresented: $homeViewModel.isPresented) {
            VStack {
                Text("Enter your planned monthly expenses:")
                    .font(.title)
                
                VStack(spacing: 10) {
                    HStack {
                        Text("Summe:")
                            .font(.subheadline)
                        Spacer()
                    }
                    .padding()
                    
                    TextField("Enter amount", text: $homeViewModel.sumString)
                        .keyboardType(.decimalPad)
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
                            homeViewModel.saveNewSum()
                            homeViewModel.isPresented.toggle()
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
                .padding()
            }
        }
    }
}

#Preview {
//    AllMoney(wallet: [Wallet(name: "Wallet 1", image: "gloab", balance: 5000.0)], context: Mo)
}
