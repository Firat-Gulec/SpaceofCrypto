//
//  Player1.swift
//  SpaceofCrypto
//
//  Created by Fırat GÜLEÇ on 24.07.2021.
//  Copyright © 2021 Firat Gulec. All rights reserved.
//

import SpriteKit

class Player1: SKSpriteNode {
    
    init() {
        let texture = SKTexture(imageNamed: "Spaceship_black")
        super.init(texture: texture, color: .clear, size: CGSize(width: 200, height: 200))
        
        zPosition = 1.0
        setScale(0.7)
    }
  
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
