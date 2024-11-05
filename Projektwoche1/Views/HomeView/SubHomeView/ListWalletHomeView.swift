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
        
        Divider()
        
        ScrollView (.horizontal, showsIndicators: false){
            HStack(spacing: 10) {
                ForEach (wallet, id: \.id) { wall in
                    VStack(alignment: .leading) {
                        Image(systemName: wall.image.isEmpty ? "wallet.pass" : wall.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: 50, maxHeight: 50)
//                            .fixedSize(horizontal: true, vertical: true)
                            .clipShape(Circle())
                        
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
//        .padding(.top)
//        .padding(.bottom)
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
/*
 VStack {
     HStack {
         Image(systemName: wall.image)
//                            Image("money1")
             .resizable()
             .scaledToFit()
             .frame(width: 40, height: 40)
//                                .foregroundStyle(.green)
             .clipShape(Circle())
         
         Spacer()
     }
     
     HStack {
         VStack (alignment: .leading){
             Text(wall.name)
             
             Text(wall.balance.formatted())
             
             Spacer()
         }
     }
     
    
 }
 .frame(width: 200, height: 80)
 .background(RoundedRectangle(cornerRadius: 10).fill(.white))
 .shadow(color: .blue, radius: 10, x: 0, y: 0)
 */
