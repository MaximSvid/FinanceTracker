//
//  HomeView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            AllMoney()
            ListWalletView()
            
            Spacer()
        }
    }
}

#Preview {
    HomeView()
}
