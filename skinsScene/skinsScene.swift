//
//  HomeScene.swift
//  Popper
//
//  Created by Garrett Butchko on 8/3/20.
//  Copyright © 2020 Garrett Butchko. All rights reserved.
//
import UIKit
import GameplayKit
import AVFoundation

class skinsScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
            
    let cameraNode = SKCameraNode()
        
    var leftArrow : SKSpriteNode?
    var rightArrow : SKSpriteNode?
    var leftArrowShade : SKSpriteNode?
    var rightArrowShade : SKSpriteNode?
    var skinHolder1 : SKSpriteNode?
    var skinHolder2 : SKSpriteNode?
    var skinHolder3 : SKSpriteNode?
    var skinHolder4 : SKSpriteNode?
    var skinHolder5 : SKSpriteNode?
    var skinHolder6 : SKSpriteNode?
    var skinHolder7 : SKSpriteNode?
    var skinHolder8 : SKSpriteNode?
    var skinHolder9 : SKSpriteNode?
    var skinHolder10 : SKSpriteNode?
    var skinHolder11 : SKSpriteNode?
    var skinHolder12 : SKSpriteNode?
    var skinHolder13 : SKSpriteNode?
    var skinHolder14 : SKSpriteNode?
    var skinHolderShade1 : SKSpriteNode?
    var skinHolderShade2 : SKSpriteNode?
    var skinHolderShade3 : SKSpriteNode?
    var skinHolderShade4 : SKSpriteNode?
    var skinHolderShade5 : SKSpriteNode?
    var skinHolderShade6 : SKSpriteNode?
    var skinHolderShade7 : SKSpriteNode?
    var skinShown : SKSpriteNode?
    var skinShower : SKSpriteNode?
    var skinShowerShade : SKSpriteNode?
    var starCountBackShade : SKSpriteNode?
    var starCountBack : SKSpriteNode?
    var starCountBackStar : SKSpriteNode?
    var starCountLabel : SKLabelNode?
    var skinHolderLockShade3 : SKSpriteNode?
    var skinHolderLock3 : SKSpriteNode?
    var skinHolderLockShade4 : SKSpriteNode?
    var skinHolderLock4 : SKSpriteNode?
    var skinHolderLockShade5 : SKSpriteNode?
    var skinHolderLock5 : SKSpriteNode?
    var skinHolderLockShade6 : SKSpriteNode?
    var skinHolderLock6 : SKSpriteNode?
    
    
    static var currentSkin : String?
    
    
    
    var whiteplayer : SKSpriteNode?
    var redplayer : SKSpriteNode?
    var orangeplayer : SKSpriteNode?
    var yellowplayer : SKSpriteNode?
    var greenplayer : SKSpriteNode?
    var blueplayer : SKSpriteNode?
    var purpleplayer : SKSpriteNode?
    
    var skinHolder1pressed = false
    var skinHolder2pressed = false
    var skinHolder3pressed = false
    var skinHolder4pressed = false
    var skinHolder5pressed = false
    var skinHolder6pressed = false

    var threeunlocked = false
    var fourunlocked = false
    var fiveunlocked = false
    var sixunlocked = false

    var backPressed = false
    
    
    
    weak var back : SKSpriteNode?
    weak var backButton : SKSpriteNode?
    weak var backButtonShade : SKSpriteNode?
    
    var Size : CGSize?
  
    
    var location: CGPoint?
            
    
    
            var leftPressed = false
            var rightPressed = false

            override func sceneDidLoad() {

                
                if mainMenuScene.volume == true{
                let backgroundSound = SKAudioNode(fileNamed: "AUDIO_5592.m4a")
                 addChild(backgroundSound)
                }
               
                
                
                
                
                HomeScene.totalStars = 0
                
                Size = CGSize(width: 140, height: 140)
                
                addChild(cameraNode)
                camera = cameraNode
                
                self.lastUpdateTime = 0
                
                if skinsScene.currentSkin == nil{
                    
                    skinsScene.currentSkin = String("Player")
                    
                    
                }
                
                self.back = self.childNode(withName: "back") as? SKSpriteNode
                self.backButton = self.childNode(withName: "backButton") as? SKSpriteNode
                self.backButtonShade = self.childNode(withName: "backButtonShade") as? SKSpriteNode
                
                
                skinShower = SKSpriteNode(imageNamed: "skinShower")
                skinShower!.position = CGPoint(x: 0, y: 130)
                skinShower!.zPosition = 5
                skinShower!.size = CGSize(width: 210, height: 260)
                skinShower!.alpha = 0.5
                
                skinShowerShade = SKSpriteNode(imageNamed: "skinShowerShade")
                skinShowerShade!.position = CGPoint(x: 0, y: 122)
                skinShowerShade!.zPosition = 4
                skinShowerShade!.size = CGSize(width: 210, height: 260)
                skinShowerShade!.alpha = 0.1
                
                skinHolder1 = SKSpriteNode(imageNamed: "skinsHolder")
                skinHolder1!.position = CGPoint(x: -400, y: -150)
                skinHolder1!.zPosition = 4
                skinHolder1!.size = Size!
                skinHolder1!.alpha = 0.5
        
                skinHolder2 = SKSpriteNode(imageNamed: "skinsHolder")
                skinHolder2!.position = CGPoint(x: -240, y: -150)
                skinHolder2!.zPosition = 4
                skinHolder2!.size = Size!
                skinHolder2!.alpha = 0.5
                
                skinHolder3 = SKSpriteNode(imageNamed: "skinsHolder")
                skinHolder3!.position = CGPoint(x: -80, y: -150)
                skinHolder3!.zPosition = 4
                skinHolder3!.size = Size!
                skinHolder3!.alpha = 0.5
                
                skinHolder4 = SKSpriteNode(imageNamed: "skinsHolder")
                skinHolder4!.position = CGPoint(x: 80, y: -150)
                skinHolder4!.zPosition = 4
                skinHolder4!.size = Size!
                skinHolder4!.alpha = 0.5
        
                skinHolder5 = SKSpriteNode(imageNamed: "skinsHolder")
                skinHolder5!.position = CGPoint(x: 240, y: -150)
                skinHolder5!.zPosition = 4
                skinHolder5!.size = Size!
                skinHolder5!.alpha = 0.5
                
                skinHolder6 = SKSpriteNode(imageNamed: "skinsHolder")
                skinHolder6!.position = CGPoint(x: 400, y: -150)
                skinHolder6!.zPosition = 4
                skinHolder6!.size = Size!
                skinHolder6!.alpha = 0.5
                
                skinShown = SKSpriteNode(imageNamed: skinsScene.currentSkin!)
                skinShown!.position = skinShower!.position
                skinShown!.zPosition = 6
                skinShown!.size = CGSize(width: 100, height: 180)
                skinShown!.alpha = 1
                
                whiteplayer = SKSpriteNode(imageNamed: "Player")
                whiteplayer!.position = skinHolder1!.position
                whiteplayer!.zPosition = 5
                whiteplayer!.size = CGSize(width: 50, height: 90)
                whiteplayer!.alpha = 1
                
                redplayer = SKSpriteNode(imageNamed: "RedPlayer")
                redplayer!.position = skinHolder2!.position
                redplayer!.zPosition = 5
                redplayer!.size = CGSize(width: 50, height: 90)
                redplayer!.alpha = 1
                
                orangeplayer = SKSpriteNode(imageNamed: "OrangePlayer")
                orangeplayer!.position = skinHolder3!.position
                orangeplayer!.zPosition = 5
                orangeplayer!.size = CGSize(width: 50, height: 90)
                orangeplayer!.alpha = 1
                
                yellowplayer = SKSpriteNode(imageNamed: "YellowPlayer")
                yellowplayer!.position = skinHolder4!.position
                yellowplayer!.zPosition = 5
                yellowplayer!.size = CGSize(width: 50, height: 90)
                yellowplayer!.alpha = 1
                
                greenplayer = SKSpriteNode(imageNamed: "GreenPlayer")
                greenplayer!.position = skinHolder5!.position
                greenplayer!.zPosition = 5
                greenplayer!.size = CGSize(width: 50, height: 90)
                greenplayer!.alpha = 1
                
                blueplayer = SKSpriteNode(imageNamed: "BluePlayer")
                blueplayer!.position = skinHolder6!.position
                blueplayer!.zPosition = 5
                blueplayer!.size = CGSize(width: 50, height: 90)
                blueplayer!.alpha = 1
                
                purpleplayer = SKSpriteNode(imageNamed: "PurplePlayer")
                //purpleplayer!.position = skinHolder7!.position
                purpleplayer!.zPosition = 5
                purpleplayer!.size = CGSize(width: 50, height: 90)
                purpleplayer!.alpha = 1
                
                skinHolderShade1 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderShade1!.position = CGPoint(x: skinHolder1!.position.x, y: skinHolder1!.position.y - 8)
                skinHolderShade1!.zPosition = 3
                skinHolderShade1!.size = Size!
                skinHolderShade1!.alpha = 0.1
                
                skinHolderShade2 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderShade2!.position = CGPoint(x: skinHolder2!.position.x, y: skinHolder2!.position.y - 8)
                skinHolderShade2!.zPosition = 3
                skinHolderShade2!.size = Size!
                skinHolderShade2!.alpha = 0.1
                
                skinHolderShade3 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderShade3!.position = CGPoint(x: skinHolder3!.position.x, y: skinHolder3!.position.y - 8)
                skinHolderShade3!.zPosition = 3
                skinHolderShade3!.size = Size!
                skinHolderShade3!.alpha = 0.1
                
                skinHolderShade4 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderShade4!.position = CGPoint(x: skinHolder4!.position.x, y: skinHolder4!.position.y - 8)
                skinHolderShade4!.zPosition = 3
                skinHolderShade4!.size = Size!
                skinHolderShade4!.alpha = 0.1
                
                skinHolderShade5 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderShade5!.position = CGPoint(x: skinHolder5!.position.x, y: skinHolder5!.position.y - 8)
                skinHolderShade5!.zPosition = 3
                skinHolderShade5!.size = Size!
                skinHolderShade5!.alpha = 0.1
                
                skinHolderShade6 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderShade6!.position = CGPoint(x: skinHolder6!.position.x, y: skinHolder6!.position.y - 8)
                skinHolderShade6!.zPosition = 3
                skinHolderShade6!.size = Size!
                skinHolderShade6!.alpha = 0.1
                
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
                
                skinHolderLockShade3 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderLockShade3!.position = CGPoint(x: skinHolder3!.position.x, y: skinHolder3!.position.y)
                skinHolderLockShade3!.zPosition = 6
                skinHolderLockShade3!.size = Size!
                skinHolderLockShade3!.alpha = 0.7
                
                skinHolderLock3 = SKSpriteNode(imageNamed: "Lock")
                skinHolderLock3!.position = CGPoint(x: skinHolder3!.position.x, y: skinHolder3!.position.y)
                skinHolderLock3!.zPosition = 7
                skinHolderLock3!.size = CGSize(width: 92, height: 92)
                skinHolderLock3!.alpha = 1
                
                skinHolderLockShade4 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderLockShade4!.position = CGPoint(x: skinHolder4!.position.x, y: skinHolder4!.position.y)
                skinHolderLockShade4!.zPosition = 6
                skinHolderLockShade4!.size = Size!
                skinHolderLockShade4!.alpha = 0.7
                
                skinHolderLock4 = SKSpriteNode(imageNamed: "Lock")
                skinHolderLock4!.position = CGPoint(x: skinHolder4!.position.x, y: skinHolder4!.position.y)
                skinHolderLock4!.zPosition = 7
                skinHolderLock4!.size = CGSize(width: 92, height: 92)
                skinHolderLock4!.alpha = 1
                
                skinHolderLockShade5 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderLockShade5!.position = CGPoint(x: skinHolder5!.position.x, y: skinHolder5!.position.y)
                skinHolderLockShade5!.zPosition = 6
                skinHolderLockShade5!.size = Size!
                skinHolderLockShade5!.alpha = 0.7
                
                skinHolderLock5 = SKSpriteNode(imageNamed: "Lock")
                skinHolderLock5!.position = CGPoint(x: skinHolder5!.position.x, y: skinHolder5!.position.y)
                skinHolderLock5!.zPosition = 7
                skinHolderLock5!.size = CGSize(width: 92, height: 92)
                skinHolderLock5!.alpha = 1
                
                skinHolderLockShade6 = SKSpriteNode(imageNamed: "skinsHolderShade")
                skinHolderLockShade6!.position = CGPoint(x: skinHolder6!.position.x, y: skinHolder6!.position.y)
                skinHolderLockShade6!.zPosition = 6
                skinHolderLockShade6!.size = Size!
                skinHolderLockShade6!.alpha = 0.7
                
                skinHolderLock6 = SKSpriteNode(imageNamed: "Lock")
                skinHolderLock6!.position = CGPoint(x: skinHolder6!.position.x, y: skinHolder6!.position.y)
                skinHolderLock6!.zPosition = 7
                skinHolderLock6!.size = CGSize(width: 92, height: 92)
                skinHolderLock6!.alpha = 1
                
                
                
                
                
                HomeScene.level1HaveStar1 = level1.haveStar12
                HomeScene.level1HaveStar2 = level1.haveStar22
                HomeScene.level1HaveStar3 = level1.haveStar32
                
                HomeScene.level2HaveStar1 = level2.haveStar12
                HomeScene.level2HaveStar2 = level2.haveStar22
                HomeScene.level2HaveStar3 = level2.haveStar32
                
                HomeScene.level3HaveStar1 = level3.haveStar12
                HomeScene.level3HaveStar2 = level3.haveStar22
                HomeScene.level3HaveStar3 = level3.haveStar32
                
                
                if HomeScene.level1HaveStar1 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level1HaveStar2 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level1HaveStar3 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                
                if HomeScene.level2HaveStar1 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level2HaveStar2 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level2HaveStar3 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                
                if HomeScene.level3HaveStar1 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level3HaveStar2 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level3HaveStar3 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                
                if HomeScene.level4HaveStar1 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level4HaveStar2 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level4HaveStar3 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                
                if HomeScene.level5HaveStar1 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level5HaveStar2 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level5HaveStar3 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                
                if HomeScene.level6HaveStar1 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level6HaveStar2 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                if HomeScene.level6HaveStar3 == true{
                    
                    HomeScene.totalStars = HomeScene.totalStars + 1
                    HomeScene.world1Stars = HomeScene.world1Stars + 1
                    
                }
                
                if HomeScene.totalStars == 3 || HomeScene.totalStars >= 3{
                    
                    threeunlocked = true
                    
                }
                if HomeScene.totalStars == 6 || HomeScene.totalStars >= 6{
                    
                    fourunlocked = true
                    
                }
                if HomeScene.totalStars == 9 || HomeScene.totalStars >= 9{
                    
                    fiveunlocked = true
                    
                }
                if HomeScene.totalStars == 12 || HomeScene.totalStars >= 12{
                    
                    sixunlocked = true
                    
                }
                
                
                
                if threeunlocked == true{
                    
                    skinHolderLockShade3!.position = CGPoint(x: 1000, y: 0)
                    skinHolderLock3!.position = CGPoint(x: 1000, y: 0)
                    
                }
                
                if threeunlocked == false{
                    
                    skinHolderLockShade3!.position = skinHolder3!.position
                    skinHolderLock3!.position = skinHolder3!.position
                    
                }
                
                if fourunlocked == true{
                    
                    skinHolderLockShade4!.position = CGPoint(x: 1000, y: 0)
                    skinHolderLock4!.position = CGPoint(x: 1000, y: 0)
                    
                }
                
                if fourunlocked == false{
                    
                    skinHolderLockShade4!.position = skinHolder4!.position
                    skinHolderLock4!.position = skinHolder4!.position
                    
                }
                
                if fiveunlocked == true{
                    
                    skinHolderLockShade5!.position = CGPoint(x: 1000, y: 0)
                    skinHolderLock5!.position = CGPoint(x: 1000, y: 0)
                    
                }
                
                if fiveunlocked == false{
                    
                    skinHolderLockShade5!.position = skinHolder5!.position
                    skinHolderLock5!.position = skinHolder5!.position
                    
                }
                
                if sixunlocked == true{
                    
                    skinHolderLockShade6!.position = CGPoint(x: 1000, y: 0)
                    skinHolderLock6!.position = CGPoint(x: 1000, y: 0)
                    
                }
                
                if sixunlocked == false{
                    
                    skinHolderLockShade6!.position = skinHolder6!.position
                    skinHolderLock6!.position = skinHolder6!.position
                    
                }
                
                
                
                starCountLabel!.text = "\(HomeScene.totalStars)"
                
                if  mainMenuScene.iPhone11 == true ||  mainMenuScene.iPhone11Pro == true ||  mainMenuScene.iPhone11ProMax == true || mainMenuScene.iPhone12 == true ||  mainMenuScene.iPhone12Pro == true ||  mainMenuScene.iPhone12ProMax == true {
                
                    starCountBackShade!.position.x = starCountBack!.position.x
                    starCountBackShade!.position.y = starCountBack!.position.y - 8
                    
                    starCountBackStar!.position.x = starCountBack!.position.x - 41
                    starCountLabel!.position.x = starCountBack!.position.x + 31
                    
                    starCountBackStar!.position.y = starCountBack!.position.y
                    starCountLabel!.position.y = starCountBack!.position.y

                    
                    backButton!.position = CGPoint(x: -570, y: 225)
                        
                    back!.position = backButton!.position
                    backButtonShade!.position.x = backButton!.position.x
                    backButtonShade!.position.y = backButton!.position.y - 8
                    
                    leftArrow = SKSpriteNode(imageNamed: "leftArrow")
                    leftArrow!.zPosition = 5
                    leftArrow!.size = CGSize(width: 60, height: 80)
                    leftArrow!.alpha = 0.5
                    
                    rightArrow = SKSpriteNode(imageNamed: "rightArrow")
                    rightArrow!.zPosition = 5
                    rightArrow!.size = CGSize(width: 60, height: 80)
                    rightArrow!.alpha = 0.5
                    
                    rightArrow!.position = CGPoint(x: 540, y: -150)
                    leftArrow!.position = CGPoint(x: -540, y: -150)
                    
                    leftArrowShade = SKSpriteNode(imageNamed: "leftArrowShade")
                    leftArrowShade!.position = CGPoint(x: leftArrow!.position.x, y: leftArrow!.position.y - 8)
                    leftArrowShade!.zPosition = 4
                    leftArrowShade!.size = leftArrow!.size
                    leftArrowShade!.alpha = 0.1
                    
                    rightArrowShade = SKSpriteNode(imageNamed: "rightArrowShade")
                    rightArrowShade!.position = CGPoint(x: rightArrow!.position.x, y: rightArrow!.position.y - 8)
                    rightArrowShade!.zPosition = 4
                    rightArrowShade!.size = rightArrow!.size
                    rightArrowShade!.alpha = 0.1
                    
                    
                }
                
                if  mainMenuScene.iPhoneSE == true ||  mainMenuScene.iPhone8 == true ||  mainMenuScene.iPhone8Plus == true{
                
                    starCountBack!.position = CGPoint(x: 422,y: 248)
                    starCountBackShade!.position.x = starCountBack!.position.x
                    starCountBackShade!.position.y = starCountBack!.position.y - 8
                    
                    starCountBackStar!.position.x = starCountBack!.position.x - 41
                    starCountLabel!.position.x = starCountBack!.position.x + 31
                    
                    starCountBackStar!.position.y = starCountBack!.position.y
                    starCountLabel!.position.y = starCountBack!.position.y
                    
                    
                    
                    leftArrow = SKSpriteNode(imageNamed: "leftArrow")
                    leftArrow!.zPosition = 5
                    leftArrow!.position = CGPoint(x: -500, y: -150)
                    leftArrow!.size = CGSize(width: 40, height: 60)
                    leftArrow!.alpha = 0.5
                    
                    rightArrow = SKSpriteNode(imageNamed: "rightArrow")
                    rightArrow!.zPosition = 5
                    rightArrow!.position = CGPoint(x: 500, y: -150)
                    rightArrow!.size = CGSize(width: 40, height: 60)
                    rightArrow!.alpha = 0.5
                    
                    leftArrowShade = SKSpriteNode(imageNamed: "leftArrowShade")
                    leftArrowShade!.position = CGPoint(x: leftArrow!.position.x, y: leftArrow!.position.y - 8)
                    leftArrowShade!.zPosition = 4
                    leftArrowShade!.size = leftArrow!.size
                    leftArrowShade!.alpha = 0.1
                    
                    rightArrowShade = SKSpriteNode(imageNamed: "rightArrowShade")
                    rightArrowShade!.position = CGPoint(x: rightArrow!.position.x, y: rightArrow!.position.y - 8)
                    rightArrowShade!.zPosition = 4
                    rightArrowShade!.size = rightArrow!.size
                    rightArrowShade!.alpha = 0.1
                }
                
                
                
                if skinsScene.currentSkin == String("Player"){
                    
                    self.skinHolder1?.texture = SKTexture(imageNamed: "skinsHolderShade")
                    skinShown!.texture = SKTexture(imageNamed: "Player")
                    
                }
                
                if skinsScene.currentSkin == String("RedPlayer"){
                    
                    self.skinHolder2?.texture = SKTexture(imageNamed: "skinsHolderShade")
                    skinShown!.texture = SKTexture(imageNamed: "RedPlayer")
                    
                }
                
                if skinsScene.currentSkin == String("OrangePlayer"){
                    
                    self.skinHolder3?.texture = SKTexture(imageNamed: "skinsHolderShade")
                    skinShown!.texture = SKTexture(imageNamed: "OrangePlayer")
                    
                }
                
                if skinsScene.currentSkin == String("YellowPlayer"){
                    
                    self.skinHolder4?.texture = SKTexture(imageNamed: "skinsHolderShade")
                    skinShown!.texture = SKTexture(imageNamed: "YellowPlayer")
                    
                }
                
                if skinsScene.currentSkin == String("GreenPlayer"){
                    
                    self.skinHolder5?.texture = SKTexture(imageNamed: "skinsHolderShade")
                    skinShown!.texture = SKTexture(imageNamed: "GreenPlayer")
                    
                }
                
                if skinsScene.currentSkin == String("BluePlayer"){
                    
                    self.skinHolder6?.texture = SKTexture(imageNamed: "skinsHolderShade")
                    skinShown!.texture = SKTexture(imageNamed: "BluePlayer")
                    
                }
                
                
                
                addChild(skinHolderLockShade3!)
                addChild(skinHolderLock3!)
                addChild(skinHolderLockShade4!)
                addChild(skinHolderLock4!)
                addChild(skinHolderLockShade5!)
                addChild(skinHolderLock5!)
                addChild(skinHolderLockShade6!)
                addChild(skinHolderLock6!)
                addChild(redplayer!)
                addChild(whiteplayer!)
                addChild(orangeplayer!)
                addChild(yellowplayer!)
                addChild(greenplayer!)
                addChild(blueplayer!)
                addChild(skinShown!)
                addChild(skinHolder1!)
                addChild(skinHolder2!)
                addChild(skinHolder3!)
                addChild(skinHolder4!)
                addChild(skinHolder5!)
                addChild(skinHolder6!)
                addChild(skinHolderShade1!)
                addChild(skinHolderShade2!)
                addChild(skinHolderShade3!)
                addChild(skinHolderShade4!)
                addChild(skinHolderShade5!)
                addChild(skinHolderShade6!)
                addChild(skinShower!)
                addChild(skinShowerShade!)
                //addChild(leftArrow!)
                //addChild(rightArrow!)
                //addChild(leftArrowShade!)
                //addChild(rightArrowShade!)
                addChild(starCountBackShade!)
                addChild(starCountBack!)
                addChild(starCountBackStar!)
                addChild(starCountLabel!)
                
                
                
                
          
                
                
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
                        
                            if skinHolder1!.contains(location!){
                                
                                clicknoise()
                                
                                let Shrink1 = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
                                let Shrink2 = SKAction.resize(toWidth: 45, height: 81, duration: 0.1)
                                let code = SKAction.run {
                                    self.skinHolder1?.texture = SKTexture(imageNamed: "skinsHolderShade")
                                    self.skinHolder2?.texture = SKTexture(imageNamed: "skinsHolder")
                                    self.skinHolder3?.texture = SKTexture(imageNamed: "skinsHolder")
                                    self.skinHolder4?.texture = SKTexture(imageNamed: "skinsHolder")
                                    self.skinHolder5?.texture = SKTexture(imageNamed: "skinsHolder")
                                    self.skinHolder6?.texture = SKTexture(imageNamed: "skinsHolder")
                                    self.skinShown!.texture = SKTexture(imageNamed: "Player")
                                    
                                }
                                
                                let sequence = SKAction.sequence([Shrink2, code])
                                
                                whiteplayer!.run(sequence)
                                skinHolder1!.run(Shrink1)
                                skinHolderShade1!.run(Shrink1)
                               
                                
                                skinsScene.currentSkin = String("Player")
                                
                                skinHolder1pressed = true
                            
                            }
                        
                        if skinHolder2!.contains(location!){
                            
                            clicknoise()
                            
                            let Shrink1 = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 45, height: 81, duration: 0.1)
                            let code = SKAction.run {
                                
                                self.skinHolder1?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder2?.texture = SKTexture(imageNamed: "skinsHolderShade")
                                self.skinHolder3?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder4?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder5?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder6?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinShown!.texture = SKTexture(imageNamed: "RedPlayer")
                                
                            }
                            
                            
                            let sequence = SKAction.sequence([Shrink2, code])
                            
                            redplayer!.run(sequence)
                            skinHolder2!.run(Shrink1)
                            skinHolderShade2!.run(Shrink1)
                           
                            
                            skinsScene.currentSkin = String("RedPlayer")
                            
                            skinHolder2pressed = true
                        
                        }
                        
                        
                        if skinHolder3!.contains(location!) && (HomeScene.totalStars >= 3 || HomeScene.totalStars == 3){
                            
                            clicknoise()
                            
                            let Shrink1 = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 45, height: 81, duration: 0.1)
                            let code = SKAction.run {
                                
                                self.skinHolder1?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder2?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder3?.texture = SKTexture(imageNamed: "skinsHolderShade")
                                self.skinHolder4?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder5?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder6?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinShown!.texture = SKTexture(imageNamed: "OrangePlayer")
                                
                            }
                            
                            
                            let sequence = SKAction.sequence([Shrink2, code])
                            
                            orangeplayer!.run(sequence)
                            skinHolder3!.run(Shrink1)
                            skinHolderShade3!.run(Shrink1)
                           
                            
                            skinsScene.currentSkin = String("OrangePlayer")
                            
                            skinHolder3pressed = true
                        
                        }
                        
                        if skinHolder4!.contains(location!) && (HomeScene.totalStars >= 6 || HomeScene.totalStars == 6){
                            
                            clicknoise()
                            
                            let Shrink1 = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 45, height: 81, duration: 0.1)
                            let code = SKAction.run {
                                
                                self.skinHolder1?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder2?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder3?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder4?.texture = SKTexture(imageNamed: "skinsHolderShade")
                                self.skinHolder5?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder6?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinShown!.texture = SKTexture(imageNamed: "YellowPlayer")
                                
                            }
                            
                            
                            let sequence = SKAction.sequence([Shrink2, code])
                            
                            yellowplayer!.run(sequence)
                            skinHolder4!.run(Shrink1)
                            skinHolderShade4!.run(Shrink1)
                           
                            
                            skinsScene.currentSkin = String("YellowPlayer")
                            
                            skinHolder4pressed = true
                        
                        }
                        
                        if skinHolder5!.contains(location!) && (HomeScene.totalStars >= 9 || HomeScene.totalStars == 9){
                            
                            clicknoise()
                            
                            let Shrink1 = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 45, height: 81, duration: 0.1)
                            let code = SKAction.run {
                                
                                self.skinHolder1?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder2?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder3?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder4?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder5?.texture = SKTexture(imageNamed: "skinsHolderShade")
                                self.skinHolder6?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinShown!.texture = SKTexture(imageNamed: "GreenPlayer")
                                
                            }
                            
                            
                            let sequence = SKAction.sequence([Shrink2, code])
                            
                            greenplayer!.run(sequence)
                            skinHolder5!.run(Shrink1)
                            skinHolderShade5!.run(Shrink1)
                           
                            
                            skinsScene.currentSkin = String("GreenPlayer")
                            
                            skinHolder5pressed = true
                        
                        }
                        
                        if skinHolder6!.contains(location!) && (HomeScene.totalStars >= 12 || HomeScene.totalStars == 12){
                            
                            clicknoise()
                            
                            let Shrink1 = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 45, height: 81, duration: 0.1)
                            let code = SKAction.run {
                                
                                self.skinHolder1?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder2?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder3?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder4?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder5?.texture = SKTexture(imageNamed: "skinsHolder")
                                self.skinHolder6?.texture = SKTexture(imageNamed: "skinsHolderShade")
                                self.skinShown!.texture = SKTexture(imageNamed: "BluePlayer")
                                
                            }
                            
                            
                            let sequence = SKAction.sequence([Shrink2, code])
                            
                            blueplayer!.run(sequence)
                            skinHolder6!.run(Shrink1)
                            skinHolderShade6!.run(Shrink1)
                           
                            
                            skinsScene.currentSkin = String("BluePlayer")
                            
                            skinHolder6pressed = true
                        
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
                    
                        if skinHolder1pressed == true{
                            
                            let Shrink1 = SKAction.resize(toWidth: 140, height: 140, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 50, height: 90, duration: 0.1)
                            
                            whiteplayer!.run(Shrink2)
                            skinHolder1!.run(Shrink1)
                            skinHolderShade1!.run(Shrink1)
                            
                            skinHolder1pressed = false
                        }
                        
                        if skinHolder2pressed == true{
                            
                            let Shrink1 = SKAction.resize(toWidth: 140, height: 140, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 50, height: 90, duration: 0.1)
                            
                            redplayer!.run(Shrink2)
                            skinHolder2!.run(Shrink1)
                            skinHolderShade2!.run(Shrink1)
                            
                            skinHolder2pressed = false
                        }
                        
                        if skinHolder3pressed == true{
                            
                            let Shrink1 = SKAction.resize(toWidth: 140, height: 140, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 50, height: 90, duration: 0.1)
                            
                            orangeplayer!.run(Shrink2)
                            skinHolder3!.run(Shrink1)
                            skinHolderShade3!.run(Shrink1)
                            
                            skinHolder3pressed = false
                        }
                        
                        if skinHolder4pressed == true{
                            
                            let Shrink1 = SKAction.resize(toWidth: 140, height: 140, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 50, height: 90, duration: 0.1)
                            
                            yellowplayer!.run(Shrink2)
                            skinHolder4!.run(Shrink1)
                            skinHolderShade4!.run(Shrink1)
                            
                            skinHolder4pressed = false
                        }
                        
                        if skinHolder5pressed == true{
                            
                            let Shrink1 = SKAction.resize(toWidth: 140, height: 140, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 50, height: 90, duration: 0.1)
                            
                            greenplayer!.run(Shrink2)
                            skinHolder5!.run(Shrink1)
                            skinHolderShade5!.run(Shrink1)
                            
                            skinHolder5pressed = false
                        }
                        
                        if skinHolder6pressed == true{
                            
                            let Shrink1 = SKAction.resize(toWidth: 140, height: 140, duration: 0.1)
                            let Shrink2 = SKAction.resize(toWidth: 50, height: 90, duration: 0.1)
                            
                            blueplayer!.run(Shrink2)
                            skinHolder6!.run(Shrink1)
                            skinHolderShade6!.run(Shrink1)
                            
                            skinHolder6pressed = false
                        }
                        
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
                        
                        
                        
                    }
                        
                        
                        
                        }
                    
                    
                    
                
            
            func positions(){
                
                
                
                
                
                
                
                
                
            }
            
            override func didSimulatePhysics() {
                
                positions()
                
            }
            
                override func update(_ currentTime: TimeInterval) {
                    // Called before each frame is rendered
                
                    if threeunlocked == true{
                        
                        skinHolderLockShade3!.position = CGPoint(x: 1000, y: 0)
                        skinHolderLock3!.position = CGPoint(x: 1000, y: 0)
                        
                    }
                    
                    if threeunlocked == false{
                        
                        skinHolderLockShade3!.position = skinHolder3!.position
                        skinHolderLock3!.position = skinHolder3!.position
                        
                    }
                    
                    if fourunlocked == true{
                        
                        skinHolderLockShade4!.position = CGPoint(x: 1000, y: 0)
                        skinHolderLock4!.position = CGPoint(x: 1000, y: 0)
                        
                    }
                    
                    if fourunlocked == false{
                        
                        skinHolderLockShade4!.position = skinHolder4!.position
                        skinHolderLock4!.position = skinHolder4!.position
                        
                    }
                    
                    if fiveunlocked == true{
                        
                        skinHolderLockShade5!.position = CGPoint(x: 1000, y: 0)
                        skinHolderLock5!.position = CGPoint(x: 1000, y: 0)
                        
                    }
                    
                    if fiveunlocked == false{
                        
                        skinHolderLockShade5!.position = skinHolder5!.position
                        skinHolderLock5!.position = skinHolder5!.position
                        
                    }
                    
                    if sixunlocked == true{
                        
                        skinHolderLockShade6!.position = CGPoint(x: 1000, y: 0)
                        skinHolderLock6!.position = CGPoint(x: 1000, y: 0)
                        
                    }
                    
                    if sixunlocked == false{
                        
                        skinHolderLockShade6!.position = skinHolder6!.position
                        skinHolderLock6!.position = skinHolder6!.position
                        
                    }
                    
                    starCountLabel!.text = "\(HomeScene.totalStars)"
                    
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
