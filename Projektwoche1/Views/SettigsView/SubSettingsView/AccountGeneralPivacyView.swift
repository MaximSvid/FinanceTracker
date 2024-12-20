//
//  AccountSettingsView2.swift
//  Projektwoche1
//
//  Created by Maxim Svidrak on 07.11.24.
//

import SwiftUI

struct AccountGeneralPivacyView: View {
    //Account
    @AppStorage("username") var username: String = ""
    @AppStorage("userEmail") var userEmail: String = ""
    
    @AppStorage("phoneNumber") var phoneNumber: String = ""
    @AppStorage("password") var password: String = ""
    
    //General
    //    @AppStorage("language") var language: String = ""
    @State private var selectedLanguage: Language = .english
    
    //    @Environment(\.colorScheme) var colorScheme
    @AppStorage("darkMode") var darkMode: Bool = false
    @AppStorage("showNotifications") var showNotifications: Bool = false
    
    @AppStorage("sliderValue") private var sliderValue: Double = 50.0
    
    var body: some View {
        
        HStack {
            Text("Settings")
                .font(.title.bold())
                .padding(.leading)
        }
        
        List {
            
            HStack {
                Spacer()
                ImageSettingsView1()
                Spacer()
            }
            .listRowSeparator(.hidden)
            
            
            Section(header: Text("Account")) {
                TextField("Username", text: $username)
                TextField("Email", text: $userEmail)
                TextField("Phone number", text: $phoneNumber)
                    .keyboardType(.numberPad)
                SecureField("Password", text: $password)
            }
            
            Section(header: Text("General")) {
                Picker("Language", selection: $selectedLanguage) {
                    ForEach(Language.allCases) { language in
                        Text(language.rawValue).tag(language)
                    }
                }
                
                Toggle("Dark Mode", isOn: $darkMode)
                Toggle("Show Notifications", isOn: $showNotifications)
                
//                Slider(value: $sliderValue, in: 0...100, step: 1) {
//                    Text("Volume")
//                } minimumValueLabel: {
//                    Text("0")
//                } maximumValueLabel: {
//                    Text("100")
//                }
//                
//                Text("Volume: \(Int(sliderValue))")
            }
            
        }
        .listStyle(PlainListStyle())
        
        .preferredColorScheme(darkMode ? .dark : .light)
        
    }
}

#Preview {
    AccountGeneralPivacyView()
}
