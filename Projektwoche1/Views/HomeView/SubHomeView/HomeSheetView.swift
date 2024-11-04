//
//  HomeSheetView.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI
import SwiftData

struct HomeSheetView: View {
    
    @Binding var isHomeSheetPresented: Bool
//    @Binding  var categoryName: String
    var categoryName: String
    
    var body: some View {
        VStack {
            Text(categoryName)
                .font(.title)
            
        }
    }
}

#Preview {
//    HomeSheetView(isHomeSheetPresented: .constant(true ), categoryName: "")
}
