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
            HStack(spacing: 10) {
                ForEach (wallet, id: \.id) { wall in
                    VStack(alignment: .leading) {
                        
                        HStack {
                            Image(wall.image)
                                .resizable()
                                .scaledToFit()
                                .frame(maxWidth: 35, maxHeight: 35)
                                .clipShape(.buttonBorder)
                            
                            Spacer()
                        }
                        
                        
                        Text(wall.name)
                            .font(.callout)
                            .foregroundStyle(.gray)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Text("\(wall.balance.formatted()) Euro")
                            .font(.footnote)
                            .lineLimit(1)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10)
                        .fill(.white)
                    )
                    .frame(width: 150, height: 100)
                    .fixedSize(horizontal: false, vertical: true)
                    
                }
            }
        }
        .shadow(color: .gray, radius: 10, x: 0, y: 5)
        .padding(.leading)
        Divider()
    }
}

#Preview {
    ListWalletHomeView(wallet: [
        Wallet(name: "Testasdfasdf", image: "money1", balance: 123321123321.0),
        Wallet(name: "Testf", image: "money1", balance: 123321123321.0),
        Wallet(name: "Testasdfasdfasdfasdfasdf", image: "money1", balance: 123321123321.0),
                               
                               ]
    )
}
