//
//  test.swift
//  Popper
//
//  Created by Garrett Butchko on 8/9/20.
//  Copyright © 2020 Garrett Butchko. All rights reserved.
//

import UIKit
import GameplayKit

class test: SKScene {
    
    var entities = [GKEntity]()
        var graphs = [String : GKGraph]()
        private var lastUpdateTime : TimeInterval = 0
        
        let cameraNode = SKCameraNode()
        
        var world1Art : SKSpriteNode?
        var world1ArtShade : SKSpriteNode?
        var world1Gradient : SKSpriteNode?
        var world2Art : SKSpriteNode?
        var world2ArtShade : SKSpriteNode?
        var world2Gradient : SKSpriteNode?
        var world3Art : SKSpriteNode?
        var world3ArtShade : SKSpriteNode?
        var world3Gradient : SKSpriteNode?
        var world4Art : SKSpriteNode?
        var world4ArtShade : SKSpriteNode?
        var world4Gradient : SKSpriteNode?
        var world5Art : SKSpriteNode?
        var world5ArtShade : SKSpriteNode?
        var world5Gradient : SKSpriteNode?
        
        var darkAlpha : SKSpriteNode?
        
        var mainMenu : SKSpriteNode?
        var mainMenuButton : SKSpriteNode?
        var mainMenuButtonShade : SKSpriteNode?
        
        var characterMenu : SKSpriteNode?
        var characterMenuButton : SKSpriteNode?
        var characterMenuButtonShade : SKSpriteNode?
        
        var starCountBackShade : SKSpriteNode?
        var starCountBack : SKSpriteNode?
        var starCountBackStar : SKSpriteNode?
        var starCountLabel : SKLabelNode?
    
        var leftArrow : SKSpriteNode?
        var rightArrow : SKSpriteNode?
        var leftArrowShade : SKSpriteNode?
        var rightArrowShade : SKSpriteNode?
        
        var world1StarCountLabel : SKLabelNode?
        
        var leftArea : SKSpriteNode?
        var rightArea : SKSpriteNode?
        var middleArea : SKSpriteNode?
        
        var location: CGPoint?
        
        var mainMenuPressed = false
        var characterMenuPressed = false
        
        var iPad7thGen = false
        var iPadAir3rdGen = false
        var iPadPro9Point7In = false
        var iPadPro11In = false
        var iPadPro12Point9In = false
        var iPhone8 = false
        var iPhone8Plus = false
        var iPhone11 = false
        var iPhone11Pro = false
        var iPhone11ProMax = false
        var iPhoneSE = false
        
        var transition = false
        var world1cam = true
        var world2cam = false
        var world3cam = false
        var world4cam = false
        var world5cam = false
        
        
        var stars : Int?
        
        var world1 : Bool?
        var world2 : Bool?
        var world3 : Bool?
        var world4 : Bool?
        var world5 : Bool?
    
        var world1Pressed = false
        var world2Pressed = false
        var world3Pressed = false
        var world4Pressed = false
        var world5Pressed = false
    
        var leftPressed = false
        var rightPressed = false
    
        var locationStart : CGPoint?
        var world1loc : CGFloat?
        var world2loc : CGFloat?
        var world3loc : CGFloat?
        var world4loc : CGFloat?
        var world5loc : CGFloat?
        
        var worldmove1 : SKAction?
        
        var touchingWorld = false
        
        var displaySize: CGRect = UIScreen.main.bounds
        
        var displayWidth : CGFloat = 0.0
        var displayHeight : CGFloat = 0.0

        override func sceneDidLoad() {

            addChild(cameraNode)
            camera = cameraNode
            
            self.lastUpdateTime = 0
            
            if displayWidth == 667 && displayHeight == 375{
                
                iPhone8 = true
                
            }
            
            if displayWidth == 414 && displayHeight == 736{
                
                iPhone8Plus = true
                
            }
            
            if displayWidth == 414 && displayHeight == 896{
                
                iPhone11 = true
                
            }
            
            if displayHeight == 375 && displayWidth == 812{
                
                iPhone11Pro = true
                
            }
            
            if displayWidth == 414 && displayHeight == 896{
                
                iPhone11ProMax = true
                
            }
            
            if displayWidth == 320 && displayHeight == 568{
                
                iPhoneSE = true
                
            }
            //MARK: WorldArt
            world1Art = SKSpriteNode(imageNamed: "World1Art")
            world1Art!.position = CGPoint(x: 0.5, y: -37)
            world1Art!.zPosition = 3
            world1Art!.size = CGSize(width: 824, height: 470)
            world1Art!.alpha = 1
            
            
            world2Art = SKSpriteNode(imageNamed: "World2Art")
            world2Art!.position = CGPoint(x: 1080, y: -37)
            world2Art!.zPosition = 3
            world2Art!.size = CGSize(width: 824, height: 470)
            world2Art!.alpha = 1
            
            
            
            
            world3Art = SKSpriteNode(imageNamed: "World3Art")
            world3Art!.position = CGPoint(x: 2148, y: -37)
            world3Art!.zPosition = 3
            world3Art!.size = CGSize(width: 824, height: 470)
            world3Art!.alpha = 1
            
            
            world4Art = SKSpriteNode(imageNamed: "World4Art")
            world4Art!.position = CGPoint(x: 3428, y: -37)
            world4Art!.zPosition = 3
            world4Art!.size = CGSize(width: 824, height: 470)
            world4Art!.alpha = 1
            
            
            world5Art = SKSpriteNode(imageNamed: "World5Art")
            world5Art!.position = CGPoint(x: 4480, y: -37)
            world5Art!.zPosition = 3
            world5Art!.size = CGSize(width: 824, height: 470)
            world5Art!.alpha = 1
            
            
            
            
            //MARK: WorldGradient
            world1Gradient = SKSpriteNode(imageNamed: "World 1")
            world1Gradient!.position = CGPoint(x: 0, y: 0)
            world1Gradient!.zPosition = 0
            world1Gradient!.size = CGSize(width: 1336, height: 1920)
            world1Gradient!.alpha = 1
           
            
            world2Gradient = SKSpriteNode(imageNamed: "World 2")
            world2Gradient!.position = CGPoint(x: 0, y: 0)
            world2Gradient!.zPosition = 0
            world2Gradient!.size = CGSize(width: 1336, height: 1920)
            world2Gradient!.alpha = 0
            
            
            world3Gradient = SKSpriteNode(imageNamed: "World 3")
            world3Gradient!.position = CGPoint(x: 0, y: 0)
            world3Gradient!.zPosition = 0
            world3Gradient!.size = CGSize(width: 1336, height: 1920)
            world3Gradient!.alpha = 0
            
            
            
            world4Gradient = SKSpriteNode(imageNamed: "World 4")
            world4Gradient!.position = CGPoint(x: 0, y: 0)
            world4Gradient!.zPosition = 0
            world4Gradient!.size = CGSize(width: 1336, height: 1920)
            world4Gradient!.alpha = 0
            
            world5Gradient = SKSpriteNode(imageNamed: "World 5")
            world5Gradient!.position = CGPoint(x: 0, y: 0)
            world5Gradient!.zPosition = 0
            world5Gradient!.size = CGSize(width: 1336, height: 1920)
            world5Gradient!.alpha = 0
            
            //MARK: WorldShade
            world1ArtShade = SKSpriteNode(imageNamed: "WorldArtShield")
            world1ArtShade!.position = CGPoint(x: 2.5, y: -45)
            world1ArtShade!.zPosition = 2
            world1ArtShade!.size = CGSize(width: 823, height: 470)
            world1ArtShade!.alpha = 0.3
            
            
            world2ArtShade = SKSpriteNode(imageNamed: "WorldArtShield")
            world2ArtShade!.position = CGPoint(x: 1082, y: -65)
            world2ArtShade!.zPosition = 2
            world2ArtShade!.size = CGSize(width: 823, height: 470)
            world2ArtShade!.alpha = 0.3
            
            
            
            
            
            world3ArtShade = SKSpriteNode(imageNamed: "WorldArtShield")
            world3ArtShade!.position = CGPoint(x: 2240, y: -136)
            world3ArtShade!.zPosition = 2
            world3ArtShade!.size = CGSize(width: 823, height: 470)
            world3ArtShade!.alpha = 0.3
            
            
            
            world4ArtShade = SKSpriteNode(imageNamed: "WorldArtShield")
            world4ArtShade!.position = CGPoint(x: 3430, y: -136)
            world4ArtShade!.zPosition = 2
            world4ArtShade!.size = CGSize(width: 823, height: 470)
            world4ArtShade!.alpha = 0.3
            
            
            
            world5ArtShade = SKSpriteNode(imageNamed: "WorldArtShield")
            world5ArtShade!.position = CGPoint(x: 4482, y: -136)
            world5ArtShade!.zPosition = 2
            world5ArtShade!.size = CGSize(width: 823, height: 470)
            world5ArtShade!.alpha = 0.3
            
            
            //MARK: Buttons
            characterMenu = SKSpriteNode(imageNamed: "Player")
            characterMenu!.position = CGPoint(x: -313, y: 248)
            characterMenu!.zPosition = 6
            characterMenu!.size = CGSize(width: 35, height: 60)
            characterMenu!.alpha = 1
            
            
            characterMenuButton = SKSpriteNode(imageNamed: "mainMenuButton")
            characterMenuButton!.position = CGPoint(x: -313, y: 248)
            characterMenuButton!.zPosition = 4
            characterMenuButton!.size = CGSize(width: 180, height: 80)
            characterMenuButton!.alpha = 0.5
            
            
            characterMenuButtonShade = SKSpriteNode(imageNamed: "mainMenuButtonShade")
            characterMenuButtonShade!.position = CGPoint(x: -313, y: 240)
            characterMenuButtonShade!.zPosition = 3
            characterMenuButtonShade!.size = CGSize(width: 180, height: 80)
            characterMenuButtonShade!.alpha = 0.1
            
            
            mainMenu = SKSpriteNode(imageNamed: "mainMenu")
            mainMenu!.position = CGPoint(x: -510, y: 248)
            mainMenu!.zPosition = 6
            mainMenu!.size = CGSize(width: 55, height: 55)
            mainMenu!.alpha = 1
            
            
            mainMenuButton = SKSpriteNode(imageNamed: "mainMenuButton")
            mainMenuButton!.position = CGPoint(x: -509, y: 248)
            mainMenuButton!.zPosition = 4
            mainMenuButton!.size = CGSize(width: 180, height: 80)
            mainMenuButton!.alpha = 0.5
            
            
            mainMenuButtonShade = SKSpriteNode(imageNamed: "mainMenuButtonShade")
            mainMenuButtonShade!.position = CGPoint(x: -509, y: 240)
            mainMenuButtonShade!.zPosition = 3
            mainMenuButtonShade!.size = CGSize(width: 180, height: 80)
            mainMenuButtonShade!.alpha = 0.1
            
            
            
            //MARK: Misc
            darkAlpha = SKSpriteNode(imageNamed: "BlackSquare")
            darkAlpha!.position = CGPoint(x: 0, y: 0)
            darkAlpha!.zPosition = 1
            darkAlpha!.size = CGSize(width: 1336, height: 1920)
            darkAlpha!.alpha = 0.3
            
            
            leftArea = SKSpriteNode(imageNamed: "BlackSquare")
            leftArea!.color = .red
            leftArea!.position = CGPoint(x: -716, y: 0)
            leftArea!.zPosition = 4
            leftArea!.size = CGSize(width: 1400, height: 470)
            leftArea!.alpha = 0
            
            
            rightArea = SKSpriteNode(imageNamed: "BlackSquare")
            rightArea!.color = .red
            rightArea!.position = CGPoint(x: 716, y: 0)
            rightArea!.zPosition = 4
            rightArea!.size = CGSize(width: 1400, height: 470)
            rightArea!.alpha = 0
            
            
            middleArea = SKSpriteNode(imageNamed: "BlackSquare")
            middleArea!.color = .red
            middleArea!.position = CGPoint(x: 0, y: 0)
            middleArea!.zPosition = 4
            middleArea!.size = CGSize(width: 32, height: 470)
            middleArea!.alpha = 0
            
            
            world1StarCountLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
            world1StarCountLabel!.fontColor = SKColor(red: 231/255, green: 252/255, blue: 1/255, alpha: 100)
            world1StarCountLabel!.fontSize = 50
            world1StarCountLabel!.zPosition = 10
            world1StarCountLabel!.horizontalAlignmentMode = .center
            world1StarCountLabel!.verticalAlignmentMode = .center
            world1StarCountLabel!.alpha = 1
            
            
            starCountLabel = SKLabelNode(fontNamed: "Arial Rounded MT Bold")
            starCountLabel!.fontColor = SKColor(red: 231/255, green: 252/255, blue: 1/255, alpha: 100)
            starCountLabel!.fontSize = 62
            starCountLabel!.zPosition = 5
            starCountLabel!.horizontalAlignmentMode = .center
            starCountLabel!.verticalAlignmentMode = .center
            starCountLabel!.alpha = 1
            
            starCountBack = SKSpriteNode(imageNamed: "mainMenuButton")
            starCountBack!.position = CGPoint(x: 509, y: 248)
            starCountBack!.zPosition = 4
            starCountBack!.size = CGSize(width: 180, height: 80)
            starCountBack!.alpha = 0.5
            
            
            starCountBackShade = SKSpriteNode(imageNamed: "mainMenuButtonShade")
            starCountBackShade!.position = CGPoint(x: 509, y: 239)
            starCountBackShade!.zPosition = 3
            starCountBackShade!.size = CGSize(width: 180, height: 80)
            starCountBackShade!.alpha = 0.1
            
            starCountBackStar = SKSpriteNode(imageNamed: "Star")
            starCountBackStar!.position = CGPoint(x: 470, y: 248)
            starCountBackStar!.zPosition = 5
            starCountBackStar!.size = CGSize(width: 60, height: 60)
            starCountBackStar!.alpha = 1
            
            leftArrow = SKSpriteNode(imageNamed: "leftArrow")
            leftArrow!.position = CGPoint(x: -475, y: -37)
            leftArrow!.zPosition = 5
            leftArrow!.size = CGSize(width: 70, height: 100)
            leftArrow!.alpha = 0.5
            
            rightArrow = SKSpriteNode(imageNamed: "rightArrow")
            rightArrow!.position = CGPoint(x: 475, y: -37)
            rightArrow!.zPosition = 5
            rightArrow!.size = CGSize(width: 70, height: 100)
            rightArrow!.alpha = 0.5
            
            leftArrowShade = SKSpriteNode(imageNamed: "leftArrowShade")
            leftArrowShade!.position = CGPoint(x: -475, y: -45)
            leftArrowShade!.zPosition = 4
            leftArrowShade!.size = CGSize(width: 70, height: 100)
            leftArrowShade!.alpha = 0.1
            
            rightArrowShade = SKSpriteNode(imageNamed: "rightArrowShade")
            rightArrowShade!.position = CGPoint(x: 475, y: -45)
            rightArrowShade!.zPosition = 4
            rightArrowShade!.size = CGSize(width: 70, height: 100)
            rightArrowShade!.alpha = 0.1
            
            
            if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
            
                rightArrow!.position = CGPoint(x: 540, y: -37)
                leftArrow!.position = CGPoint(x: -540, y: -37)
                
                characterMenu!.position = CGPoint(x: -313,y: 248)
                mainMenu!.position = CGPoint(x: -510, y: 248)
                
                starCountBack!.position = CGPoint(x: 510, y: 248)
            }
            
            if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
            
                characterMenu!.position = CGPoint(x: -225,y: 248)
                mainMenu!.position = CGPoint(x: -422,y: 248)
                
                rightArrow!.position = CGPoint(x: 475, y: -37)
                leftArrow!.position = CGPoint(x: -475, y: -37)
                
                
                starCountBack!.position = CGPoint(x: 422,y: 248)
            }
            
            
            addChild(world1Art!)
            addChild(leftArrow!)
            addChild(rightArrow!)
            addChild(leftArrowShade!)
            addChild(rightArrowShade!)
            addChild(world1ArtShade!)
            addChild(world1Gradient!)
            addChild(world2Art!)
            addChild(world2ArtShade!)
            addChild(world2Gradient!)
            addChild(world3Art!)
            addChild(world3ArtShade!)
            addChild(world3Gradient!)
            addChild(world4Art!)
            addChild(world4ArtShade!)
            addChild(world4Gradient!)
            addChild(world5Art!)
            addChild(world5ArtShade!)
            addChild(world5Gradient!)
            addChild(darkAlpha!)
            addChild(mainMenu!)
            addChild(mainMenuButton!)
            addChild(mainMenuButtonShade!)
            addChild(characterMenu!)
            addChild(characterMenuButton!)
            addChild(characterMenuButtonShade!)
            addChild(starCountBackShade!)
            addChild(starCountBack!)
            addChild(starCountBackStar!)
            addChild(starCountLabel!)
            
            displayWidth = displaySize.width
            displayHeight = displaySize.height
            
            world1Gradient!.zPosition = 0
            world2Gradient!.zPosition = 0
            
            world1 = true
            world2 = false
            world3 = false
            world4 = false
            world5 = false
            
            stars = 0
            
            
            
        }
            
            
            override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
                for t in touches {
                location = t.location(in: self)
        
                locationStart = location
                    
                if world1Art!.contains(location!){
                             
                    let resetButtonShrink3 = SKAction.resize(toWidth: 782, height: 446, duration: 0.1)
                
                    world1Art!.run(resetButtonShrink3)
                    world1ArtShade!.run(resetButtonShrink3)
                        
                    world1Pressed = true
                        
                    }
                    
                if world2Art!.contains(location!){
                                 
                    let resetButtonShrink3 = SKAction.resize(toWidth: 782, height: 446, duration: 0.1)
                    
                    world2Art!.run(resetButtonShrink3)
                    world2ArtShade!.run(resetButtonShrink3)
                            
                    world2Pressed = true
                            
                    }
                    
                if world3Art!.contains(location!){
                                     
                    let resetButtonShrink3 = SKAction.resize(toWidth: 782, height: 446, duration: 0.1)
                        
                    world3Art!.run(resetButtonShrink3)
                    world3ArtShade!.run(resetButtonShrink3)
                                
                    world3Pressed = true
                                
                    }
                    
                if world4Art!.contains(location!){
                                     
                    let resetButtonShrink3 = SKAction.resize(toWidth: 782, height: 446, duration: 0.1)
                        
                    world4Art!.run(resetButtonShrink3)
                    world4ArtShade!.run(resetButtonShrink3)
                                
                    world4Pressed = true
                                
                    }
                    
                if world5Art!.contains(location!){
                                     
                    let resetButtonShrink3 = SKAction.resize(toWidth: 782, height: 446, duration: 0.1)
                        
                    world5Art!.run(resetButtonShrink3)
                    world5ArtShade!.run(resetButtonShrink3)
                                
                    world5Pressed = true
                                
                    }
                    
                if mainMenuButton!.contains(location!){
                         
                    let resetButtonShrink3 = SKAction.resize(toWidth: 160, height: 70, duration: 0.1)
                    let resetShrink3 = SKAction.resize(toWidth: 45, height: 45, duration: 0.1)
                        
                    mainMenu!.run(resetShrink3)
                    mainMenuButton!.run(resetButtonShrink3)
                    mainMenuButtonShade!.run(resetButtonShrink3)
                    
                    mainMenuPressed = true
                    
                    }
                    
                    if characterMenuButton!.contains(location!){
                    
                    let resetButtonShrink3 = SKAction.resize(toWidth: 160, height: 70, duration: 0.1)
                    let resetShrink3 = SKAction.resize(toWidth: 30, height: 50, duration: 0.1)
                        
                    characterMenu!.run(resetShrink3)
                    characterMenuButton!.run(resetButtonShrink3)
                    characterMenuButtonShade!.run(resetButtonShrink3)
                        
                    characterMenuPressed = true
                        
                }
                    
                if leftArrow!.contains(location!){
                             
                    let resetButtonShrink3 = SKAction.resize(toWidth: 56, height: 80, duration: 0.1)
                    
                    leftArrow!.run(resetButtonShrink3)
                    leftArrowShade!.run(resetButtonShrink3)
                        
                    leftPressed = true
                        
                    }
                    
                if rightArrow!.contains(location!){
                                 
                    let resetButtonShrink3 = SKAction.resize(toWidth: 56, height: 80, duration: 0.1)
                        
                    rightArrow!.run(resetButtonShrink3)
                    rightArrowShade!.run(resetButtonShrink3)
                            
                    rightPressed = true
                            
                    }
                    
                    
                    
                
                    
                    
                if world1Art!.contains(location!){
                touchingWorld = true
                world1loc = locationStart!.x - world1Art!.position.x
                    }
                    
                if world2Art!.contains(location!){
                touchingWorld = true
                world2loc = locationStart!.x - world2Art!.position.x
                    }
                    
                if world3Art!.contains(location!){
                touchingWorld = true
                world3loc = locationStart!.x - world3Art!.position.x
                    }
                    
                if world4Art!.contains(location!){
                touchingWorld = true
                world4loc = locationStart!.x - world4Art!.position.x
                }
                    
                if world5Art!.contains(location!){
                touchingWorld = true
                world5loc = locationStart!.x - world5Art!.position.x
                }
                    
                    
                
                    
                    
                    
                
                
                }
            }
            
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
        location = t.location(in: self)
          
            
                
            if leftArea!.contains(world1Art!.position) || rightArea!.contains(world1Art!.position){
                    
                let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
                
                world1Art!.run(resetButtonShrink3)
                world1ArtShade!.run(resetButtonShrink3)
                        
                world1Pressed = false
            }
            
            if leftArea!.contains(world2Art!.position) || rightArea!.contains(world2Art!.position){
                
                let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
            
                world2Art!.run(resetButtonShrink3)
                world2ArtShade!.run(resetButtonShrink3)
                    
                world2Pressed = false
            }
            
            if leftArea!.contains(world3Art!.position) || rightArea!.contains(world3Art!.position){
                
                let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
            
                world3Art!.run(resetButtonShrink3)
                world3ArtShade!.run(resetButtonShrink3)
                    
                world3Pressed = false
            }
        
            if leftArea!.contains(world4Art!.position) || rightArea!.contains(world4Art!.position){
            
                let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
        
                world4Art!.run(resetButtonShrink3)
                world4ArtShade!.run(resetButtonShrink3)
                
                world4Pressed = false
            }
            
            if leftArea!.contains(world5Art!.position) || rightArea!.contains(world5Art!.position){
            
                let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
        
                world5Art!.run(resetButtonShrink3)
                world5ArtShade!.run(resetButtonShrink3)
                
                world5Pressed = false
            }
                
            
            
            
            if touchingWorld == true{
            if world1 == true && world1Art!.contains(location!){
            
                let worldloc = location!.x - world1loc!
            
            world1Art!.position.x = worldloc
            
            
            } else if world1 == true{
                
                let worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                    
                world1Art!.run(worldmove1)
            }
            
            
    
        if world2 == true && world2Art!.contains(location!){
            
            let worldloc = location!.x - world2loc!
            
            world2Art!.position.x = worldloc
            
        
            
           
        } else if world2 == true{
            
            let worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                
            world2Art!.run(worldmove1)
        }
            
        if world3 == true && world3Art!.contains(location!){
                
            let worldloc = location!.x - world3loc!
                
            world3Art!.position.x = worldloc
                
            
                
               
        } else if world3 == true{
            
            let worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                
            world3Art!.run(worldmove1)
        }
                
        if world4 == true && world4Art!.contains(location!){
                
            let worldloc = location!.x - world4loc!
                
            world4Art!.position.x = worldloc
                
            
                
               
        } else if world4 == true{
            
            let worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                
            world4Art!.run(worldmove1)
        }
                
        if world5 == true && world5Art!.contains(location!){
                    
            let worldloc = location!.x - world5loc!
                    
            world5Art!.position.x = worldloc
    
                   
            }else if world5 == true{
                
                let worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                    
                world5Art!.run(worldmove1)
            }
                
            }
    
            
            
            
        
        }
    }
            
            override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
                for t in touches {
                location = t.location(in: self)
                
                touchingWorld = false
                
                    if world1Pressed == true && middleArea!.contains(world1Art!.position){
                    
                        let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
                        
                        world1Art!.run(resetButtonShrink3)
                        world1ArtShade!.run(resetButtonShrink3)
                                
                        let changeScene = SKAction.run {
                        let mainmenuscene = GameScene(fileNamed: "GameScene")
                        mainmenuscene?.scaleMode = .aspectFill
                        self.scene?.view?.presentScene(mainmenuscene!)
                                                        //, transition: SKTransition.fade(with: .black, duration: 3.0))
                        }
                            
                        let wait01 = SKAction.wait(forDuration: 0.1)
                            
                        let seq = SKAction.sequence([wait01,changeScene])
                            
                        world1Art!.run(seq)
                        
                        world1Pressed = false
                        
                    }
                    
                    if world2Pressed == true && middleArea!.contains(world2Art!.position){
                    
                        let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
                    
                        world2Art!.run(resetButtonShrink3)
                        world2ArtShade!.run(resetButtonShrink3)
                            
                        world2Pressed = false
                        
                    }
                    
                    if world3Pressed == true && middleArea!.contains(world3Art!.position){
                    
                        let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
                    
                        world3Art!.run(resetButtonShrink3)
                        world3ArtShade!.run(resetButtonShrink3)
                            
                        world3Pressed = false
                        
                    }
                    
                    if world4Pressed == true && middleArea!.contains(world4Art!.position){
                    
                        let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
                
                        world4Art!.run(resetButtonShrink3)
                        world4ArtShade!.run(resetButtonShrink3)
                        
                        world4Pressed = false
                        
                    }
                    
                    if world5Pressed == true && middleArea!.contains(world5Art!.position){
                    
                        let resetButtonShrink3 = SKAction.resize(toWidth: 823, height: 470, duration: 0.1)
                
                        world5Art!.run(resetButtonShrink3)
                        world5ArtShade!.run(resetButtonShrink3)
                        
                        world5Pressed = false
                        
                    }
                    
                    if leftPressed == true{
                                 
                        let resetButtonShrink3 = SKAction.resize(toWidth: 70, height: 100, duration: 0.1)
                        
                        leftArrow!.run(resetButtonShrink3)
                        leftArrowShade!.run(resetButtonShrink3)
                            
                        leftPressed = false
                            
                        if world2 == true {
                            
                            let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                                
                            if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1060,y: world1Art!.position.y), duration: 0.2)
                            }
                            if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1360,y: world1Art!.position.y), duration: 0.2)
                            }
                            
                            
                            
                            let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                            let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                            
                            world2Gradient!.run(changegradalpha0)
                            world1Gradient!.run(changegradalpha1)
                            
                            world1Art!.run(worldmove)
                            world2Art!.run(worldmove1!)
                            
                            world1 = true
                            world2 = false
                            world3 = false
                            world4 = false
                            world5 = false
                            
                        } else if world3 == true{
                            
                            let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                                
                            if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1060,y: world1Art!.position.y), duration: 0.2)
                            }
                            if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1360,y: world1Art!.position.y), duration: 0.2)
                            }
                            
                            
                            
                            let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                            let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                            
                            world3Gradient!.run(changegradalpha0)
                            world2Gradient!.run(changegradalpha1)
                            
                            world2Art!.run(worldmove)
                            world3Art!.run(worldmove1!)
                            
                            world1 = false
                            world2 = true
                            world3 = false
                            world4 = false
                            world5 = false
                            
                        } else if world4 == true{
                            
                            let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                                
                            if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1060,y: world1Art!.position.y), duration: 0.2)
                            }
                            if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1360,y: world1Art!.position.y), duration: 0.2)
                            }
                            
                            
                            
                            let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                            let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                            
                            world4Gradient!.run(changegradalpha0)
                            world3Gradient!.run(changegradalpha1)
                            
                            world3Art!.run(worldmove)
                            world4Art!.run(worldmove1!)
                            
                            world1 = false
                            world2 = false
                            world3 = true
                            world4 = false
                            world5 = false
                        } else if world5 == true{
                            
                            let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                            if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1060,y: world1Art!.position.y), duration: 0.2)
                            }
                            if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1360,y: world1Art!.position.y), duration: 0.2)
                            }
                            
                            let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                            let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                            
                            world4Gradient!.run(changegradalpha1)
                            world5Gradient!.run(changegradalpha0)
                            
                            world4Art!.run(worldmove)
                            world5Art!.run(worldmove1!)
                            
                            world1 = false
                            world2 = false
                            world3 = false
                            world4 = true
                            world5 = false
                        }
                        
                        
                        }
                        
                    if rightPressed == true{
                                     
                        let resetButtonShrink3 = SKAction.resize(toWidth: 70, height: 100, duration: 0.1)
                            
                        rightArrow!.run(resetButtonShrink3)
                        rightArrowShade!.run(resetButtonShrink3)
                                
                        rightPressed = false
                        
                        if world1 == true {
                        
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                        if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1060,y: world1Art!.position.y), duration: 0.2)
                        }
                        if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1360,y: world1Art!.position.y), duration: 0.2)
                        }
                        
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                        let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                        
                        world2Gradient!.run(changegradalpha1)
                        world1Gradient!.run(changegradalpha0)
                        
                        world2Art!.run(worldmove)
                        world1Art!.run(worldmove1!)
                        
                        world1 = false
                        world2 = true
                        world3 = false
                        world4 = false
                        world5 = false
                    
                    } else if world2 == true{
                            
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                        if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1060,y: world1Art!.position.y), duration: 0.2)
                        }
                        if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1360,y: world1Art!.position.y), duration: 0.2)
                        }
                            
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                        let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                            
                        world2Gradient!.run(changegradalpha0)
                        world3Gradient!.run(changegradalpha1)
                            
                        world3Art!.run(worldmove)
                        world2Art!.run(worldmove1!)
                            
                        world1 = false
                        world2 = false
                        world3 = true
                        world4 = false
                        world5 = false
                            
                    } else if world3 == true{
                        
                        
                                                  
                       let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                                                  
                       if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                       worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1060,y: world1Art!.position.y), duration: 0.2)
                       }
                       if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                       worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1360,y: world1Art!.position.y), duration: 0.2)}
                                              
                                              
                                              
                       let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                       let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                                              
                       world3Gradient!.run(changegradalpha0)
                       world4Gradient!.run(changegradalpha1)
                                              
                       world4Art!.run(worldmove)
                       world3Art!.run(worldmove1!)
                                              
                       world1 = false
                       world2 = false
                       world3 = false
                       world4 = true
                       world5 = false
                                              
                       
                    } else if world4 == true{
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                                                   
                        if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1060,y: world1Art!.position.y), duration: 0.2)
                        }
                        if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1360,y: world1Art!.position.y), duration: 0.2)
                            
                        }
                                               
                                               
                                               
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                        let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                                               
                        world4Gradient!.run(changegradalpha0)
                        world5Gradient!.run(changegradalpha1)
                                               
                        world5Art!.run(worldmove)
                        world4Art!.run(worldmove1!)
                                               
                        world1 = false
                        world2 = false
                        world3 = false
                        world4 = false
                        world5 = true
                        
                        
                    }
                        
                        
                        
                        }
                    
                    if mainMenuPressed == true{
                    let resetButtonShrink = SKAction.resize(toWidth: 180, height: 80, duration: 0.1)
                    let resetShrink = SKAction.resize(toWidth: 55, height: 55, duration: 0.1)
                     
                    mainMenu!.run(resetShrink)
                    mainMenuButton!.run(resetButtonShrink)
                    mainMenuButtonShade!.run(resetButtonShrink)
                        
                        let changeScene = SKAction.run {
                        let mainmenuscene = mainMenuScene(fileNamed: "mainMenuScene")
                        mainmenuscene?.scaleMode = .aspectFill
                        self.scene?.view?.presentScene(mainmenuscene!)
                                                        //, transition: SKTransition.fade(with: .black, duration: 3.0))
                        }
                            
                        let wait01 = SKAction.wait(forDuration: 0.1)
                            
                        let seq = SKAction.sequence([wait01,changeScene])
                            
                        mainMenuButton!.run(seq)
                        
                    }
                    
                    if characterMenuPressed == true{
                    let resetButtonShrink = SKAction.resize(toWidth: 180, height: 80, duration: 0.1)
                    let resetShrink = SKAction.resize(toWidth: 35, height: 60, duration: 0.1)
                     
                    characterMenu!.run(resetShrink)
                    characterMenuButton!.run(resetButtonShrink)
                    characterMenuButtonShade!.run(resetButtonShrink)
                    }
                    
                    
                    
                    if world1 == true && middleArea!.contains(world1Art!.position){
                        
                    let worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                        
                    world1Art!.run(worldmove1)
                        
                        
                    }
                    
                    if world2 == true && middleArea!.contains(world2Art!.position){
                        
                    let worldmove2 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                        
                    world2Art!.run(worldmove2)
                        
                        
                    }
                    
                    if world3 == true && middleArea!.contains(world3Art!.position){
                        
                    let worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                        
                    world3Art!.run(worldmove1)
                        
                        
                    }
                    
                    if world4 == true && middleArea!.contains(world4Art!.position){
                        
                    let worldmove2 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                        
                    world4Art!.run(worldmove2)
                        
                        
                    }
                    
                    if world5 == true && middleArea!.contains(world5Art!.position){
                        
                    let worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                        
                    world5Art!.run(worldmove1)
                        
                        
                    }
                    
                    
                    
                    if world1 == true {
                        
                    if leftArea!.contains(world1Art!.position) && world1Art!.contains(location!){
                    
                    let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                    if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1060,y: world1Art!.position.y), duration: 0.2)
                    }
                    if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1360,y: world1Art!.position.y), duration: 0.2)
                    }
                    
                    let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                    let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                    
                    world2Gradient!.run(changegradalpha1)
                    world1Gradient!.run(changegradalpha0)
                    
                    world2Art!.run(worldmove)
                    world1Art!.run(worldmove1!)
                    
                    world1 = false
                    world2 = true
                    world3 = false
                    world4 = false
                    world5 = false
                    
                        
                        
                        
                } else if rightArea!.contains(world1Art!.position){
                    
                    let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                    if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1060,y: world1Art!.position.y), duration: 0.2)
                    }
                    if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1360,y: world1Art!.position.y), duration: 0.2)
                    }
                    
                    
                    
                    let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                    let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                    
                    world2Gradient!.run(changegradalpha0)
                    world1Gradient!.run(changegradalpha1)
                    
                    world1Art!.run(worldmove)
                    world2Art!.run(worldmove1!)
                    
                    world1 = true
                    world2 = false
                    world3 = false
                    world4 = false
                    world5 = false
                    
                    
                        }
                    }
                    
                    if world2 == true{
                        if leftArea!.contains(world2Art!.position) && world2Art!.contains(location!){
                        
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                        if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1060,y: world1Art!.position.y), duration: 0.2)
                        }
                        if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1360,y: world1Art!.position.y), duration: 0.2)
                        }
                        
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                        let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                        
                        world2Gradient!.run(changegradalpha0)
                        world3Gradient!.run(changegradalpha1)
                        
                        world3Art!.run(worldmove)
                        world2Art!.run(worldmove1!)
                        
                        world1 = false
                        world2 = false
                        world3 = true
                        world4 = false
                        world5 = false
                        
                        
                        } else if rightArea!.contains(world2Art!.position) && world2Art!.contains(location!){
                                
                            let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                                
                            if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1060,y: world1Art!.position.y), duration: 0.2)
                            }
                            if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                                worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1360,y: world1Art!.position.y), duration: 0.2)
                            }
                            
                            
                            
                            let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                            let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                            
                            world2Gradient!.run(changegradalpha0)
                            world1Gradient!.run(changegradalpha1)
                            
                            world1Art!.run(worldmove)
                            world2Art!.run(worldmove1!)
                            
                            world1 = true
                            world2 = false
                            world3 = false
                            world4 = false
                            world5 = false
                            
                        }
                    }
                    
                    
                    if world3 == true {
                        
                    if rightArea!.contains(world3Art!.position) && world3Art!.contains(location!) {
                            
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                            
                        if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1060,y: world1Art!.position.y), duration: 0.2)
                        }
                        if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1360,y: world1Art!.position.y), duration: 0.2)
                        }
                        
                        
                        
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                        let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                        
                        world3Gradient!.run(changegradalpha0)
                        world2Gradient!.run(changegradalpha1)
                        
                        world2Art!.run(worldmove)
                        world3Art!.run(worldmove1!)
                        
                        world1 = false
                        world2 = true
                        world3 = false
                        world4 = false
                        world5 = false
                        
                        } else if leftArea!.contains(world3Art!.position) && world3Art!.contains(location!){
                                                   
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                                                   
                        if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1060,y: world1Art!.position.y), duration: 0.2)
                        }
                        if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1360,y: world1Art!.position.y), duration: 0.2)}
                                               
                                               
                                               
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                        let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                                               
                        world3Gradient!.run(changegradalpha0)
                        world4Gradient!.run(changegradalpha1)
                                               
                        world4Art!.run(worldmove)
                        world3Art!.run(worldmove1!)
                                               
                        world1 = false
                        world2 = false
                        world3 = false
                        world4 = true
                        world5 = false
                                               
                        }
                    }
                    
                    if world4 == true {
                        
                    if rightArea!.contains(world4Art!.position) && world4Art!.contains(location!) {
                            
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                            
                        if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1060,y: world1Art!.position.y), duration: 0.2)
                        }
                        if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1360,y: world1Art!.position.y), duration: 0.2)
                        }
                        
                        
                        
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                        let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                        
                        world4Gradient!.run(changegradalpha0)
                        world3Gradient!.run(changegradalpha1)
                        
                        world3Art!.run(worldmove)
                        world4Art!.run(worldmove1!)
                        
                        world1 = false
                        world2 = false
                        world3 = true
                        world4 = false
                        world5 = false
                        
                        } else if leftArea!.contains(world4Art!.position) && world4Art!.contains(location!){
                                                   
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.2)
                                                   
                        if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1060,y: world1Art!.position.y), duration: 0.2)
                        }
                        if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                        worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x - 1360,y: world1Art!.position.y), duration: 0.2)
                            
                        }
                                               
                                               
                                               
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                        let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                                               
                        world4Gradient!.run(changegradalpha0)
                        world5Gradient!.run(changegradalpha1)
                                               
                        world5Art!.run(worldmove)
                        world4Art!.run(worldmove1!)
                                               
                        world1 = false
                        world2 = false
                        world3 = false
                        world4 = false
                        world5 = true
                                               
                        }
                    }
                    
                    if world5 == true {
                            
                        if rightArea!.contains(world5Art!.position) && world5Art!.contains(location!){
                        
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.1)
                        if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1060,y: world1Art!.position.y), duration: 0.2)
                        }
                        if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
                            worldmove1 = SKAction.move(to: CGPoint(x: cameraNode.position.x + 1360,y: world1Art!.position.y), duration: 0.2)
                        }
                        
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.2)
                        let changegradalpha0 = SKAction.fadeAlpha(to: 0 , duration: 0.2)
                        
                        world4Gradient!.run(changegradalpha1)
                        world5Gradient!.run(changegradalpha0)
                        
                        world4Art!.run(worldmove)
                        world5Art!.run(worldmove1!)
                        
                        world1 = false
                        world2 = false
                        world3 = false
                        world4 = true
                        world5 = false
                        
                        
                    } else if leftArea!.contains(world5Art!.position){
                        
                        let worldmove = SKAction.move(to: CGPoint(x: cameraNode.position.x,y: world1Art!.position.y), duration: 0.1)
                        
                        let changegradalpha1 = SKAction.fadeAlpha(to: 1, duration: 0.1)
                    
                        world5Gradient!.run(changegradalpha1)
                        
                        world5Art!.run(worldmove)
                        
                        world1 = false
                        world2 = false
                        world3 = false
                        world4 = false
                        world5 = true
                        
                        
                            }
                        }
                    
                    
                    
                }
            }
        
        func positions(){
            
            if displayWidth == 667 && displayHeight == 375{
                
                iPhone8 = true
                
            }
            
            if displayWidth == 414 && displayHeight == 736{
                
                iPhone8Plus = true
                
            }
            
            if displayWidth == 414 && displayHeight == 896{
                
                iPhone11 = true
                
            }
            
            if displayHeight == 375 && displayWidth == 812{
                
                iPhone11Pro = true
                
            }
            
            if displayWidth == 414 && displayHeight == 896{
                
                iPhone11ProMax = true
                
            }
            
            if displayWidth == 320 && displayHeight == 568{
                
                iPhoneSE = true
                
            }
            
            rightArrowShade!.position.x = rightArrow!.position.x
            rightArrowShade!.position.y = rightArrow!.position.y - 8
            
            leftArrowShade!.position.x = leftArrow!.position.x
            leftArrowShade!.position.y = leftArrow!.position.y - 8
            
            
            mainMenuButtonShade!.position.x = mainMenuButton!.position.x
            mainMenuButtonShade!.position.y = mainMenuButton!.position.y - 8
            mainMenuButton!.position = mainMenu!.position
            
            starCountBackShade!.position.x = starCountBack!.position.x
            starCountBackShade!.position.y = starCountBack!.position.y - 8
            
            starCountBackStar!.position.x = starCountBack!.position.x - 41
            starCountLabel!.position.x = starCountBack!.position.x + 31
            
            starCountBackStar!.position.y = starCountBack!.position.y
            starCountLabel!.position.y = starCountBack!.position.y
            
            world1StarCountLabel!.position.y = world1Art!.position.y + 181
            world1StarCountLabel!.position.x = world1Art!.position.x + 320
            
            characterMenuButtonShade!.position.x = characterMenuButton!.position.x
            characterMenuButtonShade!.position.y = characterMenuButton!.position.y - 8
            characterMenuButton!.position = characterMenu!.position
            
            world1ArtShade!.position.x = world1Art!.position.x
            world1ArtShade!.position.y = world1Art!.position.y - 8
            
            world2ArtShade!.position.x = world2Art!.position.x
            world2ArtShade!.position.y = world2Art!.position.y - 8
            
            world3ArtShade!.position.x = world3Art!.position.x
            world3ArtShade!.position.y = world3Art!.position.y - 8
            
            world4ArtShade!.position.x = world4Art!.position.x
            world4ArtShade!.position.y = world4Art!.position.y - 8
            
            world5ArtShade!.position.x = world5Art!.position.x
            world5ArtShade!.position.y = world5Art!.position.y - 8
            
            if iPhoneSE == true || iPhone8 == true || iPhone8Plus == true{
            
                characterMenu!.position = CGPoint(x: -225,y: 248)
                mainMenu!.position = CGPoint(x: -422,y: 248)
                
                rightArrow!.position = CGPoint(x: 475, y: -37)
                leftArrow!.position = CGPoint(x: -475, y: -37)
                
                
                starCountBack!.position = CGPoint(x: 422,y: 248)
            
                if world1 == true{
                world2Art!.position.x = world1Art!.position.x + 1060
                world2ArtShade!.position.x = world1Art!.position.x + 1060
                }
                
                if world2 == true{
                world1Art!.position.x = world2Art!.position.x - 1060
                world1ArtShade!.position.x = world2Art!.position.x - 1060
                    
                world3Art!.position.x = world2Art!.position.x + 1060
                world3ArtShade!.position.x = world2Art!.position.x + 1060
                    
                }
                
                if world3 == true{
                world2Art!.position.x = world3Art!.position.x - 1060
                world2ArtShade!.position.x = world3Art!.position.x - 1060
                    
                world4Art!.position.x = world3Art!.position.x + 1060
                world4ArtShade!.position.x = world3Art!.position.x + 1060
                }
                
                if world4 == true{
                world3Art!.position.x = world4Art!.position.x - 1060
                world3ArtShade!.position.x = world4Art!.position.x - 1060
                    
                world5Art!.position.x = world4Art!.position.x + 1060
                world5ArtShade!.position.x = world4Art!.position.x + 1060
                }
                
                if world5 == true{
                world4Art!.position.x = world5Art!.position.x - 1060
                world4ArtShade!.position.x = world5Art!.position.x - 1060
                }
                
            }
            
            if iPhone11 == true || iPhone11Pro == true || iPhone11ProMax == true{
            
                rightArrow!.position = CGPoint(x: 540, y: -37)
                leftArrow!.position = CGPoint(x: -540, y: -37)
                
                characterMenu!.position = CGPoint(x: -313,y: 248)
                mainMenu!.position = CGPoint(x: -510, y: 248)
                
                starCountBack!.position = CGPoint(x: 510, y: 248)
                
                if world1 == true{
                world2Art!.position.x = world1Art!.position.x + 1360
                world2ArtShade!.position.x = world1Art!.position.x + 1360
                }
                
                if world2 == true{
                world1Art!.position.x = world2Art!.position.x - 1360
                world1ArtShade!.position.x = world2Art!.position.x - 1360
                
                world3Art!.position.x = world2Art!.position.x + 1360
                world3ArtShade!.position.x = world2Art!.position.x + 1360
                    
                }
                
                if world3 == true{
                world2Art!.position.x = world3Art!.position.x - 1360
                world2ArtShade!.position.x = world3Art!.position.x - 1360
                    
                world4Art!.position.x = world3Art!.position.x + 1360
                world4ArtShade!.position.x = world3Art!.position.x + 1360
                }
                
                if world4 == true{
                world3Art!.position.x = world4Art!.position.x - 1360
                world3ArtShade!.position.x = world4Art!.position.x - 1360
                    
                world5Art!.position.x = world4Art!.position.x + 1360
                world5ArtShade!.position.x = world4Art!.position.x + 1360
                }
                
                if world5 == true{
                world4Art!.position.x = world5Art!.position.x - 1360
                world4ArtShade!.position.x = world5Art!.position.x - 1360
                }
                
                
            }
            
            
            
            
            
        }
        
        override func didSimulatePhysics() {
            
            positions()
            
        }
        
            override func update(_ currentTime: TimeInterval) {
                // Called before each frame is rendered
                
                world1StarCountLabel!.text = "\(stars!)/30"
                starCountLabel!.text = "\(stars!)"
                
                positions()
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
            
