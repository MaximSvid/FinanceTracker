//
//  HomeViewModel.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 22.11.24.
//

import Foundation

@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var isPresented: Bool = false
    @Published var sumString: String = ""
    @Published var totalAmount: Double = 0.0
    
}
