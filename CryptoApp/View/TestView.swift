//
//  TestView.swift
//  CryptoApp
//
//  Created by Dmitriy Holovnia on 10/22/21.
//

import SwiftUI

struct TestView: View {
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Text("Header")
                Spacer()
            }
            .frame(height: 70)
            .background(Color.blue)
            List {
                ForEach(0..<20) { index in
                    HStack {
                        Text("Index: \(index)")
                            .foregroundColor(.white)
                            .padding(.leading, 15)
                        Spacer()
                    }
                    .frame(minHeight: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white, lineWidth: 1)
                    )
                    .padding([.horizontal, .top], 15)
                    .background(Color.black)
                }
                .listRowInsets(EdgeInsets())
            }
            .listStyle(.plain)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
