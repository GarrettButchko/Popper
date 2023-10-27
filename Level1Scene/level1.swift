//
//  GameScene.swift
//  Popper
//
//  Created by Garrett Butchko on 7/6/20.
//  Copyright © 2020 Garrett Butchko. All rights reserved.
//

import SpriteKit
import GameplayKit
import DeviceCheck


struct ColliderType {
    
    static let player: UInt32 = 1
    static let ground: UInt32 = 2
}


class level1: SKScene, SKPhysicsContactDelegate {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    
    
    var prevScoreCalcTime:TimeInterval = 0
    var prevScoreCalcTime2:TimeInterval = 0
    
    var location: CGPoint?
    
    let cameraNode = SKCameraNode()
    
    weak var player : SKSpriteNode?
    weak var playerShadow : SKSpriteNode?
    weak var ramp : SKSpriteNode?
    weak var rampShadow : SKSpriteNode?
    weak var wall : SKSpriteNode?
    weak var wallShadow : SKSpriteNode?
    weak var floor : SKSpriteNode?
    weak var floorShadow : SKSpriteNode?
    weak var topBar : SKSpriteNode?
    weak var ground : SKSpriteNode?
    weak var leftTouch : SKSpriteNode?
    weak var rightTouch : SKSpriteNode?
    weak var oneGrid : SKSpriteNode?
    weak var oneRampGrid : SKSpriteNode?
    weak var oneTopFloorGrid : SKSpriteNode?
    weak var oneBottomFloorGrid : SKSpriteNode?
    weak var oneLeftWallGrid : SKSpriteNode?
    weak var oneRightWallGrid : SKSpriteNode?
    weak var finishLine : SKSpriteNode?
    weak var finishLineSection : SKSpriteNode?
    weak var darkBackGround : SKSpriteNode?
    weak var darkBackGround2 : SKSpriteNode?
    weak var lightBack : SKSpriteNode?
    weak var lightBack2 : SKSpriteNode?
    weak var Star1 : SKSpriteNode?
    weak var Star2 : SKSpriteNode?
    weak var Star3 : SKSpriteNode?
    
    weak var Star12 : SKSpriteNode?
    weak var Star22 : SKSpriteNode?
    weak var Star32 : SKSpriteNode?
    weak var StarShade12 : SKSpriteNode?
    weak var StarShade22 : SKSpriteNode?
    weak var StarShade32 : SKSpriteNode?
    
    weak var StarSpot12 : SKSpriteNode?
    weak var StarSpot22 : SKSpriteNode?
    weak var StarSpot32 : SKSpriteNode?
    
    weak var StarSpot1 : SKSpriteNode?
    weak var StarSpot2 : SKSpriteNode?
    weak var StarSpot3 : SKSpriteNode?
    weak var StarShade1 : SKSpriteNode?
    weak var StarShade2 : SKSpriteNode?
    weak var StarShade3 : SKSpriteNode?

    weak var reset : SKSpriteNode?
    weak var resetButton : SKSpriteNode?
    weak var resetButtonShade : SKSpriteNode?
    weak var pausedB : SKSpriteNode?
    weak var pausedButton : SKSpriteNode?
    weak var pausedButtonShade : SKSpriteNode?
    weak var upDown : SKSpriteNode?
    weak var UpDownButton : SKSpriteNode?
    weak var UpDownButtonShade : SKSpriteNode?
    
    weak var topPausedBar : SKSpriteNode?
    weak var topPausedBarShade : SKSpriteNode?
    
    weak var reset3 : SKSpriteNode?
    weak var resetButton3 : SKSpriteNode?
    weak var resetButtonShade3 : SKSpriteNode?
    
    weak var home2 : SKSpriteNode?
    weak var homeButton2 : SKSpriteNode?
    weak var homeButtonShade2 : SKSpriteNode?
    
    weak var mainMenu2 : SKSpriteNode?
    weak var mainMenuButton2 : SKSpriteNode?
    weak var mainMenuButtonShade2 : SKSpriteNode?
    
    weak var resume : SKSpriteNode?
    weak var resumeButton : SKSpriteNode?
    weak var resumeButtonShade : SKSpriteNode?
    
    weak var reset2 : SKSpriteNode?
    weak var resetButton2 : SKSpriteNode?
    weak var resetButtonShade2 : SKSpriteNode?
    
    weak var home : SKSpriteNode?
    weak var homeButton : SKSpriteNode?
    weak var homeButtonShade : SKSpriteNode?
    
    weak var mainMenu : SKSpriteNode?
    weak var mainMenuButton : SKSpriteNode?
    weak var mainMenuButtonShade : SKSpriteNode?
    
    weak var nextLevel : SKSpriteNode?
    weak var nextLevelButton : SKSpriteNode?
    weak var nextLevelButtonShade : SKSpriteNode?
    
    weak var topBarShade : SKSpriteNode?
    
    var Level1Sign : SKLabelNode?
    weak var gamePausedLabel : SKLabelNode?
    
    var name1 : SKEmitterNode?
    var name2 : SKEmitterNode?
    var name3 : SKEmitterNode?
    
    var endexplosion : SKEmitterNode?
    
    var allowTouch = true
    
    var haveStar1 : Bool?
    var haveStar2 : Bool?
    var haveStar3 : Bool?
    
    static var haveStar12 : Bool?
    static var haveStar22 : Bool?
    static var haveStar32 : Bool?
    
    var topBarStayDown = 1
    var buttonsDown = true
    
    var resetpressed2 = false
    var resetpressed1 = false
    var homepressed = false
    var mainMenupressed = false
    var nextLevelpressed = false
    var pausedpressed = false
    var upDownPressed = false
    var pausedpressed2 = false
    
    var resetpressed3 = false
    var homepressed2 = false
    var mainMenupressed2 = false
    var resumepressed = false
    
    var onGround = true
    var onGround2 = true
    var touchingRight = false
    var touchingLeft = false
    var touchingWall = false
    var touchingRamp = false
    var touchingFloor = false
    
    var allowResetGrow = true
    var allowHomeGrow = true
    var allowMainMenuGrow = true
    var allowNextLevelGrow = true
    
    var allowStarSpot2 = true
    var allowLightBack = true
    var lightBackDown = false
    var lightBackDown2 = false
    
    var rampInOneRampGrid = false
    var rampInOneRampGrid2 = false
    
    var wallInOneLeftWallGrid = false
    var wallInOneLeftWallGrid2 = false
    var wallInOneRightWallGrid = false
    var wallInOneRightWallGrid2 = false
    
    var floorInOneTopFloorGrid = false
    var floorInOneTopfloorGrid2 = false
    var floorInOneBottomFloorGrid = false
    var floorInOneBottomfloorGrid2 = false
    
    var rampeffectsAllowed = true
    var walleffectsAllowed = true
    var flooreffectsAllowed = true
    
    var topBarDown = false
    
    var oneGridInLeft = false
    var oneGridInRight = false
    
    var passedFinishLine = false
    var passedFinishLine2 = false
    
    var allowStarSpawn1 = false
    var allowStarSpawn2 = false
    var allowStarSpawn3 = false
    
    var allowStarparticles1 = true
    var allowStarparticles2 = true
    var allowStarparticles3 = true
    
    var iPad7thGen = false
    var iPadAir3rdGen = false
    var iPadPro9Point7In = false
    var iPadPro11In = false
    var iPadPro12Point9In = false
    
    
    override func sceneDidLoad() {

        if mainMenuScene.volume == true{
        let backgroundSound = SKAudioNode(fileNamed: "AUDIO_5592.m4a")
         addChild(backgroundSound)
        }
        
        
        
        addChild(cameraNode)
        camera = cameraNode
        
        
        
        self.lastUpdateTime = 0
        
        self.physicsWorld.contactDelegate = self
        
        
        if skinsScene.currentSkin == nil{
            
            skinsScene.currentSkin = String("Player")
            
        }
        
       
        
        
        if HomeScene.level1HaveStar1 != nil{
        haveStar1 = HomeScene.level1HaveStar1
        }
        if HomeScene.level1HaveStar2 != nil{
        haveStar2 = HomeScene.level1HaveStar2
        }
        if HomeScene.level1HaveStar3 != nil{
        haveStar3 = HomeScene.level1HaveStar3
        }
        
        
        
        
        self.playerShadow = self.childNode(withName: "playerShadow") as? SKSpriteNode
        self.player = self.childNode(withName: "player") as? SKSpriteNode
        self.ramp = self.childNode(withName: "ramp") as? SKSpriteNode
        self.rampShadow = self.childNode(withName: "rampShadow") as? SKSpriteNode
        self.wall = self.childNode(withName: "wall") as? SKSpriteNode
        self.wallShadow = self.childNode(withName: "wallShadow") as? SKSpriteNode
        self.floor = self.childNode(withName: "floor") as? SKSpriteNode
        self.floorShadow = self.childNode(withName: "floorShadow") as? SKSpriteNode
        self.topBar = self.childNode(withName: "topBar") as? SKSpriteNode
        self.ground = self.childNode(withName: "ground") as? SKSpriteNode
        self.leftTouch = self.childNode(withName: "leftTouch") as? SKSpriteNode
        self.rightTouch = self.childNode(withName: "rightTouch") as? SKSpriteNode
        self.finishLine = self.childNode(withName: "finishLine") as? SKSpriteNode
        self.finishLineSection = self.childNode(withName: "finishLineSection") as? SKSpriteNode
        self.darkBackGround = self.childNode(withName: "darkBackGround") as? SKSpriteNode
        self.darkBackGround2 = self.childNode(withName: "darkBackGround2") as? SKSpriteNode
        self.lightBack = self.childNode(withName: "lightBack") as? SKSpriteNode
        self.lightBack2 = self.childNode(withName: "lightBack2") as? SKSpriteNode
        self.Star1 = self.childNode(withName: "Star1") as? SKSpriteNode
        self.Star2 = self.childNode(withName: "Star2") as? SKSpriteNode
        self.Star3 = self.childNode(withName: "Star3") as? SKSpriteNode
        self.Star12 = self.childNode(withName: "Star21") as? SKSpriteNode
        self.Star22 = self.childNode(withName: "Star22") as? SKSpriteNode
        self.Star32 = self.childNode(withName: "Star23") as? SKSpriteNode
        self.StarShade12 = self.childNode(withName: "Star21Shade") as? SKSpriteNode
        self.StarShade22 = self.childNode(withName: "Star22Shade") as? SKSpriteNode
        self.StarShade32 = self.childNode(withName: "Star23Shade") as? SKSpriteNode
        self.StarSpot1 = self.childNode(withName: "StarSpot1") as? SKSpriteNode
        self.StarSpot2 = self.childNode(withName: "StarSpot2") as? SKSpriteNode
        self.StarSpot3 = self.childNode(withName: "StarSpot3") as? SKSpriteNode
        self.StarSpot12 = self.childNode(withName: "StarSpot12") as? SKSpriteNode
        self.StarSpot22 = self.childNode(withName: "StarSpot22") as? SKSpriteNode
        self.StarSpot32 = self.childNode(withName: "StarSpot32") as? SKSpriteNode
        self.StarShade1 = self.childNode(withName: "StarShade1") as? SKSpriteNode
        self.StarShade2 = self.childNode(withName: "StarShade2") as? SKSpriteNode
        self.StarShade3 = self.childNode(withName: "StarShade3") as? SKSpriteNode
        
        self.Level1Sign = self.childNode(withName: "Level1Sign") as? SKLabelNode
        self.gamePausedLabel = self.childNode(withName: "gamePausedLabel") as? SKLabelNode
        
        self.reset = self.childNode(withName: "reset") as? SKSpriteNode
        self.resetButton = self.childNode(withName: "resetButton") as? SKSpriteNode
        self.resetButtonShade = self.childNode(withName: "resetButtonShade") as? SKSpriteNode
        
        self.reset3 = self.childNode(withName: "reset3") as? SKSpriteNode
        self.resetButton3 = self.childNode(withName: "resetButton3") as? SKSpriteNode
        self.resetButtonShade3 = self.childNode(withName: "resetButtonShade3") as? SKSpriteNode
        
        self.home2 = self.childNode(withName: "home2") as? SKSpriteNode
        self.homeButton2 = self.childNode(withName: "homeButton2") as? SKSpriteNode
        self.homeButtonShade2 = self.childNode(withName: "homeButtonShade2") as? SKSpriteNode
        
        self.mainMenu2 = self.childNode(withName: "mainMenu2") as? SKSpriteNode
        self.mainMenuButton2 = self.childNode(withName: "mainMenuButton2") as? SKSpriteNode
        self.mainMenuButtonShade2 = self.childNode(withName: "mainMenuButtonShade2") as? SKSpriteNode
        
        self.resume = self.childNode(withName: "resume") as? SKSpriteNode
        self.resumeButton = self.childNode(withName: "resumeButton") as? SKSpriteNode
        self.resumeButtonShade = self.childNode(withName: "resumeButtonShade") as? SKSpriteNode
        
        self.topPausedBar = self.childNode(withName: "topPausedBar") as? SKSpriteNode
        self.topPausedBarShade = self.childNode(withName: "topPausedBarShade") as? SKSpriteNode
        
        self.pausedB = self.childNode(withName: "pausedB") as? SKSpriteNode
        self.pausedButton = self.childNode(withName: "pausedButton") as? SKSpriteNode
        self.pausedButtonShade = self.childNode(withName: "pausedButtonShade") as? SKSpriteNode
        
        self.upDown = self.childNode(withName: "upDown") as? SKSpriteNode
        self.UpDownButton = self.childNode(withName: "UpDownButton") as? SKSpriteNode
        self.UpDownButtonShade = self.childNode(withName: "UpDownButtonShade") as? SKSpriteNode
        
        self.home = self.childNode(withName: "home") as? SKSpriteNode
        self.homeButton = self.childNode(withName: "homeButton") as? SKSpriteNode
        self.homeButtonShade = self.childNode(withName: "homeButtonShade") as? SKSpriteNode
        
        self.mainMenu = self.childNode(withName: "mainMenu") as? SKSpriteNode
        self.mainMenuButton = self.childNode(withName: "mainMenuButton") as? SKSpriteNode
        self.mainMenuButtonShade = self.childNode(withName: "mainMenuButtonShade") as? SKSpriteNode
        
        self.nextLevel = self.childNode(withName: "nextLevel") as? SKSpriteNode
        self.nextLevelButton = self.childNode(withName: "nextLevelButton") as? SKSpriteNode
        self.nextLevelButtonShade = self.childNode(withName: "nextLevelButtonShade") as? SKSpriteNode
        
        self.reset2 = self.childNode(withName: "reset2") as? SKSpriteNode
        self.resetButton2 = self.childNode(withName: "resetButton2") as? SKSpriteNode
        self.resetButtonShade2 = self.childNode(withName: "resetButtonShade2") as? SKSpriteNode
        self.topBarShade = self.childNode(withName: "topBarShade") as? SKSpriteNode
        
        self.oneGrid = self.childNode(withName: "oneGrid") as? SKSpriteNode
        self.oneRampGrid = self.childNode(withName: "oneRampGrid") as? SKSpriteNode
        self.oneTopFloorGrid = self.childNode(withName: "oneTopFloorGrid") as? SKSpriteNode
        self.oneBottomFloorGrid = self.childNode(withName: "oneBottomFloorGrid") as? SKSpriteNode
        self.oneLeftWallGrid = self.childNode(withName: "oneLeftWallGrid") as? SKSpriteNode
        self.oneRightWallGrid = self.childNode(withName: "oneRightWallGrid") as? SKSpriteNode
        
        player!.texture = SKTexture(imageNamed: skinsScene.currentSkin!)
        
        
        player!.physicsBody = SKPhysicsBody(rectangleOf: player!.size)
        player!.physicsBody?.isDynamic = true
        player!.physicsBody?.affectedByGravity = true
        player!.physicsBody?.friction = 1
        player!.physicsBody?.mass = 0.093
        player!.physicsBody?.allowsRotation = false
        player!.physicsBody?.restitution = 0
        
        confettiEmitter()
        
        player!.physicsBody?.categoryBitMask = ColliderType.player
        player!.physicsBody?.collisionBitMask = ColliderType.ground
        player!.physicsBody?.contactTestBitMask = ColliderType.ground
        
        ground!.physicsBody?.categoryBitMask = ColliderType.ground
        
        ramp!.physicsBody?.categoryBitMask = ColliderType.ground
        
        wall!.physicsBody?.categoryBitMask = ColliderType.ground
        
        cameraNode.position.x = player!.position.x + 200
        cameraNode.position.y = player!.position.y + 120
        let Wait3 = SKAction.wait(forDuration: 2)
        
        let fadein = SKAction.fadeIn(withDuration: 1)
       
        
        let Level1Signseq = SKAction.sequence([Wait3, fadein])
        
        Level1Sign!.run(Level1Signseq)
        
        
        
        
        
        reset2!.size.height = 1
        reset2!.size.width = 1
        resetButton2!.size.height = 1
        resetButton2!.size.width = 1
        resetButtonShade2!.size.height = 1
        resetButtonShade2!.size.width = 1
            
        home!.size.height = 1
        home!.size.width = 1
        homeButton!.size.height = 1
        homeButton!.size.width = 1
        homeButtonShade!.size.height = 1
        homeButtonShade!.size.width = 1
        
        mainMenu!.size.height = 1
        mainMenu!.size.width = 1
        mainMenuButton!.size.height = 1
        mainMenuButton!.size.width = 1
        mainMenuButtonShade!.size.height = 1
        mainMenuButtonShade!.size.width = 1
        
        nextLevel!.size.height = 1
        nextLevel!.size.width = 1
        nextLevelButton!.size.height = 1
        nextLevelButton!.size.width = 1
        nextLevelButtonShade!.size.height = 1
        nextLevelButtonShade!.size.width = 1
        
        
        Star12!.size.height = 500
        Star12!.size.width = 500
        Star22!.size.height = 500
        Star22!.size.width = 500
        Star32!.size.height = 500
        Star32!.size.width = 500
        
        
        
        
            name1 = SKEmitterNode(fileNamed: "starParticle.sks")
            name1!.position = CGPoint(x: position.x, y: position.y)
        if haveStar1 == false || haveStar1 == nil{
        addChild(name1!)
        }
        
            name2 = SKEmitterNode(fileNamed: "starParticle.sks")
            name2!.position = CGPoint(x: position.x, y: position.y)
        if haveStar2 == false || haveStar2 == nil{
        addChild(name2!)
        }
        
            name3 = SKEmitterNode(fileNamed: "starParticle.sks")
            name3!.position = CGPoint(x: position.x, y: position.y)
        if haveStar3 == false || haveStar3 == nil{
        addChild(name3!)
        }
            endexplosion = SKEmitterNode(fileNamed: "Confetti.sks")
            endexplosion!.position = CGPoint(x: finishLine!.position.x, y: finishLine!.position.y)
        addChild(endexplosion!)
        
        name1!.position = Star1!.position
        name2!.position = Star2!.position
        name3!.position = Star3!.position

        if HomeScene.level1HaveStar1 == true{
            
            Star1!.position = StarSpot1!.position
            Star1!.size = StarSpot1!.size
            StarShade1!.size = StarSpot3!.size
            
        }
        
        if HomeScene.level1HaveStar2 == true{
            
            Star2!.position = StarSpot2!.position
            Star2!.size = StarSpot2!.size
            StarShade2!.size = StarSpot3!.size
            
        }
        
        if HomeScene.level1HaveStar3 == true{
            
            Star3!.position = StarSpot3!.position
            Star3!.size = StarSpot3!.size
            StarShade3!.size = StarSpot3!.size
            
        }
        
        topBarDown = true
            
    }
    
    
    
    
    //MARK: Physics Contact
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        var firstBody = SKPhysicsBody()
        var secondBody = SKPhysicsBody()
        
        if contact.bodyA.node?.name == "player" {
            
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            
            
        } else {
            
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "ground" {
            
            onGround = true
            onGround2 = true
            
            if finishLine!.contains(player!.position){
                
                player!.physicsBody?.applyImpulse(CGVector(dx: 25, dy: 25))
                onGround = false
            }
            
            if passedFinishLine == true {
                
                
                let turn = SKAction.rotate(byAngle: 3.142, duration: 0.3)
                
                upDown?.run(turn)
                
                let setButtonsDown = SKAction.run {
                    self.buttonsDown = false
                }
                let buttonsmove = SKAction.moveTo(y: cameraNode.position.y + 520, duration: 0.1)
                
                let sequence1 = SKAction.sequence([setButtonsDown, buttonsmove])
                
                let moveUpTopbar = SKAction.moveTo(y: cameraNode.position.y + 520, duration: 0.2)
                
                let setTopBar = SKAction.run {
                    
                    self.topBarStayDown = 2
                    
                    
                }
                
                let setTopBar1 = SKAction.run {
                    
                    self.topBarStayDown = 0
                    
                }
                let sequence = SKAction.sequence([setTopBar1, moveUpTopbar, setTopBar])
                
                topBar?.run(sequence)
                
                upDown!.run(sequence1)
                
                if finishLineSection!.contains(player!.position){
                
                let moveUpTopbar = SKAction.move(to: CGPoint(x: cameraNode.position.x, y: cameraNode.position.y + 520), duration: 0.5)
                
                let setTopBarDown = SKAction.run {
                    
                    self.topBarDown = false
                    
                }
                
                let sequence = SKAction.sequence([setTopBarDown, moveUpTopbar])
                
                topBar?.run(sequence)
                }
                
                
                darkBackGround2!.position = cameraNode.position
                
                
                
               
                
                
                
                
                
                
                
                let wait1 = SKAction.wait(forDuration: 1)
                
                let resetButtonGrow = SKAction.resize(toWidth: 126, height: 126, duration: 0.2)
                let resetGrow = SKAction.resize(toWidth: 86.4, height: 86.4, duration: 0.2)
                
                let resetbuttonSeq = SKAction.sequence([wait1, resetButtonGrow])
                let resetbuttonSeq2 = SKAction.sequence([wait1, resetGrow])
                
                let homeGrow = SKAction.resize(toWidth: 82, height: 75, duration: 0.2)
                let homebuttonSeq = SKAction.sequence([wait1, homeGrow])
                
                let mainMenuGrow = SKAction.resize(toWidth: 70, height: 70, duration: 0.2)
                let mainMenubuttonSeq = SKAction.sequence([wait1, mainMenuGrow])
                
                let nextLevelGrow = SKAction.resize(toWidth: 80, height: 50, duration: 0.2)
                let nextLevelbuttonSeq = SKAction.sequence([wait1, nextLevelGrow])
                
                let StarShrink = SKAction.resize(toWidth: 210, height: 210, duration: 0.1)
                
                let allowStarSpawn1 = SKAction.run {
                    
                    
                    
                    self.allowStarSpawn1 = true
                    
                }
                
                let allowStarSpawn2 = SKAction.run {
                    
                    
                    
                    self.allowStarSpawn2 = true
                    
                }
                
                let allowStarSpawn3 = SKAction.run {
                    
                    
                    
                    self.allowStarSpawn3 = true
                    
                }
                
                let starexplosin1 = SKAction.run {
                    if self.allowStarparticles1 == true{
                        self.explosion()
                    self.starexplosionEmitter2(position: self.Star12!.position)
                        self.allowStarparticles1 = false
                    }
                
                }
                
                let starexplosin2 = SKAction.run {
                    if self.allowStarparticles2 == true{
                        self.explosion()
                    self.starexplosionEmitter2(position: self.Star22!.position)
                        self.allowStarparticles2 = false
                    }
                
                }
                
                let starexplosin3 = SKAction.run {
                    if self.allowStarparticles3 == true{
                        self.explosion()
                    self.starexplosionEmitter2(position: self.Star32!.position)
                        self.allowStarparticles3 = false
                    }
                
                }
                
                // for 1 if star 1
                let star11seq = SKAction.sequence([wait1, allowStarSpawn1, StarShrink, starexplosin1])
                
                //for 2 if star1 and two
                let star22seq = SKAction.sequence([wait1, wait1, allowStarSpawn2, StarShrink, starexplosin2])
            
                //for 2 if only star2 or star2 and star 3
                let star21seq = SKAction.sequence([wait1, allowStarSpawn2, StarShrink, starexplosin2])
                
                // for 3 if star 1,2, and 3
                let star33seq = SKAction.sequence([wait1, wait1, wait1, allowStarSpawn3, StarShrink, starexplosin3])
                
                // for 3 if star 2 and 3 or 1 and 3
                let star32seq = SKAction.sequence([wait1, wait1, allowStarSpawn3, StarShrink, starexplosin3])
                
                // for 3 if only star 3
                let star31seq = SKAction.sequence([wait1, allowStarSpawn3, StarShrink, starexplosin3])
                
                
                if haveStar1 == true && (haveStar2 == false || haveStar2 == nil) && (haveStar3 == false || haveStar3 == nil){
                    
                    Star12!.run(star11seq)
                    
                    
                }
                
                if (haveStar1 == false || haveStar1 == nil) && haveStar2 == true && (haveStar3 == false || haveStar3 == nil) {
                    
                    
                    Star22!.run(star21seq)
                    
                    
                }
                
                if (haveStar1 == false || haveStar1 == nil) && (haveStar2 == false || haveStar2 == nil) && haveStar3 == true{
                    
                    
                    Star32!.run(star31seq)
                    
                }
                
                if (haveStar1 == false || haveStar1 == nil) && haveStar2 == true && haveStar3 == true{
                    
                    Star22!.run(star21seq)
                    Star32!.run(star32seq)
                    
                }
                
                if haveStar1 == true && haveStar2 == true && (haveStar3 == false || haveStar3 == nil) {
                    
                    Star12!.run(star11seq)
                    Star22!.run(star22seq)
                    
                    
                }
                
                if haveStar1 == true && haveStar2 == true && haveStar3 == true{
                    
                    Star12!.run(star11seq)
                    Star22!.run(star22seq)
                    Star32!.run(star33seq)
                    
                }
                
                if haveStar1 == true && (haveStar2 == false || haveStar2 == nil) && haveStar3 == true{
                    
                    Star12!.run(star11seq)
                    
                    Star32!.run(star32seq)
                    
                }
                
                
                if allowResetGrow == true{
                resetButton2!.run(resetbuttonSeq)
                resetButtonShade2!.run(resetbuttonSeq)
                reset2!.run(resetbuttonSeq2)
                    
                allowResetGrow = false
                }
                
                if allowHomeGrow == true{
                homeButton!.run(resetbuttonSeq)
                homeButtonShade!.run(resetbuttonSeq)
                home!.run(homebuttonSeq)
                    
                allowHomeGrow = false
                }
                
                
                if allowMainMenuGrow == true{
                mainMenuButton!.run(resetbuttonSeq)
                mainMenuButtonShade!.run(resetbuttonSeq)
                mainMenu!.run(mainMenubuttonSeq)
                    
                allowMainMenuGrow = false
                }
                
                if allowNextLevelGrow == true{
                nextLevelButton!.run(resetbuttonSeq)
                nextLevelButtonShade!.run(resetbuttonSeq)
                nextLevel!.run(nextLevelbuttonSeq)
                    
                allowNextLevelGrow = false
                }
                
                if allowLightBack == true{
                let lightBackGrow = SKAction.move(to: cameraNode.position, duration: 0.4)
                
                    let run = SKAction.run {
                        self.lightBackDown = true
                        
                    }
                    let sequence = SKAction.sequence([lightBackGrow,run])
                    
                    
                lightBack?.run(sequence)
                allowLightBack = false
                
                }
                let darkBackGetdark = SKAction.fadeAlpha(to: 0.7, duration: 1)
                
                darkBackGround2?.run(darkBackGetdark)
                
                player!.physicsBody?.isDynamic = true
                
            } else {
                
                lightBack!.position.y = cameraNode.position.y + lightBack!.size.height
                lightBack!.position.x = cameraNode.position.x
                 
            }
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "ramp" {
            
            onGround = true
            onGround2 = true
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "floor" {
            
            onGround = true
            onGround2 = true
            
        }    }
    
    func clicknoise() {
        
        if mainMenuScene.volume == true{
        run(SKAction.playSoundFileNamed("Click.mp3", waitForCompletion:false))
        }
    }
    
    func explosion() {
        
        if mainMenuScene.volume == true{
            run(SKAction.playSoundFileNamed("Explosion.mp3", waitForCompletion:false))
        }
        
        
    }
    
    func built() {
        
        if mainMenuScene.volume == true{
            run(SKAction.playSoundFileNamed("Build.wav", waitForCompletion:false))
        }
    }
        
    func StarNoise() {
            
        if mainMenuScene.volume == true{
            run(SKAction.playSoundFileNamed("StarCollect.mp3", waitForCompletion:false))
        }
        
    }
    
    //MARK: Touches Began
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            location = t.location(in: self)
            
            if resumeButton!.contains(location!){
                 
                clicknoise()
                
                let resetButtonShrink3 = SKAction.resize(toWidth: 333.6, height: 90.72, duration: 0.1)
                let resetShrink3 = SKAction.resize(toWidth: 52.2, height: 54.9, duration: 0.1)
                
                resume!.run(resetShrink3)
                resumeButton!.run(resetButtonShrink3)
                resumeButtonShade!.run(resetButtonShrink3)
                
                resumepressed = true
                
            }
            
            if homeButton2!.contains(location!){
                 
                
                clicknoise()
                let resetButtonShrink3 = SKAction.resize(toWidth: 333.6, height: 90.72, duration: 0.1)
                let resetShrink3 = SKAction.resize(toWidth: 64.8, height: 58.5, duration: 0.1)
                
                home2!.run(resetShrink3)
                homeButton2!.run(resetButtonShrink3)
                homeButtonShade2!.run(resetButtonShrink3)
                
                homepressed2 = true
                
            }
            
            if resetButton3!.contains(location!){
                clicknoise()
                let resetButtonShrink3 = SKAction.resize(toWidth: 158.175, height: 90.72, duration: 0.1)
                let resetShrink3 = SKAction.resize(toWidth: 63.9, height: 63.9, duration: 0.1)
                
                reset3!.run(resetShrink3)
                resetButton3!.run(resetButtonShrink3)
                resetButtonShade3!.run(resetButtonShrink3)
                
                resetpressed3 = true
                
            }
            
            if mainMenuButton2!.contains(location!){
                clicknoise()
                let resetButtonShrink3 = SKAction.resize(toWidth: 158.175, height: 90.72, duration: 0.1)
                let resetShrink3 = SKAction.resize(toWidth: 63.9, height: 63.9, duration: 0.1)
                
                mainMenu2!.run(resetShrink3)
                mainMenuButton2!.run(resetButtonShrink3)
                mainMenuButtonShade2!.run(resetButtonShrink3)
                
                mainMenupressed2 = true
                
            }
            
            
            if allowTouch == true{
            
                if wallInOneRightWallGrid == false{
                    
                    oneRightWallGrid!.alpha = 0
                    
                }
                
                if wallInOneLeftWallGrid == false{
                    
                    oneLeftWallGrid!.alpha = 0
                    
                }
                
                if floorInOneTopFloorGrid == false{
                    
                    oneTopFloorGrid!.alpha = 0
                    
                }
                
                if floorInOneBottomFloorGrid == false{
                    
                    oneBottomFloorGrid!.alpha = 0
                }
                
                
                
                
            if resetButton2!.contains(location!){
                clicknoise()
                let resetButtonShrink2 = SKAction.resize(toWidth: 113.4, height: 113.4, duration: 0.1)
                let resetShrink2 = SKAction.resize(toWidth: 77.76, height: 77.76, duration: 0.1)
                
                reset2!.run(resetShrink2)
                resetButton2!.run(resetButtonShrink2)
                resetButtonShade2!.run(resetButtonShrink2)
                
                resetpressed2 = true
                
            }
                
                
                
            
            
                
                if resetButton!.contains(location!){
                    clicknoise()
                    let resetButtonShrink1 = SKAction.resize(toWidth: 81, height: 81, duration: 0.1)
                    let resetShrink1 = SKAction.resize(toWidth: 58, height: 58, duration: 0.1)
                    
                    reset!.run(resetShrink1)
                    resetButton!.run(resetButtonShrink1)
                    resetButtonShade!.run(resetButtonShrink1)
                    
                    resetpressed1 = true
                    
            }
              if pausedButton!.contains(location!){
                clicknoise()
                let resetButtonShrink1 = SKAction.resize(toWidth: 81, height: 81, duration: 0.1)
                let resetShrink1 = SKAction.resize(toWidth: 36, height: 45, duration: 0.1)
                      
                      pausedB!.run(resetShrink1)
                      pausedButton!.run(resetButtonShrink1)
                      pausedButtonShade!.run(resetButtonShrink1)
                      
                      pausedpressed = true
                
                      
              }
                
            if UpDownButton!.contains(location!){
                clicknoise()
                  let resetButtonShrink1 = SKAction.resize(toWidth: 81, height: 81, duration: 0.1)
                  let resetShrink1 = SKAction.resize(toWidth: 36, height: 45, duration: 0.1)
                     
                
                        upDown!.run(resetShrink1)
                        UpDownButton!.run(resetButtonShrink1)
                        UpDownButtonShade!.run(resetButtonShrink1)
                        
                       upDownPressed = true
                  
                        
            }
                
                
            
            if homeButton!.contains(location!){
                clicknoise()
                let resetButtonShrink2 = SKAction.resize(toWidth: 113.4, height: 113.4, duration: 0.1)
                let resetShrink2 = SKAction.resize(toWidth: 73.8, height: 67.5, duration: 0.1)
                
                home!.run(resetShrink2)
                homeButton!.run(resetButtonShrink2)
                homeButtonShade!.run(resetButtonShrink2)
                
                homepressed = true
                
            }
            
            if mainMenuButton!.contains(location!){
                clicknoise()
                let resetButtonShrink3 = SKAction.resize(toWidth: 113.4, height: 113.4, duration: 0.1)
                let resetShrink3 = SKAction.resize(toWidth: 63, height: 63, duration: 0.1)
                
                mainMenu!.run(resetShrink3)
                mainMenuButton!.run(resetButtonShrink3)
                mainMenuButtonShade!.run(resetButtonShrink3)
                
                mainMenupressed = true
                
            }
                
            if nextLevelButton!.contains(location!){
                clicknoise()
                let resetButtonShrink3 = SKAction.resize(toWidth: 113.4, height: 113.4, duration: 0.1)
                let resetShrink3 = SKAction.resize(toWidth: 72, height: 45, duration: 0.1)
                
                nextLevel!.run(resetShrink3)
                nextLevelButton!.run(resetButtonShrink3)
                nextLevelButtonShade!.run(resetButtonShrink3)
                
                nextLevelpressed = true
                
            }
                
                
            if passedFinishLine == false{
                
            if topBar!.contains(ramp!){
                
                ramp!.physicsBody?.isDynamic = false
                
            }
            
            if topBar!.contains(wall!){
                
                wall!.physicsBody?.isDynamic = false
                
            }
            
            if topBar!.contains(floor!){
                
                floor!.physicsBody?.isDynamic = false
                
            }
            if rampInOneRampGrid == true{
                rampeffectsAllowed = false
            }
            
            if wallInOneLeftWallGrid == true || wallInOneRightWallGrid == true{
                walleffectsAllowed = false
            }
            
            if floorInOneTopFloorGrid == true || floorInOneBottomFloorGrid == true{
                flooreffectsAllowed = false
            }
            
            
            
            if wall!.contains(location!) {
                
                if wallInOneRightWallGrid == false || wallInOneLeftWallGrid == false {
                
                touchingWall = true
                    
                }
            }
            
            if ramp!.contains(location!) {
                
            if rampInOneRampGrid == false{
                
                touchingRamp = true
                
                }
            }
            
            if floor!.contains(location!) {
                
                if floorInOneBottomFloorGrid == false || floorInOneTopFloorGrid == false{
                    
                    touchingFloor = true
                }
                
                
            }
            
            if floor!.contains(location!) || ramp!.contains(location!) || wall!.contains(location!) {
            
            if rampInOneRampGrid == true || floorInOneBottomFloorGrid == true || floorInOneTopFloorGrid == true || wallInOneRightWallGrid == true || wallInOneLeftWallGrid == true {
                
            
               player!.physicsBody?.isDynamic = true
                
                }
            }
            
            if rightTouch!.contains(location!) || rampInOneRampGrid == true && ramp!.contains(location!) && oneGridInRight == true || ((wallInOneRightWallGrid == true || wallInOneLeftWallGrid == true) && wall!.contains(location!) && oneGridInRight == true) || ((floorInOneBottomFloorGrid == true || floorInOneTopFloorGrid == true) && floor!.contains(location!) && oneGridInRight == true){
                
                touchingRight = true
                
                
                
                if onGround == true {
                    
                    
                    //player!.physicsBody?.applyImpulse(CGVector(dx: 25, dy: 40))
                    //player!.physicsBody?.applyAngularImpulse(-0.005)
                    
                    
                    
                }
                //onGround = false
            }
            
            
            
            
            if leftTouch!.contains(location!) || (rampInOneRampGrid == true && ramp!.contains(location!) && oneGridInLeft == true) || ((wallInOneRightWallGrid == true || wallInOneLeftWallGrid == true) && wall!.contains(location!) && oneGridInLeft == true) || ((floorInOneBottomFloorGrid == true || floorInOneTopFloorGrid == true) && floor!.contains(location!) && oneGridInLeft == true){
                
                touchingLeft = true
                
                if onGround == true {
                    
                   //player!.physicsBody?.applyImpulse(CGVector(dx: -25, dy: 40))
                    //player!.physicsBody?.applyAngularImpulse(0.005)
                    
                    
                    
                }
                
                //onGround = false
                    }
                }
            }
        }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if passedFinishLine == false{
        name1!.isPaused = true
        name2!.isPaused = true
        name3!.isPaused = true
            
        endexplosion!.isPaused = true
              
        physicsWorld.speed = 0
        
        pausedpressed2 = true
            
        allowTouch = false
            
        
            
            lightBack2!.position.y = cameraNode.position.y + lightBack2!.size.height
            lightBack2!.position.x = cameraNode.position.x
            
            
            
        lightBack2!.position = cameraNode.position
        
            
            
        darkBackGround!.alpha = 0.7
            
        darkBackGround!.zPosition = 30
            
        darkBackGround!.position = cameraNode.position
        }
    }
    
    deinit {
        print("deinit")
    }
    
    
    //MARK: Touches Moved
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         for t in touches {
            location = t.location(in: self)
                
            
            if allowTouch == true {
            
            
                
            
            if passedFinishLine == false{
                
                
                
                
                
                if oneGrid!.contains(ramp!.position){
                
                rampInOneRampGrid = true
                if touchingRamp == true{
                    
                if floorInOneTopfloorGrid2 == false && floorInOneBottomfloorGrid2 == false && wallInOneLeftWallGrid2 == false && wallInOneRightWallGrid2 == false {
                        oneRampGrid!.alpha = 0.2
                    
                    }
                    
                }
                
            } else {
                
                rampInOneRampGrid = false
                
                oneRampGrid!.alpha = 0
            }
                
            
            
            if oneGrid!.contains(wall!.position){
                
                if oneLeftWallGrid!.contains(wall!.position){
                wallInOneLeftWallGrid = true
                wallInOneRightWallGrid = false
                
                }
                if touchingWall == true{
                if wallInOneLeftWallGrid == true || wallInOneRightWallGrid2 == false{
                    
                    if rampInOneRampGrid2 == false && floorInOneTopfloorGrid2 == false && floorInOneBottomfloorGrid2 == false{
                        oneLeftWallGrid!.alpha = 0.2
                    }
                        }
                    }

            } else {
                
                wallInOneLeftWallGrid = false
                oneLeftWallGrid!.alpha = 0
                
            }
            
            if oneGrid!.contains(wall!.position){
                
                if oneRightWallGrid!.contains(wall!.position){
                wallInOneRightWallGrid = true
                wallInOneLeftWallGrid = false
                
                }
                if touchingWall == true{
                    
                if wallInOneRightWallGrid == true || wallInOneLeftWallGrid2 == false{
                  if rampInOneRampGrid2 == false && floorInOneTopfloorGrid2 == false && floorInOneBottomfloorGrid2 == false{
                    oneRightWallGrid!.alpha = 0.2
                    }
                    
                    }
                }
            
            } else {
                
                wallInOneRightWallGrid = false
                oneRightWallGrid!.alpha = 0
                
                
            }
            
            if oneGrid!.contains(floor!.position){
                
                
                    
                if oneBottomFloorGrid!.contains(floor!.position){
                floorInOneBottomFloorGrid = true
                floorInOneTopFloorGrid = false
                    
                }
                
                
                if touchingFloor == true{
                    if floorInOneBottomFloorGrid == true || floorInOneTopfloorGrid2 == false{
                        
                        if rampInOneRampGrid2 == false && wallInOneLeftWallGrid2 == false && wallInOneRightWallGrid2 == false{
                            oneBottomFloorGrid!.alpha = 0.2
                        }
                    }
                }
                
            } else {
                
                floorInOneBottomFloorGrid = false
                
                oneBottomFloorGrid!.alpha = 0
                
                    }
                
            
                
                
                
            if oneGrid!.contains(floor!.position){
                
                
                    
                if oneTopFloorGrid!.contains(floor!.position){
                    
                floorInOneTopFloorGrid = true
                floorInOneBottomFloorGrid = false
                    
                }
                
                if touchingFloor == true{
                    
                if floorInOneBottomfloorGrid2 == false || floorInOneTopFloorGrid == true{
                    
                    
                    if rampInOneRampGrid2 == false && wallInOneLeftWallGrid2 == false && wallInOneRightWallGrid2 == false{
                    oneTopFloorGrid!.alpha = 0.2
                    }
                    }
                }
                
            } else {
                
                floorInOneTopFloorGrid = false
                
                oneTopFloorGrid!.alpha = 0
            }
                
            
            
            if leftTouch!.contains(wall!.position) || rightTouch!.contains(wall!.position){
                
                let wallGrow = SKAction.resize(toWidth: 36, height: 160, duration: 0.3)
                
                wall!.run(wallGrow)
                wallShadow!.run(wallGrow)
                
                
            }
            
            if leftTouch!.contains(floor!.position) || rightTouch!.contains(floor!.position){
                
                let floorGrow = SKAction.resize(toWidth: 36, height: 160, duration: 0.3)
                
                floor!.run(floorGrow)
                floorShadow!.run(floorGrow)
                
            }
            
            if leftTouch!.contains(ramp!.position) || rightTouch!.contains(ramp!.position){
                
                let rampGrow = SKAction.resize(toWidth: 23, height: 201, duration: 0.3)
                
                ramp!.run(rampGrow)
                rampShadow!.run(rampGrow)
                
            }
            
            
            
            if touchingWall == true {
                
            wall!.position = location!
             wallShadow!.position.x = location!.x
             wallShadow!.position.y = location!.y - 8
                
                
            }
            
            if touchingRamp == true {
                
            ramp!.position = location!
                
                
            rampShadow!.position.x = location!.x
            rampShadow!.position.y = location!.y - 8
                
            }
            
            if touchingFloor == true {
                
            floor!.position = location!
             floorShadow!.position.x = location!.x
             floorShadow!.position.y = location!.y - 8
                
                    }
                }
            }
        }
    }
    
    //MARK: Touches Ended
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            location = t.location(in: self)
            
            
            
            if rampInOneRampGrid == false{
                
                oneRampGrid!.alpha = 0
                
            }
            
            if wallInOneRightWallGrid == false{
                
                oneRightWallGrid!.alpha = 0
                
            }
            
            if wallInOneLeftWallGrid == false{
                
                oneLeftWallGrid!.alpha = 0
                
            }
            
            if floorInOneTopFloorGrid == false{
                
                oneTopFloorGrid!.alpha = 0
                
            }
            
            if floorInOneBottomFloorGrid == false{
                
                oneBottomFloorGrid!.alpha = 0
                
            }
            
            if upDownPressed == true{
                let resetButtonShrink = SKAction.resize(toWidth: 90, height: 90, duration: 0.1)
                    let resetShrink = SKAction.resize(toWidth: 40, height: 50, duration: 0.1)
                 
                upDown!.run(resetShrink)
                UpDownButton!.run(resetButtonShrink)
                UpDownButtonShade!.run(resetButtonShrink)
                
                upDownPressed = false
            if UpDownButton!.contains(location!){
                if topBarStayDown == 1{
                     
                    //1 = true
                    //2 = false
                    //0 = nil
                    
                    let turn = SKAction.rotate(byAngle: 3.142, duration: 0.3)
                    
                    upDown?.run(turn)
                    
                    let moveUpTopbar = SKAction.moveTo(y: cameraNode.position.y + 520, duration: 0.2)
                    
                    let setTopBar = SKAction.run {
                        
                        self.topBarStayDown = 2
                        
                        
                    }
                    
                    let setTopBar1 = SKAction.run {
                        
                        self.topBarStayDown = 0
                        
                    }
                    let sequence = SKAction.sequence([setTopBar1, moveUpTopbar, setTopBar])
                    
                    topBar?.run(sequence)
                    
                    
                    }
                if topBarStayDown == 2{
                    
                    let turn = SKAction.rotate(byAngle: 3.142, duration: 0.3)
                    
                    upDown?.run(turn)
                    
                    let moveUpTopbar = SKAction.moveTo(y: cameraNode.position.y + 200, duration: 0.2)
                    
                    
                    
                    let setTopBar = SKAction.run {
                        
                        self.topBarStayDown = 1
                        
                    }
                    
                    let setTopBar1 = SKAction.run {
                        
                        self.topBarStayDown = 0
                        
                    }
                    
                    let sequence = SKAction.sequence([setTopBar1, moveUpTopbar, setTopBar])
                    
                    topBar?.run(sequence)
                    
                    }
                }
            }
            if resetpressed3 == true{
                let resetButtonShrink = SKAction.resize(toWidth: 175.5, height: 100.8, duration: 0.1)
            let resetShrink = SKAction.resize(toWidth: 71, height: 71, duration: 0.1)
             
            reset3!.run(resetShrink)
            resetButton3!.run(resetButtonShrink)
            resetButtonShade3!.run(resetButtonShrink)
            }
            
            if mainMenupressed2 == true{
                let resetButtonShrink = SKAction.resize(toWidth: 175.5, height: 100.8, duration: 0.1)
            let resetShrink = SKAction.resize(toWidth: 71, height: 71, duration: 0.1)
             
            mainMenu2!.run(resetShrink)
            mainMenuButton2!.run(resetButtonShrink)
            mainMenuButtonShade2!.run(resetButtonShrink)
            }
            
            if mainMenupressed == true || mainMenupressed2 == true {
                
                let changeScene = SKAction.run {
                let mainmenuscene = HomeScene(fileNamed: "mainMenuScene")
                mainmenuscene?.scaleMode = .aspectFill
                self.scene?.view?.presentScene(mainmenuscene!)
                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                }
                
                let wait01 = SKAction.wait(forDuration: 0.1)
                
                let seq = SKAction.sequence([wait01,changeScene])
                
                mainMenuButton!.run(seq)
                
            }
            
            
            if homepressed2 == true || homepressed == true{
                
                let changeScene = SKAction.run {
                    let mainmenuscene = HomeScene(fileNamed: "HomeScene")
                    mainmenuscene?.scaleMode = .aspectFill
                    self.scene?.view?.presentScene(mainmenuscene!)
                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                }
                
            view!.showsPhysics = false
                
            let resetButtonShrink = SKAction.resize(toWidth: 370.7, height: 100.8, duration: 0.1)
            let resetShrink = SKAction.resize(toWidth: 72, height: 65, duration: 0.1)
             
                let homepressed = SKAction.sequence([resetShrink,changeScene])
                
            home2!.run(homepressed)
            homeButton2!.run(resetButtonShrink)
            homeButtonShade2!.run(resetButtonShrink)
                
                
                
                
                
                
            }
            
            if resumepressed == true{
            let resetButtonShrink = SKAction.resize(toWidth: 370.7, height: 100.8, duration: 0.1)
            let resetShrink = SKAction.resize(toWidth: 58, height: 61, duration: 0.1)
             
            resume!.run(resetShrink)
            resumeButton!.run(resetButtonShrink)
            resumeButtonShade!.run(resetButtonShrink)
                
            resumepressed = false
                if resumeButton!.contains(location!){
                name1!.isPaused = false
                name2!.isPaused = false
                name3!.isPaused = false
                    
                endexplosion!.isPaused = false
                      
                physicsWorld.speed = 1
                
                
                   
                
                
                allowTouch = true
                    
                allowLightBack = true
                
                let run = SKAction.run {
                    
                    self.pausedpressed2 = false
                    
                }
                
                
                        let lightBackGrow = SKAction.move(to: CGPoint(x: cameraNode.position.x, y: cameraNode.position.y + lightBack2!.size.height), duration: 0.2)
                
                let lightBackseq = SKAction.sequence([lightBackGrow, run])
                
                    lightBack2?.run(lightBackseq)
                    
                    
                    
                    
                
                

                    
                    let darkBackGetdark = SKAction.fadeAlpha(to: 0, duration: 0.2)
                    
                darkBackGround!.run(darkBackGetdark)
                }
                
            }
            
            
            if resetpressed1 == true{
            let resetButtonShrink = SKAction.resize(toWidth: 90, height: 90, duration: 0.1)
                let resetShrink = SKAction.resize(toWidth: 64.8, height: 64.8, duration: 0.1)
             
            reset!.run(resetShrink)
            resetButton!.run(resetButtonShrink)
            resetButtonShade!.run(resetButtonShrink)
            }
                
            //MARK: Paused Pressed
            if pausedpressed == true{
                let resetButtonShrink = SKAction.resize(toWidth: 90, height: 90, duration: 0.1)
                    let resetShrink = SKAction.resize(toWidth: 40, height: 50, duration: 0.1)
                 
                pausedB!.run(resetShrink)
                pausedButton!.run(resetButtonShrink)
                pausedButtonShade!.run(resetButtonShrink)
                
                pausedpressed = false
                    
            if pausedButton!.contains(location!){
                name1!.isPaused = true
                name2!.isPaused = true
                name3!.isPaused = true
                    
                endexplosion!.isPaused = true
                      
                physicsWorld.speed = 0
                
                pausedpressed2 = true
                    
                allowTouch = false
                    
                
                    
                    lightBack2!.position.y = cameraNode.position.y// + lightBack2!.size.height
                    lightBack2!.position.x = cameraNode.position.x
                    
                   // let lightBackGrow = SKAction.move(to: cameraNode.position, duration: 0.2)
                    
                //lightBack2!.run(lightBackGrow)
                    
                   // let darkBackGetdark = SKAction.fadeAlpha(to: 0.7, duration: 0.2)
                    
                //darkBackGround!.run(darkBackGetdark)
                    
                darkBackGround!.zPosition = 30
                    
                darkBackGround!.alpha = 0.7
                
                darkBackGround!.position = cameraNode.position
                    
                
                    }
                    
                }
                
            
            if resetpressed2 == true{
            let resetButtonShrink = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
                let resetShrink = SKAction.resize(toWidth: 86.4, height: 86.4, duration: 0.1)
            
            reset2!.run(resetShrink)
            resetButton2!.run(resetButtonShrink)
            resetButtonShade2!.run(resetButtonShrink)
            }
            
            if homepressed == true{
            let resetButtonShrink = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
            let resetShrink = SKAction.resize(toWidth: 82, height: 75, duration: 0.1)
            
            home!.run(resetShrink)
            homeButton!.run(resetButtonShrink)
            homeButtonShade!.run(resetButtonShrink)
            }
            
            if mainMenupressed == true{
            let resetButtonShrink2 = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
            let resetShrink2 = SKAction.resize(toWidth: 70, height: 70, duration: 0.1)
            
            mainMenu!.run(resetShrink2)
            mainMenuButton!.run(resetButtonShrink2)
            mainMenuButtonShade!.run(resetButtonShrink2)
            }
                
            if nextLevelpressed == true{
                    
            let resetButtonShrink2 = SKAction.resize(toWidth: 126, height: 126, duration: 0.1)
            let resetShrink2 = SKAction.resize(toWidth: 80, height: 50, duration: 0.1)
                       
            nextLevel!.run(resetShrink2)
            nextLevelButton!.run(resetButtonShrink2)
            nextLevelButtonShade!.run(resetButtonShrink2)
                
                let changeScene = SKAction.run {
                let mainmenuscene = level2(fileNamed: "level2")
                mainmenuscene?.scaleMode = .aspectFill
                self.scene?.view?.presentScene(mainmenuscene!)
                    //, transition: SKTransition.fade(with: .black, duration: 3.0))
                }
                
                let wait01 = SKAction.wait(forDuration: 0.1)
                
                let seq = SKAction.sequence([wait01,changeScene])
                
                nextLevelButton!.run(seq)
                
                
            }
                
            //MARK: Reset Pressed

                if resetpressed1 == true{
                 
                if resetButton!.contains(location!){
    
                resetfunc()
                    
                    }
            }
             if resetpressed2 == true{
                if resetButton2!.contains(location!){
                    
                resetfunc()
                    
                }
            }
            
            if resetpressed3 == true{
                if resetButton3!.contains(location!){
                    
                resetfunc()
                    
                }
            }
            
        }
            if passedFinishLine == false {
    
            if allowTouch == true{
                
                
            touchingRight = false
            touchingLeft = false

            touchingFloor = false
            touchingRamp = false
            touchingWall = false
            
            
            
            
            if wallInOneLeftWallGrid == false && wallInOneRightWallGrid == false && rampInOneRampGrid == false {
                
            if floorInOneBottomFloorGrid == true || floorInOneTopFloorGrid == true {
                    
                floor!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                floor!.physicsBody?.isDynamic = false
                ramp!.physicsBody?.friction = 1
                
                    if flooreffectsAllowed == true {
                        
                        if floor!.contains(location!){
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.floor!.position.x, y: self.floor!.position.y), rotation: 1.5708)
                            
                                    }
                                    
                                    let wait = SKAction.wait(forDuration: 0.001)
                                    
                                    let rampseq = SKAction.sequence([wait, explosion])
                                    
                                    floor!.run(rampseq)
                            
                            
                        }
                    }
                }
                
                if floorInOneBottomFloorGrid == false || floorInOneTopFloorGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                
                if floorInOneBottomFloorGrid == true {
                    
                    floorInOneBottomfloorGrid2 = true
                    
                    floor!.position = oneBottomFloorGrid!.position
                    floorShadow!.position.y = oneBottomFloorGrid!.position.y - 8
                    floorShadow!.position.x = oneBottomFloorGrid!.position.x
                    
                    
                }
                
                if floorInOneTopFloorGrid == true {
                    
                    floorInOneTopfloorGrid2 = true
                    
                    floor!.position = oneTopFloorGrid!.position
                    floorShadow!.position.y = oneTopFloorGrid!.position.y - 8
                    floorShadow!.position.x = oneTopFloorGrid!.position.x
                    
                }
                
            }
            
            
            if floorInOneTopFloorGrid == false && floorInOneBottomFloorGrid == false && rampInOneRampGrid == false {
                
            if wallInOneRightWallGrid == true || wallInOneLeftWallGrid == true {
                    
                wall!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                wall!.physicsBody?.isDynamic = false
            
                    if walleffectsAllowed == true {
                        
                        if wall!.contains(location!){
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.wall!.position.x, y: self.wall!.position.y), rotation: 0)
                            
                                    }
                                    
                                    let wait = SKAction.wait(forDuration: 0.001)
                                    
                                    let rampseq = SKAction.sequence([wait, explosion])
                                    
                                    wall!.run(rampseq)
                            
                            
                            
                    }
                }
            }
                
            
                if wallInOneLeftWallGrid == false || wallInOneRightWallGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                
                if wallInOneLeftWallGrid == true {
                    
                    wallInOneLeftWallGrid2 = true
                    
                    
                    
                    wall!.position = oneLeftWallGrid!.position
                    wallShadow!.position.x = oneLeftWallGrid!.position.x
                    wallShadow!.position.y = oneLeftWallGrid!.position.y - 8
                    
                }
                
                if wallInOneRightWallGrid == true {
                    
                    wallInOneRightWallGrid2 = true
                    
                    
                    
                    wall!.position = oneRightWallGrid!.position
                    wallShadow!.position.x = oneRightWallGrid!.position.x
                    wallShadow!.position.y = oneRightWallGrid!.position.y - 8
                    
                }
                
            }
            
            
            if wallInOneLeftWallGrid == false && wallInOneRightWallGrid == false && floorInOneTopFloorGrid == false && floorInOneBottomFloorGrid == false{
                
            if rampInOneRampGrid == true {
                
                ramp!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp!.size.width - 14, height: ramp!.size.height + 20), center: CGPoint(x: 0, y: 0))
                
                ramp!.physicsBody?.isDynamic = false
                ramp!.physicsBody?.friction = 1
                
                if rampeffectsAllowed == true {
                    
                    if ramp!.contains(location!){
                    
                        
                        let explosion = SKAction.run {
                            self.explosionEmitter(position: CGPoint(x: self.ramp!.position.x, y: self.ramp!.position.y), rotation: -0.785398163)
                
                        }
                        
                        let wait = SKAction.wait(forDuration: 0.001)
                        
                        let rampseq = SKAction.sequence([wait, explosion])
                        
                        ramp!.run(rampseq)
                    }
                }
                
                rampInOneRampGrid2 = true
                
                ramp!.position = oneRampGrid!.position
                rampShadow!.position.x = oneRampGrid!.position.x
                rampShadow!.position.y = oneRampGrid!.position.y - 8
                
                
                
            }
            
            if rampInOneRampGrid == false {
                
                player!.physicsBody?.isDynamic = true
                
                    }
                }
            }
        }
    }

    func applicationWillResignActive(notification: NSNotification) {
         
    }
    
    //MARK: didSimulatePhysics
    
    override func didSimulatePhysics() {
        
        positions()
        
    }
    
    //MARK: Emitters
    
    
    func explosionEmitter(position: CGPoint, rotation: CGFloat) {
        
        built()
            
        
        
        let explosion = SKEmitterNode(fileNamed: "lockedIn.sks")
        explosion!.position = CGPoint(x: position.x, y: position.y)
        explosion!.zRotation = rotation
        addChild(explosion!)
        
        
    }
    
    func roundEmitter() {
        
        let explosion = SKEmitterNode(fileNamed: "playerTrail.sks")
        explosion!.position = CGPoint(x: player!.position.x, y: player!.position.y - 30)
        addChild(explosion!)
        
    }
    
    func confettiEmitter() {
        
        
        
    }
    
    
    
    func starexplosionEmitter(position: CGPoint) {
        
        let name = SKEmitterNode(fileNamed: "explosion.sks")
        name!.position = CGPoint(x: position.x, y: position.y)
        addChild(name!)
        
    }
    
    func starexplosionEmitter2(position: CGPoint) {
        
        let name = SKEmitterNode(fileNamed: "starExplosion.sks")
        name!.position = CGPoint(x: position.x, y: position.y)
        addChild(name!)
        
    }
    
    //MARK: Positions
    
    func positions(){
        
       
        
        if passedFinishLine == false{
            
                lightBack!.position.y = cameraNode.position.y + lightBack!.size.height
            
        }
        
        if pausedpressed2 == false {
            
            lightBack2!.position.y = cameraNode.position.y + lightBack2!.size.height
        }
        
        lightBack!.position.x = cameraNode.position.x
        lightBack2!.position.x = cameraNode.position.x
        
        if passedFinishLine == false{
        cameraNode.position.x = player!.position.x + 200
        cameraNode.position.y = player!.position.y + 120
        } else {
            
            let cameraYMove = SKAction.move(to: CGPoint(x: player!.position.x + 200, y: ground!.position.y + 190), duration: 2)
            
            cameraNode.run(cameraYMove)
            
        }
        
        if topBarStayDown == 1{
            
            topBar!.position.y = cameraNode.position.y + 200
            
        }
        
        if topBarStayDown == 2{
            
            topBar!.position.y = cameraNode.position.y + 500
            
        }
        
        topBar!.position.x = cameraNode.position.x
        
        if passedFinishLine == true{
            
            reset2!.position.x = cameraNode.position.x - 140
            reset2!.position.y = cameraNode.position.y - 100
            
            home!.position.x = cameraNode.position.x
            home!.position.y = cameraNode.position.y - 200
            
            mainMenu!.position.x = cameraNode.position.x
            mainMenu!.position.y = cameraNode.position.y - 50
            
            nextLevel!.position.x = cameraNode.position.x + 140
            nextLevel!.position.y = cameraNode.position.y - 100
            
            
            
            if haveStar1 == true{
                if allowStarSpawn1 == true {
                
                Star12!.position.x = cameraNode.position.x - 180
                Star12!.position.y = cameraNode.position.y + 120
                }
            }
            
            if haveStar2 == true{
                if allowStarSpawn2 == true{
                Star22!.position.x = cameraNode.position.x
                Star22!.position.y = cameraNode.position.y + 180
                }
            }
            
            if haveStar3 == true{
                if allowStarSpawn3 == true{
                Star32!.position.x = cameraNode.position.x + 180
                Star32!.position.y = cameraNode.position.y + 120
                }
            }
        }
        
        if passedFinishLine == true {
            
        StarSpot32!.position.x = lightBack!.position.x + 180
        StarSpot32!.position.y = lightBack!.position.y + 120
                           
        StarSpot22!.position.x = lightBack!.position.x
        StarSpot22!.position.y = lightBack!.position.y + 180
                           
        StarSpot12!.position.x = lightBack!.position.x - 180
        StarSpot12!.position.y = lightBack!.position.y + 120
        }
        
        if lightBackDown == true{
        lightBack!.position = cameraNode.position
        }
        
        if lightBackDown2 == true{
        lightBack2!.position = cameraNode.position
        }
        
        if rampInOneRampGrid2 == true || wallInOneLeftWallGrid2 == true || wallInOneRightWallGrid2 == true || floorInOneTopfloorGrid2 == true || floorInOneBottomfloorGrid2 == true{
            
            oneGrid!.alpha = 0
            
            
        }
        
        StarShade12!.position.y = Star12!.position.y - 8
        StarShade12!.position.x = Star12!.position.x
        
        StarShade22!.position.y = Star22!.position.y - 8
        StarShade22!.position.x = Star22!.position.x
        
        StarShade32!.position.y = Star32!.position.y - 8
        StarShade32!.position.x = Star32!.position.x

        Star12!.zRotation = StarShade12!.zRotation
        Star22!.zRotation = StarShade22!.zRotation
        Star32!.zRotation = StarShade32!.zRotation
        
        StarShade12!.size = Star12!.size
        StarShade22!.size = Star22!.size
        StarShade32!.size = Star32!.size
        
        resetButton2!.position = reset2!.position
        resetButtonShade2!.position.x = resetButton2!.position.x
        resetButtonShade2!.position.y = resetButton2!.position.y - 8
        
        resetButton3!.position = reset3!.position
        resetButtonShade3!.position.x = resetButton3!.position.x
        resetButtonShade3!.position.y = resetButton3!.position.y - 8
        
        mainMenuButton2!.position = mainMenu2!.position
        mainMenuButtonShade2!.position.x = mainMenuButton2!.position.x
        mainMenuButtonShade2!.position.y = mainMenuButton2!.position.y - 8
        
        homeButton2!.position = home2!.position
        homeButtonShade2!.position.x = homeButton2!.position.x
        homeButtonShade2!.position.y = homeButton2!.position.y - 8
        
        resumeButton!.position = resume!.position
        resumeButtonShade!.position.x = resumeButton!.position.x
        resumeButtonShade!.position.y = resumeButton!.position.y - 8
        
        topPausedBar!.position = gamePausedLabel!.position
        topPausedBarShade!.position.x = topPausedBar!.position.x
        topPausedBarShade!.position.y = topPausedBar!.position.y - 8
        
        
        if pausedpressed2 == false{
            
            reset3!.position.x = lightBack2!.position.x
            reset3!.position.y = lightBack2!.position.y + 900
            
            mainMenu2!.position.x = lightBack2!.position.x
            mainMenu2!.position.y = lightBack2!.position.y + 900
            
            home2!.position.x = lightBack2!.position.x
            home2!.position.y = lightBack2!.position.y + 900
            
            resume!.position.x = lightBack2!.position.x
            resume!.position.y = lightBack2!.position.y + 900
        
            gamePausedLabel!.position.x = lightBack2!.position.x
            gamePausedLabel!.position.y = lightBack2!.position.y + 900
            
            
        }
            
        
        if pausedpressed2 == true{
            
            reset3!.position.x = lightBack2!.position.x - 100
            reset3!.position.y = lightBack2!.position.y + 70
            
            resetButton3!.position.x = lightBack2!.position.x - 100
            resetButton3!.position.y = lightBack2!.position.y + 70
            
            resetButtonShade3!.position.x = lightBack2!.position.x - 100
            resetButtonShade3!.position.y = lightBack2!.position.y + 62
            
            mainMenu2!.position.x = lightBack2!.position.x + 100
            mainMenu2!.position.y = lightBack2!.position.y + 70
            
            mainMenuButton2!.position.x = lightBack2!.position.x + 100
            mainMenuButton2!.position.y = lightBack2!.position.y + 70
            
            mainMenuButtonShade2!.position.x = lightBack2!.position.x + 100
            mainMenuButtonShade2!.position.y = lightBack2!.position.y + 62
            
            home2!.position.x = lightBack2!.position.x
            home2!.position.y = lightBack2!.position.y - 65
            
            homeButton2!.position.x = lightBack2!.position.x
            homeButton2!.position.y = lightBack2!.position.y - 65
            
            homeButtonShade2!.position.x = lightBack2!.position.x
            homeButtonShade2!.position.y = lightBack2!.position.y - 73
            
            resume!.position.x = lightBack2!.position.x
            resume!.position.y = lightBack2!.position.y - 200
            
            resumeButton!.position.x = lightBack2!.position.x
            resumeButton!.position.y = lightBack2!.position.y - 200
            
            resumeButton!.position.x = lightBack2!.position.x
            resumeButton!.position.y = lightBack2!.position.y - 200
            
            resumeButtonShade!.position.x = lightBack2!.position.x
            resumeButtonShade!.position.y = lightBack2!.position.y - 208
            
            gamePausedLabel!.position.x = lightBack2!.position.x
            gamePausedLabel!.position.y = lightBack2!.position.y + 200
            
            topPausedBar!.position.x = lightBack2!.position.x
            topPausedBar!.position.y = lightBack2!.position.y + 200
            
            topPausedBarShade!.position.x = lightBack2!.position.x
            topPausedBarShade!.position.y = lightBack2!.position.y + 192
            
        }
        
        
        
        homeButton!.position = home!.position
        homeButtonShade!.position.x = homeButton!.position.x
        homeButtonShade!.position.y = homeButton!.position.y - 8
        
        mainMenuButton!.position = mainMenu!.position
        mainMenuButtonShade!.position.x = mainMenuButton!.position.x
        mainMenuButtonShade!.position.y = mainMenuButton!.position.y - 8
        
        nextLevelButton!.position = nextLevel!.position
        nextLevelButtonShade!.position.x = nextLevelButton!.position.x
        nextLevelButtonShade!.position.y = nextLevelButton!.position.y - 8
        
        if mainMenuScene.iPhoneSE == true ||  mainMenuScene.iPhone8 == true ||  mainMenuScene.iPhone8Plus == true{
            
            if buttonsDown == true {
                StarSpot3!.position.y = cameraNode.position.y + 240
                StarSpot2!.position.y = cameraNode.position.y + 240
                StarSpot1!.position.y = cameraNode.position.y + 240
            }
            if buttonsDown == false {
                StarSpot3!.position.y = upDown!.position.y
                StarSpot2!.position.y = upDown!.position.y
                StarSpot1!.position.y = upDown!.position.y
            }
            
            StarSpot3!.position.x = cameraNode.position.x + 475
        
            StarSpot2!.position.x = cameraNode.position.x + 420
            
            StarSpot1!.position.x = cameraNode.position.x + 365
           
        }
        
        if  mainMenuScene.iPhone11 == true ||  mainMenuScene.iPhone11Pro == true ||  mainMenuScene.iPhone11ProMax == true || mainMenuScene.iPhone12 == true ||  mainMenuScene.iPhone12Pro == true ||  mainMenuScene.iPhone12ProMax == true
        {
            
            if buttonsDown == true {
                StarSpot3!.position.y = cameraNode.position.y + 240
                StarSpot2!.position.y = cameraNode.position.y + 240
                StarSpot1!.position.y = cameraNode.position.y + 240
            }
            if buttonsDown == false {
                StarSpot3!.position.y = upDown!.position.y
                StarSpot2!.position.y = upDown!.position.y
                StarSpot1!.position.y = upDown!.position.y
            }
            
            
            StarSpot3!.position.x = cameraNode.position.x + 525
            
            
            StarSpot2!.position.x = cameraNode.position.x + 470
            
            
            StarSpot1!.position.x = cameraNode.position.x + 415
            
        }
        
        
        
        if haveStar1 == true{
        
            Star1!.position = StarSpot1!.position
            
            StarShade1!.position.x = StarSpot1!.position.x
            StarShade1!.position.y = StarSpot1!.position.y - 8
            
            self.Star1!.zPosition = -2
            self.StarShade1!.zPosition = -3
        }
        if haveStar1 == false || haveStar1 == nil{
            
            
            
            Star1!.position = CGPoint(x: -1040, y: -80)
            
            StarShade1!.position = CGPoint(x: -1040, y: -88)
        }
        
        if haveStar2 == true{
        
            Star2!.position = StarSpot2!.position
            
            StarShade2!.position.x = StarSpot2!.position.x
            StarShade2!.position.y = StarSpot2!.position.y - 8
            
            self.Star2!.zPosition = -2
            self.StarShade2!.zPosition = -3
        }
        if haveStar2 == false || haveStar2 == nil{
            
            
            
            Star2!.position = CGPoint(x: 80, y: 80)
        
            StarShade2!.position = CGPoint(x: 80, y: 72)
            
        }
        
        if haveStar3 == true{
        
            Star3!.position = StarSpot3!.position
            
            StarShade3!.position.x = StarSpot3!.position.x
            StarShade3!.position.y = StarSpot3!.position.y - 8
            
            self.Star3!.zPosition = -2
            self.StarShade3!.zPosition = -3
        
        }
        if haveStar3 == false || haveStar3 == nil{
            
            
            
            Star3!.position = CGPoint(x: 240, y: -80)
        
            StarShade3!.position = CGPoint(x: 240, y: -88)
            
        }
        
        
        
        
        
        
        
        playerShadow!.position.x = player!.position.x
        playerShadow!.position.y = player!.position.y - 8
        
        playerShadow!.zRotation = player!.zRotation
        
        
       
        
        
        
        topBarShade!.position.x = topBar!.position.x
        topBarShade!.position.y = topBar!.position.y - 8
        
        if passedFinishLine == true {
        
        darkBackGround!.position = cameraNode.position
            
            
            
        }
        
        
        if rampInOneRampGrid2 == true {
    
            
            
            ramp!.position = oneRampGrid!.position
            rampShadow!.position.x = oneRampGrid!.position.x
            rampShadow!.position.y = oneRampGrid!.position.y - 8
            
            
        }
        
        
            
        if wallInOneRightWallGrid2 == true {
        
                wall!.position = oneRightWallGrid!.position
                wallShadow!.position.x = oneRightWallGrid!.position.x
                wallShadow!.position.y = oneRightWallGrid!.position.y - 8
        }
        
        
            
        if wallInOneLeftWallGrid2 == true {
        
                wall!.position = oneLeftWallGrid!.position
                wallShadow!.position.x = oneLeftWallGrid!.position.x
                wallShadow!.position.y = oneLeftWallGrid!.position.y - 8
            
            
        }
        if floorInOneBottomfloorGrid2 == true {
        
            floor!.position = oneBottomFloorGrid!.position
            floorShadow!.position.x = oneBottomFloorGrid!.position.x
            floorShadow!.position.y = oneBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floorInOneTopfloorGrid2 == true {
        
            floor!.position = oneTopFloorGrid!.position
            floorShadow!.position.x = oneTopFloorGrid!.position.x
            floorShadow!.position.y = oneTopFloorGrid!.position.y - 8
            
                
            }
        
        
        if floorInOneTopFloorGrid == false && floorInOneBottomFloorGrid == false || wallInOneLeftWallGrid2 == true || wallInOneRightWallGrid2 == true || rampInOneRampGrid2 == true{
        
            if touchingFloor == false {
            
                let floorShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
                
                    floor!.run(floorShrink)
                    floorShadow!.run(floorShrink)
                
                floor!.position.x = topBar!.position.x - 160
                floor!.position.y = topBar!.position.y
                
                floorShadow!.position.x = topBar!.position.x - 160
                floorShadow!.position.y = topBar!.position.y - 8
                
                oneTopFloorGrid!.alpha = 0
                oneBottomFloorGrid!.alpha = 0
                
            }
        }
        
        if wallInOneLeftWallGrid == false && wallInOneRightWallGrid == false || floorInOneTopfloorGrid2 == true || floorInOneBottomfloorGrid2 == true || rampInOneRampGrid2 == true {
        
            if touchingWall == false {
            
                let wallShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
                
                wall!.run(wallShrink)
                wallShadow!.run(wallShrink)
                
                wall!.position.x = topBar!.position.x
                wall!.position.y = topBar!.position.y
                
                wallShadow!.position.x = topBar!.position.x
                wallShadow!.position.y = topBar!.position.y - 8
                
                oneLeftWallGrid!.alpha = 0
                oneRightWallGrid!.alpha = 0
                
            }
        }
    
        if rampInOneRampGrid == false || floorInOneTopfloorGrid2 == true || floorInOneBottomfloorGrid2 == true || wallInOneRightWallGrid2 == true || wallInOneLeftWallGrid2 == true{
            
            if touchingRamp == false {
                
                ramp!.position.x = topBar!.position.x + 160
                ramp!.position.y = topBar!.position.y
                
                rampShadow!.position.x = topBar!.position.x + 160
                rampShadow!.position.y = topBar!.position.y - 8
                
                oneRampGrid!.alpha = 0
                
            }
        }
        
        leftTouch!.position.x = cameraNode.position.x - 333
        leftTouch!.position.y = cameraNode.position.y + 200 - (75 + rightTouch!.size.height/2)
        rightTouch!.position.x = cameraNode.position.x + 333
        rightTouch!.position.y = cameraNode.position.y + 200 - (75 + rightTouch!.size.height/2)
    
        
        
        
        if  mainMenuScene.iPhoneSE == true ||  mainMenuScene.iPhone8 == true ||  mainMenuScene.iPhone8Plus == true{
            
        reset!.position.x = cameraNode.position.x - 470
        
        resetButtonShade!.position.x = cameraNode.position.x - 470
        
        resetButton!.position.x = cameraNode.position.x - 470
        
        pausedB!.position.x = cameraNode.position.x - 362
        
        pausedButtonShade!.position.x = cameraNode.position.x - 362
        
        pausedButton!.position.x = cameraNode.position.x - 362
        
        UpDownButtonShade!.position.x = cameraNode.position.x + 300
                  
        UpDownButton!.position.x = cameraNode.position.x + 300
                
        upDown!.position.x = cameraNode.position.x + 300
            
            if buttonsDown == true {
                
                upDown!.position.y = cameraNode.position.y + 236
                resetButtonShade!.position.y = cameraNode.position.y + 228
                reset!.position.y = cameraNode.position.y + 236
                resetButton!.position.y = cameraNode.position.y + 236
                pausedB!.position.y = cameraNode.position.y + 236
                pausedButtonShade!.position.y = cameraNode.position.y + 228
                pausedButton!.position.y = cameraNode.position.y + 236
                UpDownButtonShade!.position.y = cameraNode.position.y + 228
                UpDownButton!.position.y = cameraNode.position.y + 236
                
            }
            if buttonsDown == false {
                
                resetButtonShade!.position.y = upDown!.position.y - 8
                reset!.position.y = upDown!.position.y
                resetButton!.position.y = upDown!.position.y
                pausedB!.position.y = upDown!.position.y
                pausedButtonShade!.position.y = upDown!.position.y - 8
                pausedButton!.position.y = upDown!.position.y
                UpDownButtonShade!.position.y = upDown!.position.y - 8
                UpDownButton!.position.y = upDown!.position.y
                
            }
       
        }
        
        if  mainMenuScene.iPhone11 == true ||  mainMenuScene.iPhone11Pro == true ||  mainMenuScene.iPhone11ProMax == true || mainMenuScene.iPhone12 == true ||  mainMenuScene.iPhone12Pro == true ||  mainMenuScene.iPhone12ProMax == true
        {
            
        reset!.position.x = cameraNode.position.x - 587
        
        resetButtonShade!.position.x = cameraNode.position.x - 587
        
        resetButton!.position.x = cameraNode.position.x - 587
        
        pausedB!.position.x = cameraNode.position.x - 477
        
        pausedButtonShade!.position.x = cameraNode.position.x - 477
        
        pausedButton!.position.x = cameraNode.position.x - 477
        
        UpDownButtonShade!.position.x = cameraNode.position.x + 300
            
        UpDownButton!.position.x = cameraNode.position.x + 300
            
        upDown!.position.x = cameraNode.position.x + 300
            
        
            
            if buttonsDown == true {
                
                upDown!.position.y = cameraNode.position.y + 236
                resetButtonShade!.position.y = cameraNode.position.y + 228
                reset!.position.y = cameraNode.position.y + 236
                resetButton!.position.y = cameraNode.position.y + 236
                pausedB!.position.y = cameraNode.position.y + 236
                pausedButtonShade!.position.y = cameraNode.position.y + 228
                pausedButton!.position.y = cameraNode.position.y + 236
                UpDownButtonShade!.position.y = cameraNode.position.y + 228
                UpDownButton!.position.y = cameraNode.position.y + 236
                
            }
            if buttonsDown == false {
                
                resetButtonShade!.position.y = upDown!.position.y - 8
                reset!.position.y = upDown!.position.y
                resetButton!.position.y = upDown!.position.y
                pausedB!.position.y = upDown!.position.y
                pausedButtonShade!.position.y = upDown!.position.y - 8
                pausedButton!.position.y = upDown!.position.y
                UpDownButtonShade!.position.y = upDown!.position.y - 8
                UpDownButton!.position.y = upDown!.position.y
                
            }
        
        
            
        }
        
        
        
    }
    
    
    //MARK: Reset Func
    func resetfunc(){
        
        allowTouch = false
                         
                     darkBackGround!.zPosition = 40
                 
                 
                     
                                 
                                 let darkCover = SKAction.run {
                                     
                                     self.darkBackGround!.position = self.cameraNode.position
                                     
                                 }
                                 
                                 
                                     
                                 
                         let darkBackGetdark = SKAction.fadeAlpha(to: 1, duration: 0.5)
                                 
                         let darkBackGetLight = SKAction.fadeAlpha(to: 0, duration: 0.5)
                                 
                         let wait1 = SKAction.wait(forDuration: 1)
                                 
                         let runtwo = SKAction.run {
                             
                             self.darkBackGround!.zPosition = 30
                             
                             self.allowTouch = true
                             
                            
                            
                             self.reset2!.size.height = 1
                             self.reset2!.size.width = 1
                             self.resetButton2!.size.height = 1
                             self.resetButton2!.size.width = 1
                             self.resetButtonShade2!.size.height = 1
                             self.resetButtonShade2!.size.width = 1
                             
                             self.home!.size.height = 1
                             self.home!.size.width = 1
                             self.homeButton!.size.height = 1
                             self.homeButton!.size.width = 1
                             self.homeButtonShade!.size.height = 1
                             self.homeButtonShade!.size.width = 1
                             
                             self.mainMenu!.size.height = 1
                             self.mainMenu!.size.width = 1
                             self.mainMenuButton!.size.height = 1
                             self.mainMenuButton!.size.width = 1
                             self.mainMenuButtonShade!.size.height = 1
                             self.mainMenuButtonShade!.size.width = 1
                             
                             self.nextLevel!.size.height = 1
                             self.nextLevel!.size.width = 1
                             self.nextLevelButton!.size.height = 1
                             self.nextLevelButton!.size.width = 1
                             self.nextLevelButtonShade!.size.height = 1
                             self.nextLevelButtonShade!.size.width = 1
                             
                            
                             
                         }
                         
                         
                         
                         
                                 
                                 let runone = SKAction.run {
                                     
                                     self.oneGrid!.alpha = 0.1
                                     self.Star12!.position = CGPoint(x: 0,y: 10000)
                                     self.Star22!.position = CGPoint(x: 0,y: 10000)
                                     self.Star32!.position = CGPoint(x: 0,y: 10000)
                                     
                                     self.StarSpot12!.position = CGPoint(x: 0,y: 10000)
                                     self.StarSpot22!.position = CGPoint(x: 0,y: 10000)
                                     self.StarSpot32!.position = CGPoint(x: 0,y: 10000)
                                     
                                     
                                     self.darkBackGround2!.position = CGPoint(x: 0,y: 10000)
                                     
                                     self.reset2!.position = CGPoint(x: 0, y: 10000)
        
                                     self.home!.position = CGPoint(x: 0, y: 10000)
                                     
                                     self.mainMenu!.position = CGPoint(x: 0, y: 10000)
                                     
                                     self.nextLevel!.position = CGPoint(x: 0, y: 10000)
                                     
                                     self.player!.position = CGPoint(x: -385, y: -129)
                                 
                                     self.allowStarSpawn1 = false
                                     self.allowStarSpawn2 = false
                                     self.allowStarSpawn3 = false
                                     
                                     self.allowStarSpot2 = true
                                     
                                     self.physicsWorld.speed = 1
                                     
                                     self.resetpressed3 = false
                                     self.resetpressed2 = false
                                     self.resetpressed1 = false
                                     self.homepressed = false
                                     self.mainMenupressed = false
                                     self.nextLevelpressed = false
                                     
                                     self.pausedpressed2 = false
                                     
                                     self.onGround = true
                                     self.touchingRight = false
                                     self.touchingLeft = false
                                     self.touchingWall = false
                                     self.touchingRamp = false
                                     self.touchingFloor = false
                                 
                                     self.resumepressed = false
                                     
                                     self.rampInOneRampGrid = false
                                     self.rampInOneRampGrid2 = false
                                 
                                     self.wallInOneLeftWallGrid = false
                                     self.wallInOneLeftWallGrid2 = false
                                     self.wallInOneRightWallGrid = false
                                     self.wallInOneRightWallGrid2 = false
                                 
                                     self.floorInOneTopFloorGrid = false
                                     self.floorInOneTopfloorGrid2 = false
                                     self.floorInOneBottomFloorGrid = false
                                     self.floorInOneBottomfloorGrid2 = false
                                 
                                     self.rampeffectsAllowed = true
                                     self.walleffectsAllowed = true
                                     self.flooreffectsAllowed = true
                                 
                                     self.allowResetGrow = true
                                     self.allowHomeGrow = true
                                     self.allowMainMenuGrow = true
                                     self.allowNextLevelGrow = true
                                     
                                     self.allowLightBack = true

                                     self.topBarDown = true
                                 
                                     self.oneGridInLeft = false
                                     self.oneGridInRight = false
                                 
                                     self.lightBackDown = false
                                     
                                    self.passedFinishLine = false
                                    
                                    
                                    
                                    self.buttonsDown = true
                             
                                     self.wall!.physicsBody?.isDynamic = false
                                     self.wall!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
                                     self.ramp!.physicsBody?.isDynamic = false
                                     self.ramp!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
                                     self.floor!.physicsBody?.isDynamic = false
                                     self.floor!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
                                     
                                     
                                     self.Star12!.size.height = 500
                                     self.Star12!.size.width = 500
                                     self.Star22!.size.height = 500
                                     self.Star22!.size.width = 500
                                     self.Star32!.size.height = 500
                                     self.Star32!.size.width = 500
                                     
                                    
                                    if level1.haveStar12 == false || level1.haveStar12 == nil{
                                        if HomeScene.level1HaveStar1 != true{
                                            self.haveStar1 = false
                                            self.Star1!.position = CGPoint(x: -1040, y: -80)
                                            self.Star1!.size = CGSize(width: 72, height: 72)
                                            self.Star1!.zPosition = -4
                                            self.StarShade1!.zPosition = -5
                                            self.StarShade1!.position = CGPoint(x: -1040, y: -88)
                                            self.StarShade1!.size = CGSize(width: 72, height: 72)
                                            self.name1!.position = self.Star1!.position
                                        }
                                    }
                                 
                                    if level1.haveStar22 == false || level1.haveStar22 == nil{
                                        if HomeScene.level1HaveStar2 != true{
                                            self.haveStar2 = false
                                            self.Star2!.position = CGPoint(x: 80, y: 80)
                                            self.Star2!.size = CGSize(width: 72, height: 72)
                                            self.Star2!.zPosition = -4
                                            self.StarShade2!.zPosition = -5
                                            self.StarShade2!.position = CGPoint(x: 80, y: 72)
                                            self.StarShade2!.size = CGSize(width: 72, height: 72)
                                            self.name2!.position = self.Star2!.position
                                        }
                                    }
                                    if level1.haveStar32 == false || level1.haveStar32 == nil{
                                        if HomeScene.level1HaveStar3 != true{
                                            self.haveStar3 = false
                                            self.Star3!.position = CGPoint(x: 240, y: -80)
                                            self.Star3!.size = CGSize(width: 72, height: 72)
                                            self.Star3!.zPosition = -4
                                            self.StarShade3!.zPosition = -5
                                            self.StarShade3!.position = CGPoint(x: 240, y: -88)
                                            self.StarShade3!.size = CGSize(width: 72, height: 72)
                                            self.name3!.position = self.Star3!.position
                                        }
                                    }
                                
                                     
                                     
                             
                                     
                                 }
                                 
                                 let sequence = SKAction.sequence([darkCover, darkBackGetdark, wait1, runone, darkCover, wait1, darkBackGetLight, runtwo])
                                 
                                 
                                 darkBackGround?.run(sequence)
        
    }
    
    
    
    
    //MARK: Update
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        if finishLine!.contains(player!.position) && onGround == false{
            
            player!.physicsBody?.applyImpulse(CGVector(dx: 2, dy: 0))
            
        }
        
        
        
        if pausedpressed2 == true{
            
            name1!.isPaused = true
            name2!.isPaused = true
            name3!.isPaused = true
            
            endexplosion!.isPaused = true
            
            physicsWorld.speed = 0
            
        }
        if pausedpressed2 == false{
            
            name1!.isPaused = false
            name2!.isPaused = false
            name3!.isPaused = false
            
            endexplosion!.isPaused = false
            
            physicsWorld.speed = 1
            
        }
        
        if finishLine!.contains(player!.position){
            
            Star12!.size.height = 500
            Star12!.size.width = 500
            Star22!.size.height = 500
            Star22!.size.width = 500
            Star32!.size.height = 500
            Star32!.size.width = 500
            
            allowStarSpawn1 = false
            allowStarSpawn2 = false
            allowStarSpawn3 = false
            
            allowStarparticles1 = true
            allowStarparticles2 = true
            allowStarparticles3 = true
        }
        
        
        if pausedpressed2 == false && passedFinishLine == false{
        darkBackGround2!.alpha = 0
        }
        
    
            
            
            
            
                
                if onGround == true && passedFinishLine == true && finishLineSection!.contains(player!.position){
                
                player!.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 25))
                    onGround = false
                    
                }
        

        if passedFinishLine == false {
        
            
            
            
            if Star1!.contains(player!.position){
                
                StarNoise()
                
                let starShrink = SKAction.resize(toWidth: 1, height: 1, duration: 0.05)
                
                let gotoSpot = SKAction.run {
                    
                    self.Star1!.position = self.StarSpot1!.position
                    
                    self.StarShade1!.position.x = self.StarSpot1!.position.x
                    self.StarShade1!.position.y = self.StarSpot1!.position.y - 8

                    self.Star1!.zPosition = -2
                    self.StarShade1!.zPosition = -3
                    
                    self.haveStar1 = true
                    
                    self.name1!.position = CGPoint(x: 999999, y: 999999)
                }
                
                let particle = SKAction.run {
                    
                    self.starexplosionEmitter(position: self.Star1!.position)
                    
                }
                let wait1  = SKAction.wait(forDuration: 0.2)
                
                let starGrow = SKAction.resize(toWidth: StarSpot1!.size.width * 50, height: StarSpot1!.size.height * 50, duration: 0.1)
                
                let sequence = SKAction.sequence([starShrink, gotoSpot, wait1, starGrow, particle])
                
                Star1!.run(sequence)
                StarShade1!.run(sequence)
                
    
            }
            
            if Star2!.contains(player!.position){
                        
                StarNoise()
                
                        let starShrink = SKAction.resize(toWidth: 1, height: 1, duration: 0.05)
                        
                        let gotoSpot = SKAction.run {
                            
                            self.Star2!.position = self.StarSpot2!.position
                            
                            self.StarShade2!.position.x = self.StarSpot2!.position.x
                            self.StarShade2!.position.y = self.StarSpot2!.position.y - 8

                            self.Star2!.zPosition = -2
                            self.StarShade2!.zPosition = -3
                            
                            self.haveStar2 = true
                            
                            self.name2!.position = CGPoint(x: 999999, y: 999999)
                        }
                        
                        let particle = SKAction.run {
                            
                            self.starexplosionEmitter(position: self.Star2!.position)
                            
                        }
                        let wait1  = SKAction.wait(forDuration: 0.2)
                        
                        let starGrow = SKAction.resize(toWidth: StarSpot2!.size.width * 50, height: StarSpot2!.size.height * 50, duration: 0.1)
                        
                        let sequence = SKAction.sequence([starShrink, gotoSpot, wait1, starGrow, particle])
                        
                        Star2!.run(sequence)
                        StarShade2!.run(sequence)
                        
            
                    }
            
            if Star3!.contains(player!.position){
                        
                        StarNoise()
                        
                        let starShrink = SKAction.resize(toWidth: 1, height: 1, duration: 0.05)
                        
                        let gotoSpot = SKAction.run {
                            
                            self.Star3!.position = self.StarSpot3!.position
                            
                            self.StarShade3!.position.x = self.StarSpot3!.position.x
                            self.StarShade3!.position.y = self.StarSpot3!.position.y - 8
                            
                            self.Star3!.zPosition = -2
                            self.StarShade3!.zPosition = -3

                            self.haveStar3 = true
                            
                            self.name3!.position = CGPoint(x: 999999, y: 999999)
                        }
                        
                let particle = SKAction.run {
                    
                    self.starexplosionEmitter(position: self.Star3!.position)
                    
                }
                        let wait1  = SKAction.wait(forDuration: 0.2)
                        
                        let starGrow = SKAction.resize(toWidth: StarSpot2!.size.width * 50, height: StarSpot2!.size.height * 50, duration: 0.1)
                        
                        let sequence = SKAction.sequence([starShrink, gotoSpot, wait1, starGrow, particle])
                        
                        Star3!.run(sequence)
                        StarShade3!.run(sequence)
                        
            
                    }
            
            
        if finishLine!.contains(player!.position) {
            
            passedFinishLine = true
            HomeScene.level1Completed = true
            passedFinishLine2 = true
            
            level1.haveStar12 = haveStar1
            level1.haveStar22 = haveStar2
            level1.haveStar32 = haveStar3
            
        
        }
        
        
            
            
            

            
            
            
             
                
                if touchingWall == false || touchingFloor == false || touchingRamp == false{
                
                if touchingRight == true {
                    
                if onGround == true {
                
                    if onGround == true {
                        
                        player!.physicsBody?.applyImpulse(CGVector(dx: 25, dy: 40))
                        onGround = false
                        
                    }
                    
                    
                    onGround2 = false
                    
                    }
                }
            }
            
            
            
            if touchingWall == false || touchingFloor == false || touchingRamp == false {
                
            if touchingLeft == true {
                
                if onGround == true {
                    
                    if onGround == true {
                        
                        player!.physicsBody?.applyImpulse(CGVector(dx: -25, dy: 40))
                        onGround = false
                        
                    }
                    
                    onGround = false
                    onGround2 = false
                    
                }
                }
            }
        }
        
        if wallInOneLeftWallGrid == false && wallInOneRightWallGrid == false {
        
            if topBar!.contains(wall!.position){
            
                let wallShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
            
                wall!.run(wallShrink)
                wallShadow!.run(wallShrink)
                
            }
        }
        
        if floorInOneBottomFloorGrid == false && floorInOneTopFloorGrid == false {
        
            if topBar!.contains(floor!.position){
            
                let floorShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
            
                floor!.run(floorShrink)
                 floorShadow!.run(floorShrink)
            }
        }
        
        if topBar!.contains(ramp!.position){
            
            let rampShrink = SKAction.resize(toWidth: 20, height: 110, duration: 0.3)
            
            ramp!.run(rampShrink)
            rampShadow!.run(rampShrink)
            
            }
        
        if leftTouch!.contains(oneGrid!.position){
            
            oneGridInLeft = true
            
        } else {
            
            oneGridInLeft = false
        }
        
        if rightTouch!.contains(oneGrid!.position){
            
            oneGridInRight = true
            
        } else {
            
            oneGridInRight = false
        }
        
        if self.isPaused == true{
            
            name1!.isPaused = true
            name2!.isPaused = true
            name3!.isPaused = true
                
            endexplosion!.isPaused = true
                  
            physicsWorld.speed = 0
            
            pausedpressed2 = true
                
            allowTouch = false
                
            
                
                lightBack2!.position.y = cameraNode.position.y + lightBack2!.size.height
                lightBack2!.position.x = cameraNode.position.x
                
                
                
            lightBack2!.position = cameraNode.position
            
                
                
            darkBackGround!.alpha = 0.7
                
            darkBackGround!.zPosition = 30
                
            darkBackGround!.position = cameraNode.position
            
        }
        
        if HomeScene.level1HaveStar1 == true{
            
            Star1!.position = StarSpot1!.position
            Star1!.size = StarSpot1!.size
            StarShade1!.size = StarSpot3!.size
            
        }
        
        if HomeScene.level1HaveStar2 == true{
            
            Star2!.position = StarSpot2!.position
            Star2!.size = StarSpot2!.size
            StarShade2!.size = StarSpot3!.size
            
        }
        
        if HomeScene.level1HaveStar3 == true{
            
            Star3!.position = StarSpot3!.position
            Star3!.size = StarSpot3!.size
            StarShade3!.size = StarSpot3!.size
            
        }
        
        
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

