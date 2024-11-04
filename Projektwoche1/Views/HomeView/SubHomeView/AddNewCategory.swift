//
//  AddNewCategory.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftUI

struct AddNewCategory: View {
    var body: some View {
        VStack {
            Button(action: {
//                saveJob()
//                presentationMode.wrappedValue.dismiss()
            }) {
                
                Text("Add New Category")
                    .frame(maxWidth: .infinity)
                    .font(.headline)
                    .padding()
                    .background(.green.opacity(0.8))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding(.leading)
        .padding(.trailing)
        }
    }


#Preview {
    AddNewCategory()
}
