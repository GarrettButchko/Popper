//
//  world1Levels.swift
//  Popper
//
//  Created by Garrett Butchko on 8/11/20.
//  Copyright © 2020 Garrett Butchko. All rights reserved.
//

import UIKit
import GameplayKit

class world1Levels: SKScene {
        
        var entities = [GKEntity]()
        var graphs = [String : GKGraph]()
        private var lastUpdateTime : TimeInterval = 0
    
        var location : CGPoint?
    
        var level1Pressed = false
        var level2Pressed = false
        var level3Pressed = false
        var level4Pressed = false
        var level5Pressed = false
        var level6Pressed = false
        var level7Pressed = false
        var level8Pressed = false
        var level9Pressed = false
        var level10Pressed = false
        
        var backPressed = false
    
    
        weak var level1 : SKSpriteNode?
        weak var level1Button : SKSpriteNode?
        weak var level1ButtonShade : SKSpriteNode?
    
        weak var level2 : SKSpriteNode?
        weak var level2Button : SKSpriteNode?
        weak var level2ButtonShade : SKSpriteNode?
    
        weak var level3 : SKSpriteNode?
        weak var level3Button : SKSpriteNode?
        weak var level3ButtonShade : SKSpriteNode?
    
        weak var level4 : SKSpriteNode?
        weak var level4Button : SKSpriteNode?
        weak var level4ButtonShade : SKSpriteNode?
    
        weak var level5 : SKSpriteNode?
        weak var level5Button : SKSpriteNode?
        weak var level5ButtonShade : SKSpriteNode?
    
        weak var level6 : SKSpriteNode?
        weak var level6Button : SKSpriteNode?
        weak var level6ButtonShade : SKSpriteNode?
    
        weak var level7 : SKSpriteNode?
        weak var level7Button : SKSpriteNode?
        weak var level7ButtonShade : SKSpriteNode?
    
        weak var level8 : SKSpriteNode?
        weak var level8Button : SKSpriteNode?
        weak var level8ButtonShade : SKSpriteNode?
    
        weak var level9 : SKSpriteNode?
        weak var level9Button : SKSpriteNode?
        weak var level9ButtonShade : SKSpriteNode?
    
        weak var level10 : SKSpriteNode?
        weak var level10Button : SKSpriteNode?
        weak var level10ButtonShade : SKSpriteNode?
    
        weak var back : SKSpriteNode?
        weak var backButton : SKSpriteNode?
        weak var backButtonShade : SKSpriteNode?
    
        weak var starCount : SKLabelNode?
    
        var world1Stars = 0
    
        override func sceneDidLoad() {
            
            if mainMenuScene.volume == true{
            let backgroundSound = SKAudioNode(fileNamed: "AUDIO_5592.m4a")
             addChild(backgroundSound)
            }
            
            
            self.lastUpdateTime = 0
        
            if HomeScene.level1HaveStar1 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level1HaveStar2 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level1HaveStar3 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            
            if HomeScene.level2HaveStar1 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level2HaveStar2 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level2HaveStar3 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            
            if HomeScene.level3HaveStar1 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level3HaveStar2 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level3HaveStar3 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            
            if HomeScene.level4HaveStar1 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level4HaveStar2 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level4HaveStar3 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            
            if HomeScene.level5HaveStar1 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level5HaveStar2 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            if HomeScene.level5HaveStar3 == true{
                
                
                world1Stars = world1Stars + 1
                
            }
            
            
            self.starCount = self.childNode(withName: "starCount") as? SKLabelNode
            
            self.level1 = self.childNode(withName: "level1") as? SKSpriteNode
            self.level1Button = self.childNode(withName: "level1Button") as? SKSpriteNode
            self.level1ButtonShade = self.childNode(withName: "level1ButtonShade") as? SKSpriteNode
            
            self.level2 = self.childNode(withName: "level2") as? SKSpriteNode
            self.level2Button = self.childNode(withName: "level2Button") as? SKSpriteNode
            self.level2ButtonShade = self.childNode(withName: "level2ButtonShade") as? SKSpriteNode
            
            self.level3 = self.childNode(withName: "level3") as? SKSpriteNode
            self.level3Button = self.childNode(withName: "level3Button") as? SKSpriteNode
            self.level3ButtonShade = self.childNode(withName: "level3ButtonShade") as? SKSpriteNode
            
            self.level4 = self.childNode(withName: "level4") as? SKSpriteNode
            self.level4Button = self.childNode(withName: "level4Button") as? SKSpriteNode
            self.level4ButtonShade = self.childNode(withName: "level4ButtonShade") as? SKSpriteNode
            
            self.level5 = self.childNode(withName: "level5") as? SKSpriteNode
            self.level5Button = self.childNode(withName: "level5Button") as? SKSpriteNode
            self.level5ButtonShade = self.childNode(withName: "level5ButtonShade") as? SKSpriteNode
            
            self.level6 = self.childNode(withName: "level6") as? SKSpriteNode
            self.level6Button = self.childNode(withName: "level6Button") as? SKSpriteNode
            self.level6ButtonShade = self.childNode(withName: "level6ButtonShade") as? SKSpriteNode
            
            self.level7 = self.childNode(withName: "level7") as? SKSpriteNode
            self.level7Button = self.childNode(withName: "level7Button") as? SKSpriteNode
            self.level7ButtonShade = self.childNode(withName: "level7ButtonShade") as? SKSpriteNode
            
            self.level8 = self.childNode(withName: "level8") as? SKSpriteNode
            self.level8Button = self.childNode(withName: "level8Button") as? SKSpriteNode
            self.level8ButtonShade = self.childNode(withName: "level8ButtonShade") as? SKSpriteNode
            
            self.level9 = self.childNode(withName: "level9") as? SKSpriteNode
            self.level9Button = self.childNode(withName: "level9Button") as? SKSpriteNode
            self.level9ButtonShade = self.childNode(withName: "level9ButtonShade") as? SKSpriteNode
            
            self.level10 = self.childNode(withName: "level10") as? SKSpriteNode
            self.level10Button = self.childNode(withName: "level10Button") as? SKSpriteNode
            self.level10ButtonShade = self.childNode(withName: "level10ButtonShade") as? SKSpriteNode
            
            self.back = self.childNode(withName: "back") as? SKSpriteNode
            self.backButton = self.childNode(withName: "backButton") as? SKSpriteNode
            self.backButtonShade = self.childNode(withName: "backButtonShade") as? SKSpriteNode
            
            
            
            
            
            if HomeScene.level1HaveStar1 == true && (HomeScene.level1HaveStar2 == false || HomeScene.level1HaveStar2 == nil) && (HomeScene.level1HaveStar3 == false || HomeScene.level1HaveStar3 == nil){
                
                level1!.texture = SKTexture(imageNamed: "1100")
                
                
            }
            
            if (HomeScene.level1HaveStar1 == false || HomeScene.level1HaveStar1 == nil) && HomeScene.level1HaveStar2 == true && (HomeScene.level1HaveStar3 == false || HomeScene.level1HaveStar3 == nil) {
                
                
                level1!.texture = SKTexture(imageNamed: "1010")
                
            }
            
            if (HomeScene.level1HaveStar1 == false || HomeScene.level1HaveStar1 == nil) && (HomeScene.level1HaveStar2 == false || HomeScene.level1HaveStar2 == nil) && HomeScene.level1HaveStar3 == true{
                
                
                level1!.texture = SKTexture(imageNamed: "1001")
            }
            
            if (HomeScene.level1HaveStar1 == false || HomeScene.level1HaveStar1 == nil) && HomeScene.level1HaveStar2 == true && HomeScene.level1HaveStar3 == true{
                
                level1!.texture = SKTexture(imageNamed: "1011")
                
            }
            
            if HomeScene.level1HaveStar1 == true && HomeScene.level1HaveStar2 == true && (HomeScene.level1HaveStar3 == false || HomeScene.level1HaveStar3 == nil) {
                
                level1!.texture = SKTexture(imageNamed: "1110")
                
            }
            
            if HomeScene.level1HaveStar1 == true && HomeScene.level1HaveStar2 == true && HomeScene.level1HaveStar3 == true{
                
                level1!.texture = SKTexture(imageNamed: "1111")
                
            }
            
            if HomeScene.level1HaveStar1 == true && (HomeScene.level1HaveStar2 == false || HomeScene.level1HaveStar2 == nil) && HomeScene.level1HaveStar3 == true{
                
                level1!.texture = SKTexture(imageNamed: "1101")
                
            }
            
            if HomeScene.level2HaveStar1 == true && (HomeScene.level2HaveStar2 == false || HomeScene.level2HaveStar2 == nil) && (HomeScene.level2HaveStar3 == false || HomeScene.level2HaveStar3 == nil){
                
                level2!.texture = SKTexture(imageNamed: "2100")
                
                
            }
            
            if (HomeScene.level2HaveStar1 == false || HomeScene.level2HaveStar1 == nil) && HomeScene.level2HaveStar2 == true && (HomeScene.level2HaveStar3 == false || HomeScene.level2HaveStar3 == nil) {
                
                
                level2!.texture = SKTexture(imageNamed: "2010")
                
            }
            
            if (HomeScene.level2HaveStar1 == false || HomeScene.level2HaveStar1 == nil) && (HomeScene.level2HaveStar2 == false || HomeScene.level2HaveStar2 == nil) && HomeScene.level2HaveStar3 == true{
                
                
                level2!.texture = SKTexture(imageNamed: "2001")
            }
            
            if (HomeScene.level2HaveStar1 == false || HomeScene.level2HaveStar1 == nil) && HomeScene.level2HaveStar2 == true && HomeScene.level2HaveStar3 == true{
                
                level2!.texture = SKTexture(imageNamed: "2011")
                
            }
            
            if HomeScene.level2HaveStar1 == true && HomeScene.level2HaveStar2 == true && (HomeScene.level2HaveStar3 == false || HomeScene.level2HaveStar3 == nil) {
                
                level2!.texture = SKTexture(imageNamed: "2110")
                
            }
            
            if HomeScene.level2HaveStar1 == true && HomeScene.level2HaveStar2 == true && HomeScene.level2HaveStar3 == true{
                
                level2!.texture = SKTexture(imageNamed: "2111")
                
            }
            
            if HomeScene.level2HaveStar1 == true && (HomeScene.level2HaveStar2 == false || HomeScene.level2HaveStar2 == nil) && HomeScene.level2HaveStar3 == true{
                
                level2!.texture = SKTexture(imageNamed: "2101")
                
            }
            
            if HomeScene.level3HaveStar1 == true && (HomeScene.level3HaveStar2 == false || HomeScene.level3HaveStar2 == nil) && (HomeScene.level3HaveStar3 == false || HomeScene.level3HaveStar3 == nil){
                
                level3!.texture = SKTexture(imageNamed: "3100")
                
                
            }
            
            if (HomeScene.level3HaveStar1 == false || HomeScene.level3HaveStar1 == nil) && HomeScene.level3HaveStar2 == true && (HomeScene.level3HaveStar3 == false || HomeScene.level3HaveStar3 == nil) {
                
                
                level3!.texture = SKTexture(imageNamed: "3010")
                
            }
            
            if (HomeScene.level3HaveStar1 == false || HomeScene.level3HaveStar1 == nil) && (HomeScene.level3HaveStar2 == false || HomeScene.level3HaveStar2 == nil) && HomeScene.level3HaveStar3 == true{
                
                
                level3!.texture = SKTexture(imageNamed: "3001")
            }
            
            if (HomeScene.level3HaveStar1 == false || HomeScene.level3HaveStar1 == nil) && HomeScene.level3HaveStar2 == true && HomeScene.level3HaveStar3 == true{
                
                level3!.texture = SKTexture(imageNamed: "3011")
                
            }
            
            if HomeScene.level3HaveStar1 == true && HomeScene.level3HaveStar2 == true && (HomeScene.level3HaveStar3 == false || HomeScene.level3HaveStar3 == nil) {
                
                level3!.texture = SKTexture(imageNamed: "3110")
                
            }
            
            if HomeScene.level3HaveStar1 == true && HomeScene.level3HaveStar2 == true && HomeScene.level3HaveStar3 == true{
                
                level3!.texture = SKTexture(imageNamed: "3111")
                
            }
            
            if HomeScene.level3HaveStar1 == true && (HomeScene.level3HaveStar2 == false || HomeScene.level3HaveStar2 == nil) && HomeScene.level3HaveStar3 == true{
                
                level3!.texture = SKTexture(imageNamed: "3101")
                
            }
            
            
            
            
            
            if HomeScene.level4HaveStar1 == true && (HomeScene.level4HaveStar2 == false || HomeScene.level4HaveStar2 == nil) && (HomeScene.level4HaveStar3 == false || HomeScene.level4HaveStar3 == nil){
                
                level4!.texture = SKTexture(imageNamed: "4100")
                
                
            }
            
            if (HomeScene.level4HaveStar1 == false || HomeScene.level4HaveStar1 == nil) && HomeScene.level4HaveStar2 == true && (HomeScene.level4HaveStar3 == false || HomeScene.level4HaveStar3 == nil) {
                
                
                level4!.texture = SKTexture(imageNamed: "4010")
                
            }
            
            if (HomeScene.level4HaveStar1 == false || HomeScene.level4HaveStar1 == nil) && (HomeScene.level4HaveStar2 == false || HomeScene.level4HaveStar2 == nil) && HomeScene.level4HaveStar3 == true{
                
                
                level4!.texture = SKTexture(imageNamed: "4001")
            }
            
            if (HomeScene.level4HaveStar1 == false || HomeScene.level4HaveStar1 == nil) && HomeScene.level4HaveStar2 == true && HomeScene.level4HaveStar3 == true{
                
                level4!.texture = SKTexture(imageNamed: "4011")
                
            }
            
            if HomeScene.level4HaveStar1 == true && HomeScene.level4HaveStar2 == true && (HomeScene.level4HaveStar3 == false || HomeScene.level4HaveStar3 == nil) {
                
                level4!.texture = SKTexture(imageNamed: "4110")
                
            }
            
            if HomeScene.level4HaveStar1 == true && HomeScene.level4HaveStar2 == true && HomeScene.level4HaveStar3 == true{
                
                level4!.texture = SKTexture(imageNamed: "4111")
                
            }
            
            if HomeScene.level4HaveStar1 == true && (HomeScene.level4HaveStar2 == false || HomeScene.level4HaveStar2 == nil) && HomeScene.level4HaveStar3 == true{
                
                level4!.texture = SKTexture(imageNamed: "4101")
                
            }
            
            
            if HomeScene.level5HaveStar1 == true && (HomeScene.level5HaveStar2 == false || HomeScene.level5HaveStar2 == nil) && (HomeScene.level5HaveStar3 == false || HomeScene.level5HaveStar3 == nil){
                
                level5!.texture = SKTexture(imageNamed: "5100")
                
                
            }
            
            if (HomeScene.level5HaveStar1 == false || HomeScene.level5HaveStar1 == nil) && HomeScene.level5HaveStar2 == true && (HomeScene.level5HaveStar3 == false || HomeScene.level5HaveStar3 == nil) {
                
                
                level5!.texture = SKTexture(imageNamed: "5010")
                
            }
            
            if (HomeScene.level5HaveStar1 == false || HomeScene.level5HaveStar1 == nil) && (HomeScene.level5HaveStar2 == false || HomeScene.level5HaveStar2 == nil) && HomeScene.level5HaveStar3 == true{
                
                
                level5!.texture = SKTexture(imageNamed: "5001")
            }
            
            if (HomeScene.level5HaveStar1 == false || HomeScene.level5HaveStar1 == nil) && HomeScene.level5HaveStar2 == true && HomeScene.level5HaveStar3 == true{
                
                level5!.texture = SKTexture(imageNamed: "5011")
                
            }
            
            if HomeScene.level5HaveStar1 == true && HomeScene.level5HaveStar2 == true && (HomeScene.level5HaveStar3 == false || HomeScene.level5HaveStar3 == nil) {
                
                level5!.texture = SKTexture(imageNamed: "5110")
                
            }
            
            if HomeScene.level5HaveStar1 == true && HomeScene.level5HaveStar2 == true && HomeScene.level5HaveStar3 == true{
                
                level5!.texture = SKTexture(imageNamed: "5111")
                
            }
            
            if HomeScene.level5HaveStar1 == true && (HomeScene.level5HaveStar2 == false || HomeScene.level5HaveStar2 == nil) && HomeScene.level5HaveStar3 == true{
                
                level5!.texture = SKTexture(imageNamed: "5101")
                
            }
            
            
            
            if  mainMenuScene.iPhone11 == true ||  mainMenuScene.iPhone11Pro == true ||  mainMenuScene.iPhone11ProMax == true || mainMenuScene.iPhone12 == true ||  mainMenuScene.iPhone12Pro == true ||  mainMenuScene.iPhone12ProMax == true
            {
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
                
                if level1Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level1!.run(resetButtonShrink3)
                    level1Button!.run(resetButtonShrink3)
                    level1ButtonShade!.run(resetButtonShrink3)
                    
                    level1Pressed = true
                    
                }
                
                if level2Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level2!.run(resetButtonShrink3)
                    level2Button!.run(resetButtonShrink3)
                    level2ButtonShade!.run(resetButtonShrink3)
                    
                    level2Pressed = true
                    
                }
                
                if level3Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level3!.run(resetButtonShrink3)
                    level3Button!.run(resetButtonShrink3)
                    level3ButtonShade!.run(resetButtonShrink3)
                    
                    level3Pressed = true
                    
                }
                
                if level4Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level4!.run(resetButtonShrink3)
                    level4Button!.run(resetButtonShrink3)
                    level4ButtonShade!.run(resetButtonShrink3)
                    
                    level4Pressed = true
                    
                }
                
                if level5Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level5!.run(resetButtonShrink3)
                    level5Button!.run(resetButtonShrink3)
                    level5ButtonShade!.run(resetButtonShrink3)
                
                    level5Pressed = true
                    
                }
                
                if level6Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level6!.run(resetButtonShrink3)
                    level6Button!.run(resetButtonShrink3)
                    level6ButtonShade!.run(resetButtonShrink3)
                    
                    level6Pressed = true
                    
                }
                
                if level7Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level7!.run(resetButtonShrink3)
                    level7Button!.run(resetButtonShrink3)
                    level7ButtonShade!.run(resetButtonShrink3)
                    
                    level7Pressed = true
                    
                }
                
                if level8Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level8!.run(resetButtonShrink3)
                    level8Button!.run(resetButtonShrink3)
                    level8ButtonShade!.run(resetButtonShrink3)
                    
                    level8Pressed = true
                    
                }
                
                if level9Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level9!.run(resetButtonShrink3)
                    level9Button!.run(resetButtonShrink3)
                    level9ButtonShade!.run(resetButtonShrink3)
                    
                    level9Pressed = true
                    
                }
                
                if level10Button!.contains(location!){
                    
                    clicknoise()
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 142.2, height: 142.2, duration: 0.1)
                    
                    level10!.run(resetButtonShrink3)
                    level10Button!.run(resetButtonShrink3)
                    level10ButtonShade!.run(resetButtonShrink3)
                    
                    level10Pressed = true
                    
                }
            }
        }
        
        override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
            for t in touches {
            location = t.location(in: self)
            
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
                    let mainmenuscene = HomeScene(fileNamed: "HomeScene")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    backButton!.run(seq)
                }
                
                if level1Pressed == true{
                         
                    //toWidth: 418, height: 83
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level1!.run(resetButtonShrink3)
                    level1Button!.run(resetButtonShrink3)
                    level1ButtonShade!.run(resetButtonShrink3)
                    
                    level1Pressed = false
                    
                    let changeScene = SKAction.run {
                    let mainmenuscene = Popper.level1(fileNamed: "level1")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    level1Button!.run(seq)
                }
                
                if level2Pressed == true{
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level2!.run(resetButtonShrink3)
                    level2Button!.run(resetButtonShrink3)
                    level2ButtonShade!.run(resetButtonShrink3)
                    
                    level2Pressed = false
                    
                    let changeScene = SKAction.run {
                    let mainmenuscene = Popper.level2(fileNamed: "level2")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    level2Button!.run(seq)
                }
                
                if level3Pressed == true{
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level3!.run(resetButtonShrink3)
                    level3Button!.run(resetButtonShrink3)
                    level3ButtonShade!.run(resetButtonShrink3)
                    
                    level3Pressed = false
                    
                    let changeScene = SKAction.run {
                    let mainmenuscene = Popper.level3(fileNamed: "level3")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    level3Button!.run(seq)
                    
                }
                
                if level4Pressed == true{
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level4!.run(resetButtonShrink3)
                    level4Button!.run(resetButtonShrink3)
                    level4ButtonShade!.run(resetButtonShrink3)
                    
                    level4Pressed = false
                    
                    let changeScene = SKAction.run {
                        let mainmenuscene = Popper.level4(fileNamed: "level4")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    level4Button!.run(seq)
                }
                
                if level5Pressed == true{
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level5!.run(resetButtonShrink3)
                    level5Button!.run(resetButtonShrink3)
                    level5ButtonShade!.run(resetButtonShrink3)
                    
                    level5Pressed = false
                    
                    let changeScene = SKAction.run {
                        let mainmenuscene = Popper.level5(fileNamed: "level5")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                    }
                        
                    let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    let seq = SKAction.sequence([wait01,changeScene])
                        
                    level5Button!.run(seq)
                }
                
                if level6Pressed == true{
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level6!.run(resetButtonShrink3)
                    level6Button!.run(resetButtonShrink3)
                    level6ButtonShade!.run(resetButtonShrink3)
                    
                    level6Pressed = false
                    
                    //let changeScene = SKAction.run {
                    //let mainmenuscene = level6(fileNamed: "level6")
                    //mainmenuscene?.scaleMode = .aspectFill
                    //self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    //}
                        
                    //let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    //let seq = SKAction.sequence([wait01,changeScene])
                        
                    //level6Button!.run(seq)
                }
                
                if level7Pressed == true{
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level7!.run(resetButtonShrink3)
                    level7Button!.run(resetButtonShrink3)
                    level7ButtonShade!.run(resetButtonShrink3)
                    
                    level7Pressed = false
                    
                    //let changeScene = SKAction.run {
                    //let mainmenuscene = level7(fileNamed: "level7")
                    //mainmenuscene?.scaleMode = .aspectFill
                    //self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    //}
                        
                    //let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    //let seq = SKAction.sequence([wait01,changeScene])
                        
                    //level5Button!.run(seq)
                }
                
                if level8Pressed == true{
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level8!.run(resetButtonShrink3)
                    level8Button!.run(resetButtonShrink3)
                    level8ButtonShade!.run(resetButtonShrink3)
                    
                    level8Pressed = false
                    
                    //let changeScene = SKAction.run {
                    //let mainmenuscene = level8(fileNamed: "level8")
                    //mainmenuscene?.scaleMode = .aspectFill
                    //self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    //}
                        
                    //let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    //let seq = SKAction.sequence([wait01,changeScene])
                        
                    //level5Button!.run(seq)
                }
                
                if level9Pressed == true{
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level9!.run(resetButtonShrink3)
                    level9Button!.run(resetButtonShrink3)
                    level9ButtonShade!.run(resetButtonShrink3)
                    
                    level9Pressed = false
                    
                    //let changeScene = SKAction.run {
                    //let mainmenuscene = level9(fileNamed: "level9")
                    //mainmenuscene?.scaleMode = .aspectFill
                    //self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    //}
                        
                    //let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    //let seq = SKAction.sequence([wait01,changeScene])
                        
                    //level5Button!.run(seq)
                }
                
                if level10Pressed == true{
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 158, height: 158, duration: 0.1)
                    
                    level10!.run(resetButtonShrink3)
                    level10Button!.run(resetButtonShrink3)
                    level10ButtonShade!.run(resetButtonShrink3)
                    
                    level10Pressed = false
                    
                    //let changeScene = SKAction.run {
                    //let mainmenuscene = level10(fileNamed: "level10")
                    //mainmenuscene?.scaleMode = .aspectFill
                    //self.scene?.view?.presentScene(mainmenuscene!)
                                                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                    //}
                        
                    //let wait01 = SKAction.wait(forDuration: 0.1)
                        
                    //let seq = SKAction.sequence([wait01,changeScene])
                        
                    //level5Button!.run(seq)
                }
                
                
                
                
                
            }
        }
        
        
        override func update(_ currentTime: TimeInterval) {
            // Called before each frame is rendered
            
            
            
            
            
            
            
            starCount!.text = "\(world1Stars)/30"
            
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

    


