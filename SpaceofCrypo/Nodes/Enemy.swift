//
//  Enemy.swift
//  SpaceofCrypto
//
//  Created by Fırat GÜLEÇ on 24.07.2021.
//  Copyright © 2021 Firat Gulec. All rights reserved.

import SpriteKit

enum CoinSettings: Int {
    case small = 0, medium, large
}


class Coin : SKSpriteNode {
    
    
    var healty: Int = 5
    var type: CoinSettings = .small
    class func createCoinBitcoin() -> Coin {
        let coin = setupCoins("bitcoin", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    class func createCoinCardano() -> Coin {
        let coin = setupCoins("cardano", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    class func createCoinDoge() -> Coin {
        let coin = setupCoins("doge", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    class func createCoinBinance() -> Coin {
        let coin = setupCoins("binance", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    class func createCoinGreenspark() -> Coin {
        let coin = setupCoins("greenspark", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    class func createCoinMagspark() -> Coin {
        let coin = setupCoins("magspark", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    class func createCoinShiba() -> Coin {
        let coin = setupCoins("shiba", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    class func createCoinTether() -> Coin {
        let coin = setupCoins("tether", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    class func createCoinUniswap() -> Coin {
        let coin = setupCoins("uniswap", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    class func createCoinXrp() -> Coin {
        let coin = setupCoins("xrp", healty: 2, type: .small)
        coin.size = CGSize(width: 100, height: 110)
        return coin
    }
    
    
    class func setupCoins(_ imgNamed: String, healty: Int, type: CoinSettings, scale: CGFloat = 1.0) -> Coin {
        let sprite = Coin(imageNamed: imgNamed)
        sprite.type = type
        sprite.healty = healty
        sprite.setScale(scale)
        sprite.zPosition = .pi / 4
        return sprite
    }
}

