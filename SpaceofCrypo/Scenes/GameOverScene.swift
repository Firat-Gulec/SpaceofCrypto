//
//  GameOverScene.swift
//  SpaceofCrypto
//
//  Created by Fırat GÜLEÇ on 24.07.2021.
//  Copyright © 2021 Firat Gulec. All rights reserved.



import UIKit
import SpriteKit
import CoreData
import StoreKit


class GameOverScene: SKScene, SKProductsRequestDelegate, SKPaymentTransactionObserver {
  

    
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
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let meteorscene = MeteorScene(size: self.size)
                if selectedlevel == 10 {
                    meteorscene.selectedLevel = 1
                } else {
                meteorscene.selectedLevel = selectedlevel + 1
                }
                meteorscene.difficulty = difficulty
                self.view?.presentScene(meteorscene, transition: transition)
                transactionState = .purchased
                
                print("purchased")
            case .failed:
                print("did not purchase")
            case .restored:
                print("purchase restored")
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let meteorscene = MeteorScene(size: self.size)
                if selectedlevel == 10 {
                    meteorscene.selectedLevel = 1
                } else {
                meteorscene.selectedLevel = selectedlevel + 1
                }
                meteorscene.difficulty = difficulty
                self.view?.presentScene(meteorscene, transition: transition)
                transactionState = .purchased
            case .deferred:
                break
            @unknown default:
                break
            }
        })
    }
    
    var defaults = UserDefaults.standard
    var score:Int = 0
    var highScore = Int()
    var selectedlevel = Int()
    var gameoverLabelstr = "GAME OVER"
    
    var gamelogoImageNode:SKSpriteNode!
    var gamelogoLabelNode:SKLabelNode!
    var gameoverLabelNode:SKLabelNode!
    var goscoreLabelNode:SKLabelNode!
    var highscoreLabelNode:SKLabelNode!
    var newGameButtonNode:SKSpriteNode!
    var nextGameButtonNode:SKSpriteNode!
    var nextLevelImageNode:SKSpriteNode!
    var shareButtonNode:SKSpriteNode!
    
    var levelImageArray = ["level1", "level2" , "level3", "level4", "level5", "level6", "level7", "level8", "level9", "level10"]
    var backgroundImage = String()
    var difficulty = String()
    
    override func didMove(to view: SKView) {
        createBG()
        
        fetchProduct()
        SKPaymentQueue.default().add(self)
        
        
        gamelogoImageNode = (self.childNode(withName: "gamelogoImage") as! SKSpriteNode)
        gamelogoImageNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 350)
        gamelogoImageNode.texture = SKTexture(imageNamed: "gamename")
        gamelogoLabelNode = (self.childNode(withName: "gamelogoLabel") as! SKLabelNode)
        gamelogoLabelNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 350)
        gamelogoLabelNode.isHidden = true
        gameoverLabelNode = (self.childNode(withName: "gameoverLabel") as! SKLabelNode)
        gameoverLabelNode.text = gameoverLabelstr
        gameoverLabelNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 500)
        goscoreLabelNode = (self.childNode(withName: "scoreLabel") as! SKLabelNode)
        goscoreLabelNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 560)
        highscoreLabelNode = (self.childNode(withName: "hscoreLabel") as! SKLabelNode)
        highscoreLabelNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 600)
        highscoreLabelNode.isHidden = true
        goscoreLabelNode.text = "SCORE :\(score)"
        highScore = defaults.integer(forKey: "high")
        highscoreLabelNode.text = "HIGH SCORE: \(highScore)"
        newGameButtonNode = (self.childNode(withName: "newGameButton") as! SKSpriteNode)
        newGameButtonNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 650)
        newGameButtonNode.texture = SKTexture(imageNamed: "playagain")
        
        nextLevelImageNode = (self.childNode(withName: "levelImage") as! SKSpriteNode)
        nextLevelImageNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 1000)
        if selectedlevel == 10 {
        nextLevelImageNode.texture = SKTexture(imageNamed: levelImageArray[1])
        }else {
            nextLevelImageNode.texture = SKTexture(imageNamed: levelImageArray[selectedlevel])
        }
        
        nextGameButtonNode = (self.childNode(withName: "nextGameButton") as! SKSpriteNode)
        nextGameButtonNode.texture = SKTexture(imageNamed: "nextlevel")
        nextGameButtonNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 790)
        if gameoverLabelstr == "GAME OVER" {
            nextGameButtonNode.isHidden = true
            nextLevelImageNode.isHidden = true
        }
        shareButtonNode = (self.childNode(withName: "shareButton") as! SKSpriteNode)
        shareButtonNode.position = CGPoint(x: self.frame.width/2, y: self.frame.height - 1200)
        shareButtonNode.texture = SKTexture(imageNamed: "share")
        if backgroundImage == "bg_02.png" {
            goscoreLabelNode.fontColor = .black
            highscoreLabelNode.fontColor = .black
            gameoverLabelNode.fontColor = .black
            gamelogoLabelNode.fontColor = .black
        }
        if  score > highScore {          // Your test was wrong
                        highScore = score          // Taht is the new highScore
                        defaults.set(highScore, forKey: "high")
                        highscoreLabelNode.text = "HIGH SCORE: \(highScore)"
                    }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let location = touch?.location(in: self) {
            let node = self.nodes(at: location)
            
           if node[0].name == "newGameButton" {
                let transition = SKTransition.flipHorizontal(withDuration: 0.5)
                let meteorscene = MeteorScene(size: self.size)
                meteorscene.selectedLevel = selectedlevel
                meteorscene.difficulty = difficulty
                self.view?.presentScene(meteorscene, transition: transition)
           }else if node[0].name == "nextGameButton" {
            
            let payment = SKPayment(product: models[0])
            SKPaymentQueue.default().add(payment)
            
           }else if node[0].name == "shareButton" {
            let postText: String = "Check out my score! Can you beat it?"
            let postImage: UIImage = getScreenshot(scene: self.scene!)
            let activityItems = [postText, postImage] as [Any]
            let activityController = UIActivityViewController(
                activityItems: activityItems,
                applicationActivities: nil)
           
            activityController.popoverPresentationController?.sourceView = self.view
            activityController.popoverPresentationController?.sourceRect = CGRect(x: scene!.view!.bounds.midX, y: scene!.view!.bounds.midY,width: 0,height: 0)
            activityController.popoverPresentationController?.permittedArrowDirections = UIPopoverArrowDirection.down
            UIApplication.shared.windows.first?.rootViewController?.present(activityController, animated: true, completion: nil)
            
            
           }
        }
    }
    
    //SHARE : Screenshot
    
    func getScreenshot(scene: SKScene) -> UIImage {
        let snapshotView = scene.view!.snapshotView(afterScreenUpdates: true)
        let bounds = UIScreen.main.bounds
            UIGraphicsBeginImageContextWithOptions(bounds.size, false, 0)
        snapshotView!.drawHierarchy(in: bounds, afterScreenUpdates: true)
        let screenshotImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            return screenshotImage;
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
}
