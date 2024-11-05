//
//  Transaction.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 05.11.24.
//

import SwiftUI
import SwiftData

@Model
class Transaction: Identifiable {
    var id: UUID = UUID()
    var amount: Double = 0.0
    var date: Date = Date()
    var category: Category
    
    init(id: UUID, amount: Double, category: Category) {
        self.id = id
        self.amount = amount
        self.category = category
    }
}
