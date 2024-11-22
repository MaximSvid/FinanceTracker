//
//  HomeViewModel.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 22.11.24.
//

import Foundation
import SwiftData
//import Combine

@MainActor
class AllMoneyViewModel: ObservableObject {
    
    @Published var isPresented: Bool = false
    @Published var sumString: String = ""
    @Published var totalAmount: Double = 0.0
    
    private var context: ModelContext
    
    init(context: ModelContext){
        self.context = context
    }
    
    func saveNewSum() {
        guard let amount = Double(sumString) else { return }
        let newAmount = Money(id: UUID(), moneyMonth: amount)
        
        context.insert(newAmount)
        totalAmount += amount
        sumString = ""
    }
    
}
