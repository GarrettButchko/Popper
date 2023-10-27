//
//  mainMenuScene.swift
//  Popper
//
//  Created by Garrett Butchko on 7/22/20.
//  Copyright © 2020 Garrett Butchko. All rights reserved.
//

import SpriteKit
import GameplayKit
import AVFoundation

class Credits: SKScene, SKPhysicsContactDelegate {

    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    
    let cameraNode = SKCameraNode()

    var audioPlayer = AVAudioPlayer?.self
    var backgroundMusic: AVAudioPlayer?
    
    
    
    var location : CGPoint?
    
    weak var back : SKSpriteNode?
    weak var backButton : SKSpriteNode?
    weak var backButtonShade : SKSpriteNode?
    
    var backPressed = false
    
     
    
    override func sceneDidLoad() {

        
        
        
        
        addChild(cameraNode)
        camera = cameraNode
        
        self.lastUpdateTime = 0
        
        self.back = self.childNode(withName: "back") as? SKSpriteNode
        self.backButton = self.childNode(withName: "backButton") as? SKSpriteNode
        self.backButtonShade = self.childNode(withName: "backButtonShade") as? SKSpriteNode
        
       
        
        
        if  mainMenuScene.iPhone11 == true ||  mainMenuScene.iPhone11Pro == true ||  mainMenuScene.iPhone11ProMax == true || mainMenuScene.iPhone12 == true ||  mainMenuScene.iPhone12Pro == true ||  mainMenuScene.iPhone12ProMax == true {
            
            backButton!.position = CGPoint(x: -570, y: 225)
                
            back!.position = backButton!.position
            backButtonShade!.position.x = backButton!.position.x
            backButtonShade!.position.y = backButton!.position.y - 8
            
        }
        
        
        
        
       
       
        
        
    }
        
    func clicknoise() {
        
        if mainMenuScene.volume == true{
        run(SKAction.playSoundFileNamed("Click.mp3", waitForCompletion:false))
        }
    }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches {
            location = t.location(in: self)
    
                if backButton!.contains(location!){
                
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 90, height: 90, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 45, height: 58.5, duration: 0.1)
                
                    back!.run(resetButtonShrink2)
                    backButton!.run(resetButtonShrink3)
                    backButtonShade!.run(resetButtonShrink3)
                
                    backPressed = true
                }
                
                
                
                
                
            
            }
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches {
            location = t.location(in: self)
            
                if backPressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 100, height: 100, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 50, height: 65, duration: 0.1)
                    
                    back!.run(resetButtonShrink2)
                    backButton!.run(resetButtonShrink3)
                    backButtonShade!.run(resetButtonShrink3)
                    
                    backPressed = false
                    
                    let changeScene = SKAction.run {
                    let mainmenuscene = HomeScene(fileNamed: "Settings")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    backButton!.run(seq)
                }
                
                
                
            }
        }
                
                
                
            
        

    
    
    
    
        override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
            
            
            
            
            
            // Initialize _lastUpdateTime if it has not already been
            if (self.lastUpdateTime == 0) {
                self.lastUpdateTime = currentTime
            }
            
            // Calculate time since last update
            let dt = currentTime - self.lastUpdateTime
            
            // Update entities
            for entity in self.entities {
                entity.update(deltaTime: dt)
            }
            
            self.lastUpdateTime = currentTime
        }
    }
    

