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

class Settings: SKScene, SKPhysicsContactDelegate {

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
    
    weak var Mute : SKSpriteNode?
    weak var MuteButton : SKSpriteNode?
    weak var MuteButtonShade : SKSpriteNode?
    
    weak var FullVolume : SKSpriteNode?
    weak var FullVolumeButton : SKSpriteNode?
    weak var FullVolumeButtonShade : SKSpriteNode?
    
    weak var Rate : SKSpriteNode?
    weak var RateButton : SKSpriteNode?
    weak var RateButtonShade : SKSpriteNode?
    
    weak var Credits : SKSpriteNode?
    weak var CreditsButton : SKSpriteNode?
    weak var CreditsButtonShade : SKSpriteNode?
    
    
    var backPressed = false
    var MutePressed = false
    var MediumVolumePressed = false
    var FullVolumePressed = false
    var CreditsPressed = false
    var RatePressed = false
     
    
    override func sceneDidLoad() {

        
        print(mainMenuScene.volume as Any)
        
        if mainMenuScene.volume == false{
            
            self.MuteButton?.texture = SKTexture(imageNamed: "MiddlePausedBarShade")
            
            self.FullVolumeButton?.texture = SKTexture(imageNamed: "MiddlePausedBar")
        }
        
        
        
        if mainMenuScene.volume == true{
            
            self.MuteButton?.texture = SKTexture(imageNamed: "MiddlePausedBar")
           
            self.FullVolumeButton?.texture = SKTexture(imageNamed: "MiddlePausedBarShade")
        }
        
        
        
        addChild(cameraNode)
        camera = cameraNode
        
        self.lastUpdateTime = 0
        
        self.back = self.childNode(withName: "back") as? SKSpriteNode
        self.backButton = self.childNode(withName: "backButton") as? SKSpriteNode
        self.backButtonShade = self.childNode(withName: "backButtonShade") as? SKSpriteNode
        
        self.Mute = self.childNode(withName: "Mute") as? SKSpriteNode
        self.MuteButton = self.childNode(withName: "MuteButton") as? SKSpriteNode
        self.MuteButtonShade = self.childNode(withName: "MuteButtonShade") as? SKSpriteNode
        
        self.FullVolume = self.childNode(withName: "FullVolume") as? SKSpriteNode
        self.FullVolumeButton = self.childNode(withName: "FullVolumeButton") as? SKSpriteNode
        self.FullVolumeButtonShade = self.childNode(withName: "FullVolumeButtonShade") as? SKSpriteNode
        
        self.Rate = self.childNode(withName: "Rate") as? SKSpriteNode
        self.RateButton = self.childNode(withName: "RateButton") as? SKSpriteNode
        self.RateButtonShade = self.childNode(withName: "RateButtonShade") as? SKSpriteNode
        
        self.Credits = self.childNode(withName: "Credits") as? SKSpriteNode
        self.CreditsButton = self.childNode(withName: "CreditsButton") as? SKSpriteNode
        self.CreditsButtonShade = self.childNode(withName: "CreditsButtonShade") as? SKSpriteNode
        
        
        if  mainMenuScene.iPhone11 == true ||  mainMenuScene.iPhone11Pro == true ||  mainMenuScene.iPhone11ProMax == true || mainMenuScene.iPhone12 == true ||  mainMenuScene.iPhone12Pro == true ||  mainMenuScene.iPhone12ProMax == true {
            
            backButton!.position = CGPoint(x: -570, y: 225)
                
            back!.position = backButton!.position
            backButtonShade!.position.x = backButton!.position.x
            backButtonShade!.position.y = backButton!.position.y - 8
            
        }
        
        if  mainMenuScene.iPhoneSE == true ||  mainMenuScene.iPhone8 == true ||  mainMenuScene.iPhone8Plus == true{
        
        }
        
        
        if mainMenuScene.volume == false{
            
            self.MuteButton?.texture = SKTexture(imageNamed: "MiddlePausedBarShade")
            
            self.FullVolumeButton?.texture = SKTexture(imageNamed: "MiddlePausedBar")
        }
        
        
        
        if mainMenuScene.volume == true{
            
            self.MuteButton?.texture = SKTexture(imageNamed: "MiddlePausedBar")
            
            self.FullVolumeButton?.texture = SKTexture(imageNamed: "MiddlePausedBarShade")
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
                
                if MuteButton!.contains(location!){
                
                    mainMenuScene.volume = false
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 153, height: 153, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 167, height: 129, duration: 0.1)
                
                    Mute!.run(resetButtonShrink3)
                    MuteButton!.run(resetButtonShrink2)
                    MuteButtonShade!.run(resetButtonShrink2)
                
                    MutePressed = true
                }
                
                
                
                if FullVolumeButton!.contains(location!){
                
                    mainMenuScene.volume = true
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 153, height: 153, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 167, height: 129, duration: 0.1)
                
                    FullVolume!.run(resetButtonShrink3)
                    FullVolumeButton!.run(resetButtonShrink2)
                    FullVolumeButtonShade!.run(resetButtonShrink2)
                
                    FullVolumePressed = true
                    
                    
                }
                
                if RateButton!.contains(location!){
                    
                    clicknoise()
                    
                    let ChangeSize1 = SKAction.resize(toWidth: 210, height: 52, duration: 0.1)
                    let ChangeSize2 = SKAction.resize(toWidth: 369, height: 72, duration: 0.1)
                
                    Rate!.run(ChangeSize1)
                    RateButton!.run(ChangeSize2)
                    RateButtonShade!.run(ChangeSize2)
                
                    RatePressed = true
                    
                    
                }
                
                if CreditsButton!.contains(location!){
                    
                    clicknoise()
                    
                    let ChangeSize1 = SKAction.resize(toWidth: 210, height: 52, duration: 0.1)
                    let ChangeSize2 = SKAction.resize(toWidth: 369, height: 72, duration: 0.1)
                
                    Credits!.run(ChangeSize1)
                    CreditsButton!.run(ChangeSize2)
                    CreditsButtonShade!.run(ChangeSize2)
                
                    CreditsPressed = true
                    
                    
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
                    let mainmenuscene = HomeScene(fileNamed: "mainMenuScene")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    backButton!.run(seq)
                }
                
                if RatePressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let ChangeSize1 = SKAction.resize(toWidth: 234, height: 57, duration: 0.1)
                    let ChangeSize2 = SKAction.resize(toWidth: 410, height: 80, duration: 0.1)
                    
                    Rate!.run(ChangeSize1)
                    RateButton!.run(ChangeSize2)
                    RateButtonShade!.run(ChangeSize2)
                    
                    RatePressed = false
                    
                    
                    
                    
                    
                }
                
                if CreditsPressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let ChangeSize1 = SKAction.resize(toWidth: 234, height: 57, duration: 0.1)
                    let ChangeSize2 = SKAction.resize(toWidth: 410, height: 80, duration: 0.1)
                    
                    Credits!.run(ChangeSize1)
                    CreditsButton!.run(ChangeSize2)
                    CreditsButtonShade!.run(ChangeSize2)
                    
                    CreditsPressed = false
                    
                    let changeScene = SKAction.run {
                    let ChangeToScene = HomeScene(fileNamed: "mainMenuScene")
                    ChangeToScene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(ChangeToScene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    run(seq)
                    
                }
                
                
                if MutePressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 185, height: 143, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 170, height: 170, duration: 0.1)
                    
                    Mute!.run(resetButtonShrink2)
                    MuteButton!.run(resetButtonShrink3)
                    MuteButtonShade!.run(resetButtonShrink3)
                    
                    MutePressed = false
                    
                    self.MuteButton?.texture = SKTexture(imageNamed: "MiddlePausedBarShade")
                    
                    self.FullVolumeButton?.texture = SKTexture(imageNamed: "MiddlePausedBar")
                    
                    
                    
                    
                    
                    
                }
                
                
                
                if FullVolumePressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 185, height: 143, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 170, height: 170, duration: 0.1)
                    
                    FullVolume!.run(resetButtonShrink2)
                    FullVolumeButton!.run(resetButtonShrink3)
                    FullVolumeButtonShade!.run(resetButtonShrink3)
                    
                    FullVolumePressed = false
                    
                    self.MuteButton?.texture = SKTexture(imageNamed: "MiddlePausedBar")
                    
                    self.FullVolumeButton?.texture = SKTexture(imageNamed: "MiddlePausedBarShade")
                    
                    
                    
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
    

