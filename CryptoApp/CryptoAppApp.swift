//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Dmitriy Holovnia on 10/14/21.
//

import SwiftUI

@main
struct CryptoAppApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @Environment(\.scenePhase) private var scenePhase


    init() {
        UITabBar.appearance().backgroundColor = UIColor(named: "main-gray")
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ChartsView()
                    .tabItem {
                        Image("Subtract")
                    }
                    .tag(0)
                ContentView()
                    .tabItem {
                        Image("list")
                    }
                    .tag(1)
            }
            .background(Color("main-gray"))

        }.onChange(of: scenePhase) { phase in
            switch phase {
            case .background:
                print("background")
            case .inactive:
                print("inactive")
            case .active:
                print("active")
            @unknown default:
                print("default")
            }
        }
    }
    
}
