//
//  ListWalletUniversal.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct ListWalletUniversalView: View {
    var wallet: Wallet
    var body: some View {
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
                        Text(wallet.balance.formatted())
                            .font(.footnote)
                        
                        Text("Euro")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                            .padding(.trailing)
                    }
                    
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 60)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.white))
        .shadow(color: .gray.opacity(0.3), radius: 10)
//        .padding(.bottom)
    }
}

#Preview {
    ListWalletUniversalView(wallet: Wallet(name: "", image: "", balance: 0.0))
}
