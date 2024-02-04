//
//  Crypto_TrackerApp.swift
//  Crypto-Tracker
//
//  Created by Dhawal Mahajan on 23/01/24.
//

import SwiftUI

@main
struct Crypto_TrackerApp: App {
    @StateObject private var viewModel = HomeViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
                    
            }
            .environmentObject(viewModel)
        }
    }
}
