//
//  Untitled.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//
import Foundation
import SwiftData

@Model
class Wallet {
        
    var name: String = ""
    var image: String = ""
    var balance: Double = 0.0
//    var WalletDescription: String = ""
    var catecogires: [Category] = []
    
    init(name: String, image: String, balance: Double) {
        self.name = name
        self.image = image
        self.balance = balance
//        self.WalletDescription = WalletDescription
    }
    
//    func addNewCategory(category: Category) {
//        modelContext?.append(self)
//    }
}
