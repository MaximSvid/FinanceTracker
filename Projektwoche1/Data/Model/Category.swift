//
//  Category.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 04.11.24.
//

import SwiftData
import Foundation

@Model
class Category: Identifiable {
    var id: UUID = UUID()
    
    var name: String = ""
    var icon: String = ""
    
    init(id: UUID, name: String, icon: String) {
        self.id = id
        self.name = name
        self.icon = icon
    }
}
