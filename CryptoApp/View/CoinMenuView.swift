//
//  CoinMenuView.swift
//  CryptoApp
//
//  Created by Dmitiy Golovnia on 21.10.2021.
//

import SwiftUI

struct CoinMenuView: View {
    
    var coin: Coin
    
    var body: some View {
        HStack {
            Image(coin.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
                .padding(.leading, 15)
                
            VStack(alignment: .leading) {
                Text(coin.name + "/USD")
                    .foregroundColor(.white)
                Text(coin.stock)
                    .foregroundColor(.white)
                    .font(.caption)
            }
            Divider()
                .background(Color.white)
                .padding(.vertical, 10)
            Button(action: {
                print(#function)
            }) {
                Image("close")
            }
            .padding(.trailing, 20)
        }
        .background(Color("main-black"))
        .clipShape(CoinMenuShape(offset: 10))
    }
    
    
}

struct CoinMenuShape: Shape {
    var offset: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.height))
        // 1
        path.addCurve(to: CGPoint(x: offset, y: rect.height - offset),
                      control1: CGPoint(x: 0, y: rect.height),
                      control2: CGPoint(x: offset, y: rect.height))
        // 2
        path.addCurve(to: CGPoint(x: offset, y: offset),
                      control1: CGPoint(x: offset, y: rect.height - offset * 2),
                      control2: CGPoint(x: offset, y: offset))
        // 3
        path.addCurve(to: CGPoint(x: offset * 2, y: 0),
                      control1: CGPoint(x: offset, y: offset),
                      control2: CGPoint(x: offset, y: 0))
        // 4
        path.addCurve(to: CGPoint(x: rect.width - offset * 2, y: 0),
                      control1: CGPoint(x: rect.width - offset * 2, y: 0),
                      control2: CGPoint(x: rect.width - offset * 2, y: 0))
        // 5
        path.addCurve(to: CGPoint(x: rect.width - offset, y: offset),
                      control1: CGPoint(x: rect.width - offset * 2, y: 0),
                      control2: CGPoint(x: rect.width - offset, y: 0))
        // 6
        path.addCurve(to: CGPoint(x: rect.width - offset, y: rect.height - offset),
                      control1: CGPoint(x: rect.width - offset, y: offset * 2),
                      control2: CGPoint(x: rect.width - offset, y: rect.height - offset))
        // 7
        path.addCurve(to: CGPoint(x: rect.width, y: rect.height),
                      control1: CGPoint(x: rect.width - offset, y: rect.height - offset),
                      control2: CGPoint(x: rect.width - offset, y: rect.height))
        path.closeSubpath()
        return path
    }
}


struct CoinMenuView_Previews: PreviewProvider {
    static var previews: some View {
        CoinMenuView(coin: Coin.allCoins.first!)
            .previewLayout(.sizeThatFits)
            .frame(height: 50)
    }
}
