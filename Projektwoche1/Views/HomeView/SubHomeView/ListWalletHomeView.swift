//
//  ListWalletView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct ListWalletHomeView: View {
    
    var wallet: [Wallet]
    
    var body: some View {
        
        ScrollView (.horizontal, showsIndicators: false){
            HStack(spacing: 20) {
                ForEach (wallet, id: \.id) { wall in
                    HStack {
                        Image(systemName: wall.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .foregroundStyle(.green)
                            .background(Color.blue)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 2))
                            .shadow(radius: 5)
                        
                        VStack (alignment: .leading){
                            Text(wall.name)
                            
                            Text(wall.balance.formatted())
                        }
                    }
                }
            }   
        }
        
    }
}

#Preview {
    ListWalletHomeView(wallet: [Wallet(name: "", image: "", balance: 0.0)])
}
