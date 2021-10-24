//
//  MyScene.swift
//  SpaceofCrypto
//
//  Created by Fırat GÜLEÇ on 24.07.2021.
//  Copyright © 2021 Firat Gulec. All rights reserved.


import UIKit
import SpriteKit
import StoreKit

class MainScene: SKScene, SKProductsRequestDelegate, SKPaymentTransactionObserver {
    
    
    
    // MARK: -In - Purchasing Setup Start
    
    private var models = [SKProduct]()
    //Protucts
    
    enum Product: String, CaseIterable {
        case unlockEverything = "com.firatgulec.SpaceofCrypto.everything"
        case removeAds = "com.firatgulec.SpaceofCrypto.removeads"
        
    }
    
    private func fetchProduct() {
        let request = SKProductsRequest(productIdentifiers: Set(Product.allCases.compactMap({$0.rawValue})))
        request.delegate = self
        request.start()
        
    }
    
    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        DispatchQueue.main.sync {
            models = response.products
            print("Count: \(response.products.count)")
        }
        
        
    }
    //satınalma durumu için :)
    @Published var transactionState: SKPaymentTransactionState?
    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        //no code
        transactions.forEach({
            switch $0.transactionState {
            case .purchasing:
                print("purchasing")
            case .purchased:
                //
               if levelgamemode == "level2.png" || levelgamemode == levelArray[1] {
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    let meteorscene = MeteorScene(size: self.size)
                    meteorscene.difficulty = difficulty
                    meteorscene.selectedLevel = 2
                    self.view?.presentScene(meteorscene, transition: transition)
                }else if levelgamemode == "level3.png" || levelgamemode == levelArray[2] {
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    let meteorscene = MeteorScene(size: self.size)
                    meteorscene.difficulty = difficulty
                    meteorscene.selectedLevel = 3
                    self.view?.presentScene(meteorscene, transition: transition)
                }else if levelgamemode == "level4.png" || levelgamemode == levelArray[3] {
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    let meteorscene = MeteorScene(size: self.size)
                    meteorscene.difficulty = difficulty
                    meteorscene.selectedLevel = 4
                    self.view?.presentScene(meteorscene, transition: transition)
                }else if levelgamemode == "level5.png" || levelgamemode == levelArray[4] {
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    let meteorscene = MeteorScene(size: self.size)
                    meteorscene.difficulty = difficulty
                    meteorscene.selectedLevel = 5
                    self.view?.presentScene(meteorscene, transition: transition)
                }else if levelgamemode == "level6.png" || levelgamemode == levelArray[5] {
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    let meteorscene = MeteorScene(size: self.size)
                    meteorscene.difficulty = difficulty
                    meteorscene.selectedLevel = 6
                    self.view?.presentScene(meteorscene, transition: transition)
                }else if levelgamemode == "level7.png" || levelgamemode == levelArray[6] {
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    let meteorscene = MeteorScene(size: self.size)
                    meteorscene.difficulty = difficulty
                    meteorscene.selectedLevel = 7
                    self.view?.presentScene(meteorscene, transition: transition)
                }else if levelgamemode == "level8.png" || levelgamemode == levelArray[7] {
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    let meteorscene = MeteorScene(size: self.size)
                    meteorscene.difficulty = difficulty
                    meteorscene.selectedLevel = 8
                    self.view?.presentScene(meteorscene, transition: transition)
                }else if levelgamemode == "level9.png" || levelgamemode == levelArray[8] {
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    let meteorscene = MeteorScene(size: self.size)
                    meteorscene.difficulty = difficulty
                    meteorscene.selectedLevel = 9
                    self.view?.presentScene(meteorscene, transition: transition)
                }else if levelgamemode == "level10.png" || levelgamemode == levelArray[9] {
                    let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                    let meteorscene = MeteorScene(size: self.size)
                    meteorscene.difficulty = difficulty
                    meteorscene.selectedLevel = 10
                    self.view?.presentScene(meteorscene, transition: transition)
                }
                transactionState = .purchased
                print("purchased")
            case .failed:
                print("did not purchase")
            case .restored:
                print("purchase restored")
               
               if levelgamemode == "level2.png" || levelgamemode == levelArray[1] {
                     let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                     let meteorscene = MeteorScene(size: self.size)
                     meteorscene.difficulty = difficulty
                     meteorscene.selectedLevel = 2
                     self.view?.presentScene(meteorscene, transition: transition)
                 }else if levelgamemode == "level3.png" || levelgamemode == levelArray[2] {
                     let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                     let meteorscene = MeteorScene(size: self.size)
                     meteorscene.difficulty = difficulty
                     meteorscene.selectedLevel = 3
                     self.view?.presentScene(meteorscene, transition: transition)
                 }else if levelgamemode == "level4.png" || levelgamemode == levelArray[3] {
                     let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                     let meteorscene = MeteorScene(size: self.size)
                     meteorscene.difficulty = difficulty
                     meteorscene.selectedLevel = 4
                     self.view?.presentScene(meteorscene, transition: transition)
                 }else if levelgamemode == "level5.png" || levelgamemode == levelArray[4] {
                     let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                     let meteorscene = MeteorScene(size: self.size)
                     meteorscene.difficulty = difficulty
                     meteorscene.selectedLevel = 5
                     self.view?.presentScene(meteorscene, transition: transition)
                 }else if levelgamemode == "level6.png" || levelgamemode == levelArray[5] {
                     let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                     let meteorscene = MeteorScene(size: self.size)
                     meteorscene.difficulty = difficulty
                     meteorscene.selectedLevel = 6
                     self.view?.presentScene(meteorscene, transition: transition)
                 }else if levelgamemode == "level7.png" || levelgamemode == levelArray[6] {
                     let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                     let meteorscene = MeteorScene(size: self.size)
                     meteorscene.difficulty = difficulty
                     meteorscene.selectedLevel = 7
                     self.view?.presentScene(meteorscene, transition: transition)
                 }else if levelgamemode == "level8.png" || levelgamemode == levelArray[7] {
                     let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                     let meteorscene = MeteorScene(size: self.size)
                     meteorscene.difficulty = difficulty
                     meteorscene.selectedLevel = 8
                     self.view?.presentScene(meteorscene, transition: transition)
                 }else if levelgamemode == "level9.png" || levelgamemode == levelArray[8] {
                     let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                     let meteorscene = MeteorScene(size: self.size)
                     meteorscene.difficulty = difficulty
                     meteorscene.selectedLevel = 9
                     self.view?.presentScene(meteorscene, transition: transition)
                 }else if levelgamemode == "level10.png" || levelgamemode == levelArray[9] {
                     let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                     let meteorscene = MeteorScene(size: self.size)
                     meteorscene.difficulty = difficulty
                     meteorscene.selectedLevel = 10
                     self.view?.presentScene(meteorscene, transition: transition)
                 }
                 transactionState = .purchased
            case .deferred:
                break
            @unknown default:
                break
            }
        })
    }


    var defaults = UserDefaults.standard
    var gameLevel = Int()
    var selectedLevel = 1
    
        var gamelogoImageNode:SKSpriteNode!
        var gamelogoLabelNode:SKLabelNode!
        var newGameButtonNode:SKSpriteNode!
        var difficultyButtonNode:SKSpriteNode!
        var difficultyLabelNode:SKLabelNode!
        var yellowrightButtonNode:SKSpriteNode!
        var yellowleftButtonNode:SKSpriteNode!
        var levelImageNode:SKSpriteNode!
        var levelNameLabelNode:SKLabelNode!
        var purrestoredButtonNode:SKSpriteNode!
    
    
        var difficulty = String()
        var levelgamemode = String()
        var backgroundImage = String()
           
           override func didMove(to view: SKView) {
           /*
            highScore = defaults.integer(forKey: "high")
            print("HIGH SCORE: \(highScore)")
            */
            fetchProduct()
            SKPaymentQueue.default().add(self)
          
            
            if backgroundImage == "" {
                backgroundImage = "bg4.png"
            }
               createBG()
            gamelogoImageNode = (self.childNode(withName: "gamelogoImage") as! SKSpriteNode)
            gamelogoImageNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 200)
            gamelogoImageNode.texture = SKTexture(imageNamed: "gamename")
            gamelogoLabelNode = (self.childNode(withName: "gamelogoLabel") as! SKLabelNode)
            //gamelogoLabelNode.text = "HIGH SCORE: \(highScore)"
            gamelogoLabelNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 200)
            gamelogoLabelNode.isHidden = true
            newGameButtonNode = (self.childNode(withName: "newGameButton") as! SKSpriteNode)
            newGameButtonNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 400)
            difficultyButtonNode = (self.childNode(withName: "difficultyButton") as! SKSpriteNode)
            // difficultyButtonNode.texture = SKTexture(imageNamed: ""slots-difficulty"")
            difficultyLabelNode = (self.childNode(withName: "difficultyLabel")as! SKLabelNode)
            difficultyLabelNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 990)
            difficultyButtonNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 870)
            /*
            levelModeButtonNode = (self.childNode(withName: "levelModeButton")as! SKSpriteNode)
            levelModeButtonNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 500)
            levelModeButtonNode.isHidden = true
            */
            levelImageNode = (self.childNode(withName: "levelImage")as! SKSpriteNode)
            levelImageNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 610)
            levelgamemode = "level1.png"
            
            yellowleftButtonNode = (self.childNode(withName: "yelllowleftButton")as! SKSpriteNode)
            yellowleftButtonNode.position = CGPoint(x: (self.frame.width / 2) - 260, y: self.frame.height - 620)
            yellowrightButtonNode = (self.childNode(withName: "yellowrightButton")as! SKSpriteNode)
            yellowrightButtonNode.position = CGPoint(x: (self.frame.width / 2) + 260, y: self.frame.height - 620)
            purrestoredButtonNode = (self.childNode(withName: "purrestoredButton")as! SKSpriteNode)
            purrestoredButtonNode.position = CGPoint(x: (self.frame.width / 2) - 260, y: self.frame.height - 1200)
            purrestoredButtonNode.texture = SKTexture(imageNamed: "restore")
            purrestoredButtonNode.isHidden = true
            levelNameLabelNode = (self.childNode(withName: "levelNameLabel")as! SKLabelNode)
            levelNameLabelNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 790)
            levelNameLabelNode.text = "Basic warfare"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
            let userDefaults = UserDefaults.standard
            if userDefaults.bool(forKey:"hard") {
                difficultyLabelNode.text = "Hard"
            }else {
                difficultyLabelNode.text = "Easy"
            }
            
           }
    
    
        override func update(_ currentTime: TimeInterval) {
            moveBG()
        }
    
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            let touch = touches.first
            if let location = touch?.location(in: self) {
                let nodesArray = self.nodes(at: location)
                
                if nodesArray.first?.name == "newGameButton" {
                    if levelgamemode == "level1.png" {
                        let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                        let meteorscene = MeteorScene(size: self.size)
                        meteorscene.difficulty = difficulty
                        meteorscene.selectedLevel = 1
                        self.view?.presentScene(meteorscene, transition: transition)
                    }else if levelgamemode != "level1.png" {
                        let payment = SKPayment(product: models[0])
                        SKPaymentQueue.default().add(payment)
                            }
                    
                }else if nodesArray.first?.name == "difficultyButton" {
                    changeDifficulty()
                }else if nodesArray.first?.name == "yellowrightButton" {
                    numbers = numbers + 1
                    changeGameMode(number: numbers)
                    if numbers == 11 {
                        numbers = 0
                    }
                }else if nodesArray.first?.name == "yelllowleftButton" {
                    numbers = numbers - 1
                    changeGameMode(number: numbers)
                    if numbers == 0 {
                        numbers = 10
                    }
                }else if nodesArray.first?.name == "purrestoredButton" {
                    SKPaymentQueue.default().restoreCompletedTransactions()
                }
            }
        }
   
    func purchaseProduct(product: SKProduct) {
        //let payment = SKPayment(product: product)
        if transactionState == .purchased {
            purrestoredButtonNode.isHidden = false
           
        } else {
            levelArray.removeAll()
            levelArray = ["level1.png", "level2_locked.png" , "level3_locked.png", "level4_locked.png", "level5_locked.png", "level6_locked.png", "level7_locked.png", "level8_locked.png", "level9_locked.png", "level10_locked.png"]
           
        }
    }
    
    var levelArray = ["level1.png", "level2.png" , "level3.png", "level4.png", "level5.png", "level6.png", "level7.png", "level8.png", "level9.png", "level10.png"]
    var numbers = Int()
    
    
    func changeGameMode(number: Int) {
        
        purchaseProduct(product: models[0])
        
        let userDefaults = UserDefaults.standard
        if number == 1 {
            userDefaults.set(true, forKey: "meteor")
            backgroundImage = "bg_01.png"
            levelgamemode = levelArray[number]
            levelNameLabelNode.text = "Prepare for war"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 2 {
            userDefaults.set(true, forKey: "candy")
            backgroundImage = "bg_01.png"
            levelgamemode = levelArray[number]
            levelNameLabelNode.text = "Meteor shower"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 3 {
            userDefaults.set(true, forKey: "fruit")
            backgroundImage = "bg_01.png"
            levelgamemode = levelArray[number]
            levelNameLabelNode.text = "Golden cross"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 4 {
            userDefaults.set(true, forKey: "fruit")
            backgroundImage = "bg_01.png"
            levelgamemode = levelArray[number]
            levelNameLabelNode.text = "Death cross"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 5 {
            userDefaults.set(true, forKey: "fruit")
            backgroundImage = "bg_02.png"
            levelgamemode = levelArray[number]
            levelNameLabelNode.text = "Bull session"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 6 {
            userDefaults.set(true, forKey: "fruit")
            backgroundImage = "bg_02.png"
            levelgamemode = levelArray[number]
            levelNameLabelNode.text = "Bear session"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 7 {
            userDefaults.set(true, forKey: "fruit")
            backgroundImage = "bg_02.png"
            levelgamemode = levelArray[number]
            levelNameLabelNode.text = "Whale alert"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 8 {
            userDefaults.set(true, forKey: "fruit")
            backgroundImage = "bg_02.png"
            levelgamemode = levelArray[number]
            levelNameLabelNode.text = "Correction"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 9 {
            userDefaults.set(true, forKey: "fruit")
            backgroundImage = "bg_03.png"
            levelgamemode = levelArray[number]
            levelNameLabelNode.text = "All time high"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 10 {
            userDefaults.set(true, forKey: "fruit")
            backgroundImage = "bg_03.png"
            levelgamemode = "level1.png"
            levelNameLabelNode.text = "Basic warfare"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }else if number == 0 {
            userDefaults.set(true, forKey: "fruit")
            backgroundImage = "bg_03.png"
            levelgamemode = "level1.png"
            levelNameLabelNode.text = "Basic warfare"
            levelImageNode.texture = SKTexture(imageNamed: levelgamemode)
        }
        userDefaults.synchronize()
        
    }
    
    
    func changeDifficulty() {
        let userDefaults = UserDefaults.standard
        if difficultyLabelNode.text == "Easy" {
            userDefaults.set(true, forKey: "hard")
            difficultyLabelNode.text = "Hard"
            difficulty = "hard"
        }else {
            difficultyLabelNode.text = "Easy"
            userDefaults.set(true, forKey: "easy")
            difficulty = "easy"
        }
        
        userDefaults.synchronize()
    }
    
    
    
    
    
        //TODO : Background
    
           func createBG() {
               for i in 0...2 {
                let bg = SKSpriteNode(imageNamed: backgroundImage)
                   bg.zPosition = -1.0
                   bg.name = "BG"
                   //Check it later (Ana Ekran point en altta 0 da olmalı !)
                   bg.position = CGPoint(x: frame.width / 2, y: CGFloat(i)*bg.frame.height + frame.height / 2.0)
                   addChild(bg)
                  }
           }

           func moveBG() {
               enumerateChildNodes(withName: "BG") { (node ,_) in
                   let node = node as! SKSpriteNode
                   node.position.y -= 4.5
                   
                   if node.position.y < -self.frame.height {
                       node.position.y += self.frame.height * 2.0 + self.frame.height / 2.0 + 700
                   }
               }
           }
    
    
    
    
    }
