//
//  AllMoney.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct AllMoney: View {
    @Environment(\.modelContext) private var context
    @State private var isPresented: Bool = false
    @State private var sumString: String = ""
    @State private var totalAmount: Double = 0.0
   
    
    var wallet: [Wallet]
    
    var body: some View {
        ZStack {
            if totalAmount == 0 {
                HStack {
                    Text("Set the amount")
                        .font(.headline)
                        .padding()
                    
                    Button(action: {
                        isPresented.toggle()
                    }) {
                        Image(systemName: "pencil")
                            .font(.title)
                            .frame(width: 10, height: 10)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                            .foregroundStyle(.white)
                    }
                }
                
                
            } else {
                let currentBalance = wallet.reduce(0) { $0 + $1.balance }
                let totalOperationsAmount = wallet.flatMap { $0.transactions }.reduce(0) { $0 + $1.amount }
                let remainingAmount = totalAmount - totalOperationsAmount
                

                
                HStack {
                    if remainingAmount > 0 {
                        ProgressView(value: remainingAmount, total: totalAmount) {
                            Text("Total amount: \(currentBalance, specifier: "%.2f") Euro")
                            Divider()
                            Text("Planned monthly expenses: \(remainingAmount, specifier: "%.2f") Euro")
                            
                        }
                        
                        Spacer()
                        
                        Button(action: {
                            isPresented.toggle()
                        }) {
                            Image(systemName: "pencil")
                                .font(.title)
                                .frame(width: 10, height: 10)
                                .padding()
                                .background(RoundedRectangle(cornerRadius: 10).fill(.green))
                                .foregroundStyle(.white)
                        }
                    } else  {
                        Text("Set the amount")
                            .font(.headline)
                            .padding()
                        
                        Button(action: {
                            isPresented.toggle()
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
                .padding()
                .onAppear {
//                    updateTotalAmountIfNeeded(remainingAmount: remainingAmount)
                }
            }
        }
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
        .shadow(color: .gray.opacity(0.3), radius: 10)
        .sheet(isPresented: $isPresented) {
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
                    
                    TextField("Enter amount", text: $sumString)
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
                            saveNewSumme()
                            isPresented.toggle()
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
    
    private func saveNewSumme() {
        guard let amount = Double(sumString) else { return }
        
        let newAmount = Money(id: UUID(), moneyMonth: amount)
        
        context.insert(newAmount)
        
        totalAmount = amount
        
        sumString = ""
    }
    
//    private func updateTotalAmountIfNeeded(remainingAmount: Double) {
//            if remainingAmount <= 0 {
//                totalAmount = 0.0
//            }
//        }
    
}

#Preview {
    AllMoney(wallet: [Wallet(name: "Wallet 1", image: "gloab", balance: 5000.0)])
}
