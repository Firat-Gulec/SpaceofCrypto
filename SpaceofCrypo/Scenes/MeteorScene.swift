//
//  GameScene.swift
//  SpaceofCrypto
//
//  Created by Fırat GÜLEÇ on 24.07.2021.
//  Copyright © 2021 Firat Gulec. All rights reserved.


import SpriteKit
import GameplayKit

class MeteorScene: SKScene, SKPhysicsContactDelegate {
    
    // MARK: - Properties
    
    var defaults = UserDefaults.standard
    var gameLevel = Int()
    var selectedLevel = Int()
    var engineLeft = SKEmitterNode(fileNamed: "fuse")!
    var engineRight = SKEmitterNode(fileNamed: "fuse")!
    
    //Oluşturduğumuz player değişkenini tanımlıyoruz.
    var player = Player1()
    var difficulty = String()
    var livesArray:[SKSpriteNode]!
    //ScoreLabel ve score değişkeni
    var scoreLabel:SKLabelNode!
    var score:Int = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    //Timer
    var gameTimer:Timer!
    
    var enemyCategory:UInt32 = 0x1 << 1
    var meteorCategory:UInt32 = 0x1 << 1
    var bulletCategory:UInt32 = 0x1 << 0
    var healtyCategory:UInt32 = 0b10 << 2
    var playerCategory:UInt32 = 0b10 << 2
    var backgroundImage = String()
    
    //var starfield:SKEmitterNode!
    
    // MARK: -Systems
    
    //Oyun çalıştığında açılması için çalışması için fonksiyonların eklenmesi
    override func didMove(to view: SKView) {
       
        //func yapılacak kısım
        scoreLabel = SKLabelNode(text: "Score: 0")
        scoreLabel.position = CGPoint(x: 120, y: self.frame.size.height - 80)
        scoreLabel.zPosition = 7.0
        scoreLabel.fontName = "AmericanTypewriter-Bold"
        scoreLabel.color = UIColor.white
        scoreLabel.fontSize = 34
        score = 0
        addChild(scoreLabel)
        
        //Background
        if backgroundImage == "" {
            backgroundImage = "bg5.png"
        }
        
        //Game levels scenario
        if selectedLevel == 1 {                //Basic warefare
           
            setupNodes()
            createPlayer(bulletspeed: 0.3, bulletaddfire: 1, color: "black")
            //Add Enemies
            createEnemy(speed: 1.25)
            spawnEnemies(addInterval: 0.85,speed: 4.0)
            //Add Fire
            createBullet(speed: 0.50, addfire: 1)
            setupPhysics()
            //Add Lives
            addLives()
            
        }else if selectedLevel == 2 {          //Prepare of war
            
            setupNodes()
            createPlayer(bulletspeed: 0.3, bulletaddfire: 1, color: "black")
            //Add Enemies
            createEnemy(speed: 1.75)
            spawnEnemies(addInterval: 0.80,speed: 3.0)
            //Add Fire
            createBullet(speed: 0.50, addfire: 1)
            setupPhysics()
            //Add Lives
            addLives()
            
        }else if selectedLevel == 3 {          //Meteor Shower
            
            setupNodes()
            createPlayer(bulletspeed: 0.3, bulletaddfire: 1, color: "black")
            //Add Enemies
            createEnemy(speed: 1.75)
            spawnEnemies(addInterval: 0.70,speed: 3.0)
            //Add Fire
            createBullet(speed: 0.50, addfire: 1)
            /* //Add Healty
            createHealty(speed: 2)
            spawnHealties(addInterval: 3.0, speed: 3.0)
            */
            //Add Meteor
            createMeteor(speed: 6.00)
            spawnMeteors(addInterval: 6.00, speed: 6.50)
            setupPhysics()
            //Add Lives
            addLives()
            
        }else if selectedLevel == 4 {          //Golden Cross
            
            setupNodes()
            createPlayer(bulletspeed: 0.2, bulletaddfire: 1, color: "black")
            //Add Enemies
            createEnemy(speed: 0.80)
            spawnEnemies(addInterval: 0.50, speed: 2.2)
            //Add Fire
            createBullet(speed: 0.50, addfire: 1)
            setupPhysics()
            //Add Lives
            addLives()
            
        }else if selectedLevel == 5 {          //Death Cross
            
            setupNodes()
            createPlayer(bulletspeed: 0.70, bulletaddfire: 1, color: "white")
            //Add Enemies
            createEnemy(speed: 5.50)
            spawnEnemies(addInterval: 1.25, speed: 5.0)
            //Add Fire
            createBullet(speed: 2.75, addfire: 1)
            setupPhysics()
            //Add Lives
            addLives()
            
        }else if selectedLevel == 6 {          //Bull Session
            
            setupNodes()
            createPlayer(bulletspeed: 0.2, bulletaddfire: 1, color: "black")
            //Add Enemies
            createEnemy(speed: 0.60)
            spawnEnemies(addInterval: 0.40, speed: 2.2)
            //Add Fire
            createBullet(speed: 0.50, addfire: 1)
            setupPhysics()
            //Add Lives
            addLives()
            
        }else if selectedLevel == 7 {          //Bear Session
           
            setupNodes()
            createPlayer(bulletspeed: 0.70, bulletaddfire: 1, color: "white")
            //Add Enemies
            createEnemy(speed: 5.50)
            spawnEnemies(addInterval: 1.25, speed: 5.0)
            //Add Fire
            createBullet(speed: 1.75, addfire: 1)
            //Add Meteor
            createMeteor(speed: 6.00)
            spawnMeteors(addInterval: 6.00, speed: 6.50)
            setupPhysics()
            //Add Lives
            addLives()
            
        }else if selectedLevel == 8 {          //Whale Alert
            
            setupNodes()
            createPlayer(bulletspeed: 0.2, bulletaddfire: 1, color: "blue")
            //Add Enemies
            createEnemy(speed: 0.80)
            spawnEnemies(addInterval: 0.50, speed: 2.2)
            //Add Fire
            createBullet(speed: 0.50, addfire: 1)
            setupPhysics()
            //Add Lives
            addLives()
            
        }else if selectedLevel == 9 {          //Correction
            
            setupNodes()
            createPlayer(bulletspeed: 0.2, bulletaddfire: 1, color: "white")
            //Add Enemies
            createEnemy(speed: 1.75)
            spawnEnemies(addInterval: 0.80,speed: 3.0)
            //Add Fire
            createBullet(speed: 0.50, addfire: 1)
            setupPhysics()
            //Add Lives
            addLives()
            
        }else if selectedLevel == 10 {        //All time high
            
            setupNodes()
            createPlayer(bulletspeed: 0.2, bulletaddfire: 1, color: "blue")
            //Add Enemies
            createEnemy(speed: 0.60)
            spawnEnemies(addInterval: 0.40, speed: 2.2)
            //Add Fire
            createBullet(speed: 0.20, addfire: 1)
            setupPhysics()
            //Add Lives
            addLives()
            
        }
        
        //gameTimer = Timer.scheduledTimer(timeInterval: 0.75, target: self, selector: #selector(<#T##@objc method#>), userInfo: nil, repeats: true)
    }

    func setupPhysics() {
        physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        physicsWorld.contactDelegate = self
    }
    
    //Dokunma Başladığında çağırılmasını istediğimiz func
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        //Dokuma tanımlanması sonrası lokasyonu alınıp Player'ın o noktaya hareketi tanımlanıyor.
        player.run(.move(to: CGPoint(x: location.x, y: location.y + 100), duration: 0.1))
        player.position = CGPoint(x: location.x, y: location.y + 100)
        engineLeft.run(.move(to: CGPoint(x: player.position.x + (self.player.size.width / 2) - 10, y: player.position.y - 65 ), duration: 0.1))
        engineRight.run(.move(to: CGPoint(x: player.position.x - (self.player.size.width / 2) + 12, y: player.position.y - 65 ), duration: 0.1))
    }
    
    //Dokunma devam edip pozisyon değiştirilirken çağırılmasını istediğimiz func
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        //Dokunma devam etmesi tanımlanması sonrası lokasyon alınıp Player'ın pozisyonunun buna göre atanması
        player.position = CGPoint(x: location.x, y: location.y + 100)
        engineLeft.position = CGPoint(x: player.position.x + (self.player.size.width / 2) - 10, y: player.position.y - 65 )
        engineRight.position = CGPoint(x: player.position.x - (self.player.size.width / 2) + 12, y: player.position.y - 65 )
    }
    
    //Sürekli ekranda değişmesini istediğimiz kısımları ekleyeceğimiz func
    override func update(_ currentTime: TimeInterval) {
        if selectedLevel == 1 {                //Basic warefare level BG speed
            moveBG(bgspeed: 4.5)
        }else if selectedLevel == 2 {          //Prepare of war level BG speed
            moveBG(bgspeed: 8.5)
        }else if selectedLevel == 3 {          //Meteor Shower level BG speed
            moveBG(bgspeed: 10.5)
        }else if selectedLevel == 4 {          //Golden Cross level BG speed
            moveBG(bgspeed: 18.5)
        }else if selectedLevel == 5 {          //Death Cross level BG speed
            moveBG(bgspeed: 2.5)
        }else if selectedLevel == 6 {          //Bull Session level BG speed
            moveBG(bgspeed: 20.5)
        }else if selectedLevel == 7 {          //Bear Session level BG speed
            moveBG(bgspeed: 2.5)
        }else if selectedLevel == 8 {          //Whale Alert level BG speed
            moveBG(bgspeed: 18.5)
        }else if selectedLevel == 9 {          //Correction level BG speed
            moveBG(bgspeed: 18.5)
        }else if selectedLevel == 10 {        //All time high level BG speed
            moveBG(bgspeed: 18.5)
        }
    }
    
}
 
    // MARK: -Configrations

    extension MeteorScene {
        
        func setupNodes() {
            if selectedLevel == 1 {                //Basic warefare level BG image
                createBG(imageName: "bg4")
            }else if selectedLevel == 2 {          //Prepare of war level BG image
                createBG(imageName: "bg3")
            }else if selectedLevel == 3 {          //Meteor Shower level BG image
                createBG(imageName: "bg4")
            }else if selectedLevel == 4 {          //Golden Cross level BG image
                createBG(imageName: "bg5")
            }else if selectedLevel == 5 {          //Death Cross level BG image
                createBG(imageName: "bg10")
            }else if selectedLevel == 6 {          //Bull Session level BG image
                createBG(imageName: "bg5")
            }else if selectedLevel == 7 {          //Bear Session level BG image
                createBG(imageName: "bg5")
            }else if selectedLevel == 8 {          //Whale Alert level BG image
                createBG(imageName: "bg4")
            }else if selectedLevel == 9 {          //Correction level BG image
                createBG(imageName: "bg8")
            }else if selectedLevel == 10 {        //All time high level BG image
                createBG(imageName: "bg5")
            }
        }
    
        //TODO : Background
        
        func createBG(imageName: String) {
            backgroundImage = imageName
            for i in 0...2 {
                let bg = SKSpriteNode(imageNamed: imageName)
                bg.zPosition = -1.0
                bg.name = "BG"
                //Check it later (Ana Ekran point en altta 0 da olmalı !)
                bg.position = CGPoint(x: frame.width / 2, y: CGFloat(i)*bg.frame.height + frame.height / 2.0)
                addChild(bg)
               }
        }

        func moveBG(bgspeed: CGFloat) {
            enumerateChildNodes(withName: "BG") { (node ,_) in
                let node = node as! SKSpriteNode
                node.position.y -= bgspeed
                if node.position.y < -self.frame.height {
                    node.position.y += self.frame.height*2.0 + self.frame.height/2.0 + 690
                }
            }
        }
        
        //TODO : Player
        
        func createPlayer(bulletspeed: Double, bulletaddfire: Int, color: String) {
            player.position = CGPoint(x: self.frame.size.width / 2, y: player.size.height / 2 + 20)
            if color == "black" {
            player.texture = SKTexture(imageNamed: "Spaceship_black")
            }else if color == "blue" {
                player.texture = SKTexture(imageNamed: "Spaceship_blue")
            }else if color == "white" {
                player.texture = SKTexture(imageNamed: "Spaceship_white")
            }
            player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
            player.physicsBody?.isDynamic = true
            player.physicsBody?.categoryBitMask = playerCategory
            player.physicsBody?.contactTestBitMask = enemyCategory
            player.physicsBody?.collisionBitMask = 0
            //CGPoint(x: location.x + (self.player.size.width / 2) - 10, y: location.y - 65 )
            engineLeft.position = CGPoint(x: self.frame.size.width + (self.player.size.width / 2) - 10, y: player.size.height / 2 - 65 )
            engineRight.position = CGPoint(x: self.frame.size.width + (self.player.size.width / 2) - 12, y: player.size.height / 2 - 65 )
            addChild(engineLeft)
            addChild(engineRight)
            addChild(player)
            //bullet create sonrası
            run(.repeatForever(.sequence([.wait(forDuration: bulletspeed), .run { [weak self] in self? .createBullet(speed: 0.50, addfire: bulletaddfire)
                }])))
        }
        
        //TODO : Enemies
        
        func createEnemy(speed: Float) {
            var enemy: Coin
            let type: CoinSettings
            let duration : CGFloat
            switch Int(arc4random() % 100) {
            case 0...10:
                enemy = Coin.createCoinBitcoin()
                type = .small
                duration = CGFloat(Float(arc4random() % 3) + speed)
            case 20...30:
                enemy = Coin.createCoinDoge()
                type = .medium
                duration = CGFloat(Float(arc4random() % 3) + speed)
            case 30...40:
                enemy = Coin.createCoinShiba()
                type = .medium
                duration = CGFloat(Float(arc4random() % 3) + speed)
            case 50...60:
                enemy = Coin.createCoinXrp()
                type = .medium
                duration = CGFloat(Float(arc4random() % 3) + speed)
            case 70...80:
                enemy = Coin.createCoinTether()
                type = .small
                duration = CGFloat(Float(arc4random() % 3) + speed)
            case 90...99:
                enemy = Coin.createCoinUniswap()
                type = .medium
                duration = CGFloat(Float(arc4random() % 3) + speed)
            default:
                enemy = Coin.createCoinCardano()
                type = .small
                duration = CGFloat(Float(arc4random() % 3) + speed)
            }
            enemy.type = type
            let enemyF = enemy.frame
            let randomX = CGFloat.random(min: enemyF.width, max: self.frame.width - enemyF.width )
            enemy.position = CGPoint(x:randomX, y: self.frame.height + enemyF.height / 2 )
            enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
            enemy.physicsBody?.isDynamic = true
            enemy.physicsBody?.categoryBitMask = enemyCategory
            enemy.physicsBody?.contactTestBitMask = bulletCategory
            enemy.physicsBody?.collisionBitMask = 0
            addChild(enemy)
            let moveTo = SKAction.moveTo(y: 0.0, duration: TimeInterval(duration))
            let turnTo = SKAction.rotate(toAngle: .pi * 2, duration: TimeInterval(duration))
            let group = SKAction.group([moveTo, turnTo])
            enemy.run(.repeatForever(.sequence([ group,  .removeFromParent()])))
        }
        
        func spawnEnemies(addInterval: Double, speed: Float) {
            var timeInterval = 2.0
            if difficulty == "easy" {
                timeInterval = 1.0 + addInterval
            }else{
                timeInterval = addInterval
            }
            run(.repeatForever(.sequence([
                .wait(forDuration: timeInterval),
                    .run {[weak self] in
                        self?.createEnemy(speed: speed)
                }])))
        }
        
        // TODO : Meteor
        
        func createMeteor(speed: Float) {
            var meteor: Meteor
            let type: MeteorSettings
            let duration : CGFloat
            switch Int(arc4random() % 100) {
            case 0...40:
                meteor = Meteor.createMeteorLarge()
                type = .small
                duration = CGFloat(Float(arc4random() % 3) + speed)
            case 40...80:
                meteor = Meteor.createMeteorSMedium()
                type = .medium
                duration = CGFloat(Float(arc4random() % 3) + speed)
            default:
                meteor = Meteor.createMeteorSmall()
                type = .medium
                duration = CGFloat(Float(arc4random() % 3) + speed)
            }
            meteor.type = type
            let meteorF = meteor.frame
            let randomX = CGFloat.random(min: meteorF.width, max: self.frame.width - meteorF.width )
            meteor.position = CGPoint(x:randomX, y: self.frame.height + meteorF.height / 2 )
            meteor.physicsBody = SKPhysicsBody(rectangleOf: meteor.size)
            meteor.physicsBody?.isDynamic = true
            meteor.physicsBody?.categoryBitMask = meteorCategory
            meteor.physicsBody?.contactTestBitMask = bulletCategory
            meteor.physicsBody?.collisionBitMask = 0
            addChild(meteor)
            let moveTo = SKAction.moveTo(y: 0.0, duration: TimeInterval(duration))
            //let turnTo = SKAction.rotate(toAngle: .pi * 2, duration: TimeInterval(duration))
            let group = SKAction.group([moveTo, /*turnTo*/])
            meteor.run(.repeatForever(.sequence([ group,  .removeFromParent()])))
        }
        
        func spawnMeteors(addInterval: Double, speed: Float) {
            var timeInterval = 2.0
            if difficulty == "easy" {
                
                timeInterval = 1.0 + addInterval
            }else{
                timeInterval = addInterval
            }
            run(.repeatForever(.sequence([
                .wait(forDuration: timeInterval),
                    .run {[weak self] in
                        self?.createMeteor(speed: speed)
                }])))
        }
        
        // TODO : Healty
        
        func createHealty(speed: Float) {
            var healty: Healty
            let type: HealtySettings
            let duration : CGFloat
            switch Int(arc4random() % 100) {
            case 0...10:
                healty = Healty.createHealty1x()
                type = .small
                duration = CGFloat(Float(arc4random() % 3) + speed)
            case 20...30:
                healty = Healty.createHealty2x()
                type = .medium
                duration = CGFloat(Float(arc4random() % 3) + speed)
            default:
                healty = Healty.createHealty1x()
                type = .medium
                duration = CGFloat(Float(arc4random() % 3) + speed)
            }
            healty.type = type
            let healtyF = healty.frame
            let randomX = CGFloat.random(min: healtyF.width, max: self.frame.width - healtyF.width )
            healty.position = CGPoint(x:randomX, y: self.frame.height + healtyF.height / 2 )
            healty.physicsBody = SKPhysicsBody(rectangleOf: healty.size)
            healty.physicsBody?.isDynamic = true
            healty.physicsBody?.categoryBitMask = healtyCategory
            healty.physicsBody?.contactTestBitMask = playerCategory
            healty.physicsBody?.collisionBitMask = 0
            addChild(healty)
            let moveTo = SKAction.moveTo(y: 0.0, duration: TimeInterval(duration))
            let turnTo = SKAction.rotate(toAngle: .pi * 2, duration: TimeInterval(duration))
            let group = SKAction.group([moveTo, turnTo])
            healty.run(.repeatForever(.sequence([ group,  .removeFromParent()])))
        }
        
        func spawnHealties(addInterval: Double, speed: Float) {
            var timeInterval = 2.0
            if difficulty == "easy" {
                timeInterval = 1.0 + addInterval
            }else{
                timeInterval = addInterval
            }
            run(.repeatForever(.sequence([
                .wait(forDuration: timeInterval),
                    .run {[weak self] in
                        self?.createHealty(speed: speed)
                }])))
        }
        
        // TODO : Bullet
        func createBullet(speed: Double, addfire: Int) {
            self.run(SKAction.playSoundFileNamed("torpedo.mp3", waitForCompletion: false))
            //Select fire set 1
            if addfire == 1 {
            let bullet = SKSpriteNode(imageNamed: "missile00")
            bullet.setScale(0.2)
            bullet.size = CGSize(width: 30, height: 30)
            bullet.position = player.position
            bullet.physicsBody = SKPhysicsBody(circleOfRadius: bullet.size.width / 2)
            bullet.physicsBody?.isDynamic = true
            bullet.physicsBody?.categoryBitMask = bulletCategory
            bullet.physicsBody?.contactTestBitMask = enemyCategory
            bullet.physicsBody?.collisionBitMask = 0
            bullet.physicsBody?.usesPreciseCollisionDetection = true
            addChild(bullet)
            let moveBy = SKAction.moveBy(x: 0.0, y: frame.height, duration: speed)
            bullet.run(.repeatForever(.sequence([moveBy, .removeFromParent()])))
                
                
            //Select fire set 1 sonra!
            } else if addfire == 2 {
                let bullet1 = SKSpriteNode(imageNamed: "missile00")
                let bullet2 = SKSpriteNode(imageNamed: "missile00")
                bullet1.setScale(0.2)
                bullet1.size = CGSize(width: 30, height: 30)
                bullet1.position = player.position// genişlet
                bullet2.setScale(0.2)
                bullet2.size = CGSize(width: 30, height: 30)
                bullet2.position = player.position// genişlet
                bullet1.physicsBody = SKPhysicsBody(circleOfRadius: bullet1.size.width / 2)
                bullet1.physicsBody?.isDynamic = true
                bullet1.physicsBody?.categoryBitMask = bulletCategory
                bullet1.physicsBody?.contactTestBitMask = enemyCategory
                bullet1.physicsBody?.collisionBitMask = 0
                bullet1.physicsBody?.usesPreciseCollisionDetection = true
                bullet2.physicsBody = SKPhysicsBody(circleOfRadius: bullet1.size.width / 2)
                bullet2.physicsBody?.isDynamic = true
                bullet2.physicsBody?.categoryBitMask = bulletCategory
                bullet2.physicsBody?.contactTestBitMask = enemyCategory
                bullet2.physicsBody?.collisionBitMask = 0
                bullet2.physicsBody?.usesPreciseCollisionDetection = true
                addChild(bullet1)
                addChild(bullet2)
                let moveBy = SKAction.moveBy(x: 0.0, y: frame.height, duration: speed)
                bullet1.run(.repeatForever(.sequence([moveBy, .removeFromParent()])))
                bullet2.run(.repeatForever(.sequence([moveBy, .removeFromParent()])))
            }
        }
        
        // TODO : addLive
        
        func addLives() {
            livesArray = [SKSpriteNode]()
            for live in 1...3 {
                let liveNode = SKSpriteNode(imageNamed: "Spaceship_white")
                liveNode.size = CGSize(width: 70, height: 70)
                liveNode.position = CGPoint(x: self.frame.size.width - CGFloat(4-live) * liveNode.size.width + 30, y: self.frame.height - 70)
                self.addChild(liveNode)
                livesArray.append(liveNode)
            }
        }
        
        
    //MARK: - SKPhysicsContactDelegate
        
        func didBegin(_ contact: SKPhysicsContact) {
            
            //Level transaction rules
            if score >= 15000 , selectedLevel == 1 {                //Basic warefare
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }else if score >= 15000 , selectedLevel == 2 {          //Prepare of war
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }else if score >= 20000 , selectedLevel == 3 {          //Meteor Shower
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }else if score >= 40000 , selectedLevel == 4 {          //Golden Cross
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }else if score >= 15000 , selectedLevel == 5 {          //Death Cross
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }else if score >= 40000 , selectedLevel == 6 {          //Bull Session
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }else if score >= 20000 , selectedLevel == 7 {          //Bear Session
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }else if score >= 40000 , selectedLevel == 8 {          //Whale Alert
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }else if score >= 60000 , selectedLevel == 9 {          //Correction
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }else if score >= 100000 , selectedLevel == 10 {        //All time high
                nextlevelTransaction(levelscore: self.score, selectedlevel: selectedLevel, difficulty: difficulty)
            }
            var firstBody:SKPhysicsBody
            var secondBody:SKPhysicsBody
            if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
                firstBody = contact.bodyA
                secondBody = contact.bodyB
            }else{
                firstBody = contact.bodyB
                secondBody = contact.bodyA
            }
            if (firstBody.categoryBitMask & bulletCategory) != 0 && (secondBody.categoryBitMask & enemyCategory) != 0 {
                let meteor = contact.bodyA.categoryBitMask == meteorCategory ? contact.bodyA.node as? Meteor: contact.bodyB.node as? Meteor
                let enemy = contact.bodyA.categoryBitMask == enemyCategory ? contact.bodyA.node as? Coin: contact.bodyB.node as? Coin
                let bullet = contact.bodyB.node as? SKSpriteNode
                //let collision = contact.bodyB.categoryBitMask | contact.bodyB.contactTestBitMask
                bullet?.removeFromParent()
                //Hit the Meteor
                if  let meteor = meteor {
                    meteor.healty -= 1
                    if meteor.healty == 0 {
                        bulletDidCollideWithEnemy(enemyNode: secondBody.node as! SKSpriteNode )
                    }else if meteor.healty == 0 {
                        bulletDidCollideWithEnemy(enemyNode: secondBody.node as! SKSpriteNode )
                    }
                }
                
                //Hit the Enemy
                if let enemy = enemy {
                    enemy.healty -= 1
                    print(enemy.healty)
                    if enemy.healty < 0 {
                        enemy.healty = 0
                        print("bitti")
                        changeScore(enemy.type)
                        bulletDidCollideWithEnemy(enemyNode: secondBody.node as! SKSpriteNode )
                    }
                    // enemy Healty check
                    if enemy.healty == 0 {
                        changeScore(enemy.type)
                        bulletDidCollideWithEnemy(enemyNode: secondBody.node as! SKSpriteNode )
                    }
                }
            }
            
            
            //player crash healty icon
            
            
            //Crash SpaceShip
            if (firstBody.categoryBitMask & playerCategory) != 2 && (secondBody.categoryBitMask & enemyCategory) != 2 {
                playerDidCollideWithEnemy(playerNode: firstBody.node as! SKSpriteNode)
                if self.livesArray.count > 0 {
                    let liveNode = self.livesArray.first
                    liveNode!.removeFromParent()
                    self.livesArray.removeFirst()
                    if self.livesArray.count == 0 {
                        //GameOver screen transition
                        let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                        //let gameOverScene = GameOverScene(size: self.size)
                        let gameOverScene = SKScene(fileNamed: "GameOverScene") as! GameOverScene
                        gameOverScene.scaleMode = .aspectFill
                        gameOverScene.score = self.score
                        gameOverScene.selectedlevel = selectedLevel
                        gameOverScene.backgroundImage = backgroundImage
                        gameOverScene.difficulty = difficulty
                        gameOverScene.size = self.size
                        self.view?.presentScene(gameOverScene, transition: transition)
                    }
                }
            }
        }
        
        //Next Level transition
        func nextlevelTransaction(levelscore: Int, selectedlevel: Int, difficulty:String) {
            let transition = SKTransition.flipHorizontal(withDuration: 0.5)
            //let gameOverScene = GameOverScene(size: self.size)
            let gameOverScene = SKScene(fileNamed: "GameOverScene") as! GameOverScene
            gameOverScene.gameoverLabelstr = " Level \(selectedlevel) Completed!!"
            gameOverScene.selectedlevel = selectedlevel
            gameOverScene.scaleMode = .aspectFill
            gameOverScene.score = levelscore
            gameOverScene.backgroundImage = backgroundImage
            gameOverScene.difficulty = difficulty
            gameOverScene.size = self.size
            self.view?.presentScene(gameOverScene, transition: transition)
        }
        
        //Player crash healty icon
        func playerDidCollideWithHealty (healtyNode:SKSpriteNode) {
            let explosion = SKEmitterNode(fileNamed: "Explosion")!
           explosion.position = healtyNode.position
            addChild(explosion)
            run(SKAction.playSoundFileNamed("explosion.mp3", waitForCompletion: false))
            healtyNode.removeFromParent()
            run(SKAction.wait(forDuration: 0.3)) {
                explosion.removeFromParent()
            }
        }
        
        
        //player fire explosion
         func playerDidCollideWithEnemy (playerNode:SKSpriteNode) {
             let explosion = SKEmitterNode(fileNamed: "Explosion")!
            explosion.position = playerNode.position
             addChild(explosion)
             run(SKAction.playSoundFileNamed("explosion.mp3", waitForCompletion: false))
             playerNode.removeFromParent()
             run(SKAction.wait(forDuration: 0.3)) {
                 explosion.removeFromParent()
             }
         }
        
       //bullet fire explosion
        func bulletDidCollideWithEnemy (enemyNode:SKSpriteNode) {
            let explosion = SKEmitterNode(fileNamed: "Explosion")!
            explosion.position = enemyNode.position
            addChild(explosion)
            run(SKAction.playSoundFileNamed("explosion.mp3", waitForCompletion: false))
            enemyNode.removeFromParent()
            run(SKAction.wait(forDuration: 0.3)) {
                explosion.removeFromParent()
            }
        }
        
        func changeScore (_ type:CoinSettings) {
            switch type {
            case .small:
                score += 100
            case .medium:
                score += 600
            case .large:
                score += 3000
            }
        }
}
    

