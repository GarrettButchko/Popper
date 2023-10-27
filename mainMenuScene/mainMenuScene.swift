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

class mainMenuScene: SKScene, SKPhysicsContactDelegate {

    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    
    let cameraNode = SKCameraNode()

    var audioPlayer = AVAudioPlayer?.self
    var backgroundMusic: AVAudioPlayer?
    
    var location : CGPoint?
    
    weak var play : SKSpriteNode?
    weak var playButton : SKSpriteNode?
    weak var playButtonShade : SKSpriteNode?
    
    weak var settings : SKSpriteNode?
    weak var settingsButton : SKSpriteNode?
    weak var settingsButtonShade : SKSpriteNode?
    
    weak var characterMenu : SKSpriteNode?
    weak var characterMenuButton : SKSpriteNode?
    var characterMenuButtonShade : SKSpriteNode?
    
    weak var tutorial : SKSpriteNode?
    weak var tutorialButton : SKSpriteNode?
    var tutorialButtonShade : SKSpriteNode?
    
    
    static var volume : Bool?
    
    var playButtonPressed = false
    var settingsButtonPressed = false
    var characterMenuButtonPressed = false
    var tutorialButtonPressed = false
    
    static var iPhone8 = false
    static var iPhone8Plus = false
    static var iPhone11 = false
    static var iPhone11Pro = false
    static var iPhone11ProMax = false
    static var iPhone12mini = false
    static var iPhone12 = false
    static var iPhone12Pro = false
    static var iPhone12ProMax = false
    static var iPhoneSE = false
    
    var displaySize: CGRect = UIScreen.main.bounds
    
    var displayWidth : CGFloat = 0.0
    var displayHeight : CGFloat = 0.0
    
    override func sceneDidLoad() {

        if mainMenuScene.volume == nil{
            
            mainMenuScene.volume = true
            
        }
        
        
        if mainMenuScene.volume == true{
        let backgroundSound = SKAudioNode(fileNamed: "AUDIO_5592.m4a")
         addChild(backgroundSound)
        }
        
        
        
        
        displayWidth = displaySize.width
        displayHeight = displaySize.height
        
        
        
        print(displayWidth)
        print(displayHeight)
        
        
        
        if displayHeight == 375 && displayWidth == 667{
            
            mainMenuScene.iPhone8 = true
            
        }
        
        if displayHeight == 414 && displayWidth == 736{
            
            mainMenuScene.iPhone8Plus = true
            
        }
        
        if displayHeight == 414 && displayWidth == 896{
            
            mainMenuScene.iPhone11 = true
            
        }
        
        if displayHeight == 375 && displayWidth == 812{
            
            mainMenuScene.iPhone11Pro = true
            
        }
        
        
        if displayHeight == 320 && displayWidth == 568{
            
            mainMenuScene.iPhoneSE = true
            
        }
        
        if displayHeight == 390 && displayWidth == 844{
            
            mainMenuScene.iPhone12 = true
            
        }
        
        if displayHeight == 390 && displayWidth == 844{
            
            mainMenuScene.iPhone12Pro = true
            
        }
        
        if displayHeight == 428 && displayWidth == 926{
            
            mainMenuScene.iPhone12ProMax = true
            
        }
        
        addChild(cameraNode)
        camera = cameraNode
        
        self.lastUpdateTime = 0
        
        self.play = self.childNode(withName: "play") as? SKSpriteNode
        self.playButton = self.childNode(withName: "playButton") as? SKSpriteNode
        self.playButtonShade = self.childNode(withName: "playButtonShade") as? SKSpriteNode
        
        self.settings = self.childNode(withName: "settings") as? SKSpriteNode
        self.settingsButton = self.childNode(withName: "settingsButton") as? SKSpriteNode
        self.settingsButtonShade = self.childNode(withName: "settingsButtonShade") as? SKSpriteNode
        
        
        
        
        self.characterMenu = self.childNode(withName: "characterMenu") as? SKSpriteNode
        self.characterMenuButton = self.childNode(withName: "characterMenuButton") as? SKSpriteNode
        self.characterMenuButtonShade = self.childNode(withName: "characterMenuButtonShade") as? SKSpriteNode
        
        self.tutorial = self.childNode(withName: "tutorial") as? SKSpriteNode
        self.tutorialButton = self.childNode(withName: "tutorialButton") as? SKSpriteNode
        self.tutorialButtonShade = self.childNode(withName: "tutorialButtonShade") as? SKSpriteNode
        
        
        
        characterMenuButtonShade!.position.x = characterMenu!.position.x
        characterMenuButtonShade!.position.y = characterMenu!.position.y - 8
        characterMenuButton!.position = characterMenu!.position
        
        playButtonShade!.position.x = play!.position.x
        playButtonShade!.position.y = play!.position.y - 8
        playButton!.position = play!.position
        
        settingsButtonShade!.position.x = settings!.position.x
        settingsButtonShade!.position.y = settings!.position.y - 8
        settingsButton!.position = settings!.position
        
    }
        
    func clicknoise() {
        
        if mainMenuScene.volume == true{
        run(SKAction.playSoundFileNamed("Click.mp3", waitForCompletion:false))
        }
    }
        
        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches {
            location = t.location(in: self)
    
                if playButton!.contains(location!){
                         
                    clicknoise()
                    
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 376.2, height: 74.7, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 46.8, height: 51.3, duration: 0.1)
                    
                    play!.run(resetButtonShrink2)
                    playButton!.run(resetButtonShrink3)
                    playButtonShade!.run(resetButtonShrink3)
                    
                    
                    
                    playButtonPressed = true
                    
                }
                
                if settingsButton!.contains(location!){
                         
                    clicknoise()
                    
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 167.4, height: 103.5, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 63, height: 63, duration: 0.1)
                    
                    
                    settings!.run(resetButtonShrink2)
                    settingsButton!.run(resetButtonShrink3)
                    settingsButtonShade!.run(resetButtonShrink3)
                    
                    settingsButtonPressed = true
                    
                }
                
                if characterMenuButton!.contains(location!){
                         
                    clicknoise()
                    
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 167.4, height: 103.5, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 31.5, height: 52.2, duration: 0.1)
                    
                    characterMenu!.run(resetButtonShrink2)
                    characterMenuButton!.run(resetButtonShrink3)
                    characterMenuButtonShade!.run(resetButtonShrink3)
                    
                    characterMenuButtonPressed = true
                    
                }
                
                if tutorialButton!.contains(location!){
                         
                    clicknoise()
                    
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 376.2, height: 74.7, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 194, height: 42.4, duration: 0.1)
                    
                    
                    tutorial!.run(resetButtonShrink2)
                    tutorialButton!.run(resetButtonShrink3)
                    tutorialButtonShade!.run(resetButtonShrink3)
                    
                    tutorialButtonPressed = true
                    
                }
                
                
                
            
            }
        }
        
        override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches {
            location = t.location(in: self)
            
                if playButtonPressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 418, height: 83, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 52, height: 57, duration: 0.1)
                    
                    play!.run(resetButtonShrink2)
                    playButton!.run(resetButtonShrink3)
                    playButtonShade!.run(resetButtonShrink3)
                    
                    let changeScene = SKAction.run {
                    let mainmenuscene = HomeScene(fileNamed: "HomeScene")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    playButton!.run(seq)
                    
                    
                    playButtonPressed = false
                    
                }
                
                if settingsButtonPressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 185, height: 115, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 70, height: 70, duration: 0.1)
                    
                    
                    settings!.run(resetButtonShrink2)
                    settingsButton!.run(resetButtonShrink3)
                    settingsButtonShade!.run(resetButtonShrink3)
                    
                    settingsButtonPressed = false
                    
                    let changeScene = SKAction.run {
                    let mainmenuscene = HomeScene(fileNamed: "Settings")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    run(seq)
                    
                }
                
                if characterMenuButtonPressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 185, height: 115, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 35, height: 58, duration: 0.1)
                    
                    characterMenu!.run(resetButtonShrink2)
                    characterMenuButton!.run(resetButtonShrink3)
                    characterMenuButtonShade!.run(resetButtonShrink3)
                    
                    let changeScene = SKAction.run {
                    let mainmenuscene = skinsScene(fileNamed: "skinsScene")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    characterMenuButton!.run(seq)
                    
                    
                    characterMenuButtonPressed = false
                    
                }
                
                if tutorialButtonPressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 418, height: 83, duration: 0.1)
                    let resetButtonShrink2 = SKAction.resize(toWidth: 216, height: 46, duration: 0.1)
                    
                    tutorial!.run(resetButtonShrink2)
                    tutorialButton!.run(resetButtonShrink3)
                    tutorialButtonShade!.run(resetButtonShrink3)
                    
                    let changeScene = SKAction.run {
                    let mainmenuscene = HomeScene(fileNamed: "Tutorial")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    run(seq)
                    
                    
                    tutorialButtonPressed = false
                    
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
    
    

