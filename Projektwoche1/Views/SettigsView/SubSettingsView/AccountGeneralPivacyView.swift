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
//    @AppStorage("userBirthday") var userBirthday: String = ""
//    @State private var birthday: Date = Date()
    @AppStorage("phoneNumber") var phoneNumber: String = ""
    @AppStorage("password") var password: String = ""

    //General
//    @AppStorage("language") var language: String = ""
    @State private var selectedLanguage: Language = .english
    
    @AppStorage("darkMode") var darkMode: Bool = false
    @AppStorage("showNotifications") var showNotifications: Bool = false
    
    var body: some View {
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
                
                
                
            }
        }
        .listStyle(PlainListStyle())
    }
}

#Preview {
    AccountGeneralPivacyView()
}
