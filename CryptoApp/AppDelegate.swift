//
//  AppDelegate.swift
//  CryptoApp
//
//  Created by Dmitriy Holovnia on 10/14/21.
//

import UIKit


class AppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    @Published var someText = "Hello, SwiftUI!"
    
    func application(
        _ application: UIApplication,
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print(#function)
        return true
    }
    
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        // init firebase
        print(#function)
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        print(#function)
    }
    
    // not working
    func applicationWillEnterForeground(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        print(#function)
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        print(#function)
    }
}

