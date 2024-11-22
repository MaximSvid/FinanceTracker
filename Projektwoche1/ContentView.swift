//
//  ContentView.swift
//  Projektwoche1
//
//  Created by Felix B on 03.11.24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var homeViewModel: HomeViewModel
    var body: some View {
        AppNavigation(homeViewModel: homeViewModel)
    }
}

#Preview {
    ContentView(homeViewModel: HomeViewModel())
}
