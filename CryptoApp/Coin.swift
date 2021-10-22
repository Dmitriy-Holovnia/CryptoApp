//
//  Coin.swift
//  CryptoApp
//
//  Created by Dmitiy Golovnia on 20.10.2021.
//

import Foundation

struct Coin: Identifiable, Equatable {
    
    let id = UUID()
    let name: String
    let stock: String
    let image: String
    
    static let allCoins: [Self] = [
        Coin(name: "Bitcoin", stock: "Binance", image: "bitcoin"),
        Coin(name: "Ethereum", stock: "Binance", image: "ethereum"),
        Coin(name: "XRP", stock: "Binance", image: "xrp"),
        Coin(name: "Solana", stock: "Binance", image: "solana"),
        Coin(name: "Dogecoin", stock: "Binance", image: "dogecoin"),
        Coin(name: "Litecoin", stock: "Binance", image: "litecoin"),
        Coin(name: "Stellar", stock: "Binance", image: "stellar")
    ]
}
