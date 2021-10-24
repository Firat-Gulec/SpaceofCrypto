//
//  Candy.swift
//  SpaceofCrypto
//
//  Created by Fırat GÜLEÇ on 24.07.2021.
//  Copyright © 2021 Firat Gulec. All rights reserved.


import SpriteKit

enum MeteorSettings: Int {
    case small = 0, medium, large
}

class Meteor : SKSpriteNode {
    var healty: Int = 5
    var type: MeteorSettings = .small
    class func createMeteorSmall() -> Meteor {
        let meteor = setupMeteors("mt_1", healty: 15, type: .small)
        meteor.size = CGSize(width: 200, height: 200)
        return meteor
    }
    class func createMeteorSMedium() -> Meteor {
        let meteor = setupMeteors("mt_1", healty: 16, type: .medium)
        meteor.size = CGSize(width: 300, height: 300)
        return meteor
    }
    class func createMeteorLarge() -> Meteor {
        let meteor = setupMeteors("mt_1", healty: 17, type: .large)
        meteor.size = CGSize(width: 400, height: 400)
        return meteor
    }
    class func createWhaleLarge() -> Meteor {
        let meteor = setupMeteors("mt_1", healty: 17, type: .large)
        meteor.size = CGSize(width: 500, height: 500)
        return meteor
    }
    
    
    class func setupMeteors(_ imgNamed: String, healty: Int, type: MeteorSettings, scale: CGFloat = 1.0) -> Meteor {
        let sprite = Meteor(imageNamed: imgNamed)
        sprite.type = type
        sprite.healty = healty
        sprite.setScale(scale)
        sprite.zPosition = 5.0
        return sprite
    }
}
