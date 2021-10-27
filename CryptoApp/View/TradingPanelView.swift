//
//  TradingPanelView.swift
//  CryptoApp
//
//  Created by Dmitriy Holovnia on 10/22/21.
//

import SwiftUI

struct TradingPanelView: View {

    @Binding var isAppear: Bool

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(Color.red)
            .frame(height: 400)
            .onTapGesture {
                isAppear = false
            }
    }
}

struct TradingPanelView_Previews: PreviewProvider {
    @State static var isAppear = true
    static var previews: some View {
        TradingPanelView(isAppear: $isAppear)
    }
}
