//
//  TradingContolView.swift
//  CryptoApp
//
//  Created by Dmitiy Golovnia on 21.10.2021.
//

import SwiftUI

enum TimeLine: CaseIterable {
    case all, hour, halfHour, fifteenMin, fiveMin
    
    var value: String {
        switch self {
        case .all: return "all"
        case .hour: return "1h"
        case .halfHour: return "30m"
        case .fifteenMin: return "15m"
        case .fiveMin: return "5m"
        }
    }
}

struct TradingContolView: View {
    
    @Binding var timeLine: TimeLine
    
    let investAction: () -> Void
    let changeMultipiler: () -> Void
    let sellAction: () -> Void
    let buyAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "gear")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                Image("trading-graph")
                    .frame(maxWidth: .infinity)
                ForEach(TimeLine.allCases, id: \.self) { time in
                    Text(time.value)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(timeLine == time ? .yellow : .white)
                        .onTapGesture {
                            timeLine = time
                        }
                }
            }
            .padding(.top)
            VStack {
                HStack(spacing: 10) {
                    Button {
                        investAction()
                    } label: {
                        Text("Invest")
                            .padding(.leading, 15)
                            .foregroundColor(.white)
                            .opacity(0.2)
                        Spacer()
                        Text("$100")
                            .padding(.trailing, 15)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 46)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("light-gray")))
                    Button {
                        changeMultipiler()
                    } label: {
                        Text("Multiplier")
                            .padding(.leading, 15)
                            .foregroundColor(.white)
                            .opacity(0.2)
                        Spacer()
                        Text("5x")
                            .padding(.trailing, 15)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, minHeight: 46)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color("light-gray")))
                }
                .padding(.bottom, 5)
                .frame(height: 50)
                HStack(spacing: 10) {
                    Button {
                        sellAction()
                    } label: {
                        Image("sell")
                        Text("Sell")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, minHeight: 46)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color("main-red")))
                    Button {
                        buyAction()
                    } label: {
                        Image("buy")
                        Text("Buy")
                            .foregroundColor(Color("main-gray"))
                            .fontWeight(.bold)
                    }
                    .frame(maxWidth: .infinity, minHeight: 46)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color("main-green")))
                }
            }
            .padding(15)
        }
        .background(Color("main-gray"))
    }
}

struct TradingContolView_Previews: PreviewProvider {
    @State static var time: TimeLine = .all
    static var previews: some View {
        TradingContolView(timeLine: $time,
                          investAction: {},
                          changeMultipiler: {},
                          sellAction: {},
                          buyAction: {})
            .previewLayout(.sizeThatFits)
    }
}
