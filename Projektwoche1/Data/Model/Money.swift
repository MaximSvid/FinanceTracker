//
//  Money.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 12.11.24.
//
import SwiftUI
import SwiftData

@Model
class Money {
    var id: UUID = UUID()
    var moneyMonth: Double
    
    init(id: UUID, moneyMonth: Double) {
        self.id = id
        self.moneyMonth = moneyMonth
    }
}
