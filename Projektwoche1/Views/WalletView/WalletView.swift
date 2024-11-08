//
//  WalletView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct WalletView: View {
    
    
    var body: some View {
        NavigationStack {
            VStack {
                AddNewWallet()
                ListWalletView()
                    
            }

        }
       
    }
    
   
}

#Preview {
    WalletView()
}
