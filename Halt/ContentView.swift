//
//  ContentView.swift
//  Halt
//
//  Created by Chidu Anush on 02/02/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showOnboarding = false

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }

            InterruptionScreenSettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }

            ReadView()
                .tabItem {
                    Label("Read", systemImage: "book")
                }
        }
        .onAppear {
            if !UserDefaults.standard.bool(forKey: "hasLaunchedBefore") {
                UserDefaults.standard.set(true, forKey: "hasLaunchedBefore")
                showOnboarding = true
            }
        }
        .sheet(isPresented: $showOnboarding) {
            OnBoardingView()
        }
    }
}


#Preview {
    ContentView()
}
