//
//  СhartsView.swift
//  CryptoApp
//
//  Created by Dmitriy Holovnia on 10/20/21.
//

import SwiftUI



struct ChartsView: View {
    
    var coins = Coin.allCoins
    @State var selectedCoin = Coin.allCoins.first!
    @State var time: TimeLine = .all
    @State var sheetIsPresented: Bool = false
    
    var body: some View {
        ZStack {
            VStack {
                // Header
                HStack(alignment: .center) {
                    Image("arrow-down")
                    Text("$10.000")
                        .foregroundColor(Color("light-yellow"))
                    Text("Demo")
                        .font(.callout)
                        .padding(.horizontal, 5)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 1))
                        .foregroundColor(.white)
                        .opacity(0.2)
                    Spacer()
                    Button("+ Add real ballance") {
                        print(#function)
                    }
                    .foregroundColor(Color.green)
                }
                .padding([.top, .horizontal], 10)

                // Coin selector
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 5) {
                        Image("plus")
                            .padding()
                        ForEach(0..<coins.count) { index in
                            if selectedCoin == coins[index] {
                                CoinMenuView(coin: coins[index])
                                    .padding(.top, 2)
                            } else {
                                if index == 0 {
                                    Divider()
                                        .background(Color("light-gray"))
                                        .padding(.vertical, 10)
                                }
                                Image(coins[index].image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 35)
                                    .padding()
                                    .onTapGesture {
                                        selectedCoin = coins[index]
                                    }
                                Divider()
                                    .background(Color("light-gray"))
                                    .padding(.vertical, 10)

                            }
                        }
                    }
                }
                .frame(height: 46)
                .background(Color("main-gray"))

                // Content
                VStack {
                    Spacer()
                        .frame(maxWidth: .infinity)
                    Button("Present Full-Screen Cover") {
                        withAnimation(.easeInOut(duration: 2.0)) {
                            sheetIsPresented.toggle()
                        }
                    }
                    Spacer()
                        .frame(maxWidth: .infinity)
    //                .fullScreenCover(isPresented: $sheetIsPresented) {
    //                    Button("Hide") {
    //                        sheetIsPresented = false
    //                    }
    //                }
                }
                .background(Color("main-black"))

                // Trading menu
                TradingContolView(timeLine: $time,
                                  investAction: invest,
                                  changeMultipiler: changeMultipiler,
                                  sellAction: sell,
                                  buyAction: buy)
            }
            .background(Color("main-gray"))
            if sheetIsPresented {
                VStack {
                    Spacer()
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
                .onTapGesture {
                    self.sheetIsPresented = false
                }
                
                TradingPanelView(isPressented: $sheetIsPresented)
                    .transition(.move(edge: .bottom))
            }
        }
    }
    
    func invest() {
        
    }
    
    func changeMultipiler() {
        
    }
    
    func buy() {
        sheetIsPresented = true
    }
    
    func sell() {
        sheetIsPresented = false
    }
}

struct ChartsView_Previews: PreviewProvider {
    static var previews: some View {
        ChartsView()
    }
}
