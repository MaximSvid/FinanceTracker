//
//  ListWalletView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct ListWalletHomeView: View {
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "bar.chart")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .foregroundStyle(.green)
                    .background(Color.blue) // фоновый цвет для выделения
                    .clipShape(Circle())    // делает изображение круглым
                    .overlay(Circle().stroke(Color.white, lineWidth: 2)) // белая обводка
                    .shadow(radius: 5)
                
                VStack (alignment: .leading){
                    Text("Wallet1")
                    
                    Text("1200 Euro")
                }
            }
            
        }
        .frame(maxWidth: 150, maxHeight: 70)
        .background(RoundedRectangle(cornerRadius: 10)
            .fill(.white)
        )
        .shadow(color: .gray.opacity(0.3), radius: 10)
    }
}

#Preview {
    ListWalletHomeView()
}
