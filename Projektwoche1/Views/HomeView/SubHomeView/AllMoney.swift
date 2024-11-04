//
//  AllMoney.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct AllMoney: View {
    var body: some View {
        VStack {
            HStack {
                Text ("All the money:")
                    .font(.headline)
                Text("1200 Euro")
            }
            .padding()
        }
        .frame(maxWidth: .infinity)
        .background(RoundedRectangle(cornerRadius: 10).fill(.white))
        .shadow(color: .gray.opacity(0.3), radius: 10)
//        .padding(.bottom)
    }
}

#Preview {
    AllMoney()
}
