//
//  TradingPanelView.swift
//  CryptoApp
//
//  Created by Dmitriy Holovnia on 10/22/21.
//

import SwiftUI

struct TradingPanelView: View {

    @Binding var isPressented: Bool

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()

                Text("Some title")
                    .font(.headline)
                    .foregroundColor(.primary)

                ScrollView(.vertical) {
                    Text("Header")
                    ForEach(0..<20) { index in
                        Text("Index \(index)")
                    }
                }
            }
            .offset(y: geometry.size.height / 2)
            .edgesIgnoringSafeArea(.all)
        }
        .background(Color.white)
    }
}

struct TradingPanelView_Previews: PreviewProvider {
    static var previews: some View {
        TradingPanelView(isPressented: .constant(true))
    }
}
