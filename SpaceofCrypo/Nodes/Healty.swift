//
//  Fruit.swift
//  SpaceofCrypto
//
//  Created by Fırat GÜLEÇ on 24.07.2021.
//  Copyright © 2021 Firat Gulec. All rights reserved.

import SpriteKit

enum HealtySettings: Int {
    case small = 0, medium, large
}

class Healty : SKSpriteNode {
    var type: HealtySettings = .small
    class func createHealty1x() -> Healty {
        let healty = setupHealties("Spaceship_one_fruit", type: .small)
        healty.size = CGSize(width: 50, height: 50)
        return healty
    }
    class func createHealty2x() -> Healty {
        let healty = setupHealties("Spaceship_one_fruit", type: .medium)
        healty.size = CGSize(width: 70, height: 70)
        return healty
    }
   
    
    class func setupHealties(_ imgNamed: String, type: HealtySettings, scale: CGFloat = 1.0) -> Healty {
        let sprite = Healty(imageNamed: imgNamed)
        sprite.type = type
        sprite.setScale(scale)
        sprite.zPosition = 5.0
        return sprite
    }
}
