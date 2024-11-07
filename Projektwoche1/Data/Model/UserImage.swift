//
//  UserImage.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 07.11.24.
//

import SwiftUI
import SwiftData

@Model
class UserImage: Identifiable {
    var id: UUID = UUID()
    
    var userImageData: Data?
    
    init(id: UUID, userImageData: Data? = nil) {
        self.id = id
        self.userImageData = userImageData
    }
    
    
}
