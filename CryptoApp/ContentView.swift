//
//  ContentView.swift
//  CryptoApp
//
//  Created by Dmitriy Holovnia on 10/14/21.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var appDelegate: AppDelegate
    
    var body: some View {
        Text(appDelegate.someText)
            .padding()
    }
}

struct CircleView: View {
    var body: some View {
        VStack {
            Circle().foregroundColor(Color.blue)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
