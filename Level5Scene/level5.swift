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
import SceneKit
import AVFoundation


class level5: SKScene, SKPhysicsContactDelegate {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    
    
    var prevScoreCalcTime:TimeInterval = 0
    var prevScoreCalcTime2:TimeInterval = 0
    
    var location: CGPoint?
    
    let cameraNode = SKCameraNode()
    
    weak var player : SKSpriteNode?
    weak var playerShadow : SKSpriteNode?
    
    
    
    weak var bounce : SKSpriteNode?
    weak var move : SKSpriteNode?
    weak var spinOne : SKSpriteNode?
    weak var spinOneShade : SKSpriteNode?
    weak var spinTwo : SKSpriteNode?
    weak var spinTwoShade : SKSpriteNode?
    
    
    weak var ramp : SKSpriteNode?
    weak var rampShadow : SKSpriteNode?
    weak var wall : SKSpriteNode?
    weak var wallShadow : SKSpriteNode?
    weak var floor : SKSpriteNode?
    weak var floorShadow : SKSpriteNode?
    
    weak var realground : SKSpriteNode?
    
    weak var ramp2 : SKSpriteNode?
    weak var rampShadow2 : SKSpriteNode?
    weak var wall2 : SKSpriteNode?
    weak var wallShadow2 : SKSpriteNode?
    weak var floor2 : SKSpriteNode?
    weak var floorShadow2 : SKSpriteNode?
    
    weak var ramp3 : SKSpriteNode?
    weak var rampShadow3 : SKSpriteNode?
    weak var wall3 : SKSpriteNode?
    weak var wallShadow3 : SKSpriteNode?
    weak var floor3 : SKSpriteNode?
    weak var floorShadow3 : SKSpriteNode?
    
    weak var ramp4 : SKSpriteNode?
    weak var rampShadow4 : SKSpriteNode?
    weak var wall4 : SKSpriteNode?
    weak var wallShadow4 : SKSpriteNode?
    weak var floor4 : SKSpriteNode?
    weak var floorShadow4 : SKSpriteNode?
    
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
    
    weak var twoGrid : SKSpriteNode?
    weak var twoRampGrid : SKSpriteNode?
    weak var twoTopFloorGrid : SKSpriteNode?
    weak var twoBottomFloorGrid : SKSpriteNode?
    weak var twoLeftWallGrid : SKSpriteNode?
    weak var twoRightWallGrid : SKSpriteNode?
    
    weak var threeGrid : SKSpriteNode?
    weak var threeRampGrid : SKSpriteNode?
    weak var threeTopFloorGrid : SKSpriteNode?
    weak var threeBottomFloorGrid : SKSpriteNode?
    weak var threeLeftWallGrid : SKSpriteNode?
    weak var threeRightWallGrid : SKSpriteNode?
    
    weak var fourGrid : SKSpriteNode?
    weak var fourRampGrid : SKSpriteNode?
    weak var fourTopFloorGrid : SKSpriteNode?
    weak var fourBottomFloorGrid : SKSpriteNode?
    weak var fourLeftWallGrid : SKSpriteNode?
    weak var fourRightWallGrid : SKSpriteNode?
    
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
    
    weak var spike2 : SKSpriteNode?

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
    weak var moveshade : SKSpriteNode?
    
    weak var topBarShade : SKSpriteNode?
    
    weak var turretOne : SKSpriteNode?
    weak var turretOneShade : SKSpriteNode?
    weak var turretTwo : SKSpriteNode?
    weak var turretTwoShade : SKSpriteNode?
    
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
    
    var touchingWall2 = false
    var touchingRamp2 = false
    var touchingFloor2 = false
    
    var touchingWall3 = false
    var touchingRamp3 = false
    var touchingFloor3 = false
    
    var touchingWall4 = false
    var touchingRamp4 = false
    var touchingFloor4 = false
    
    var allowResetGrow = true
    var allowHomeGrow = true
    var allowMainMenuGrow = true
    var allowNextLevelGrow = true
    
    var allowStarSpot2 = true
    var allowLightBack = true
    var lightBackDown = false
    var lightBackDown2 = false
    
    //
    
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
    
    var rampInTwoRampGrid = false
    var rampInTwoRampGrid2 = false
    
    var wallInTwoLeftWallGrid = false
    var wallInTwoLeftWallGrid2 = false
    var wallInTwoRightWallGrid = false
    var wallInTwoRightWallGrid2 = false
    
    var floorInTwoTopFloorGrid = false
    var floorInTwoTopfloorGrid2 = false
    var floorInTwoBottomFloorGrid = false
    var floorInTwoBottomfloorGrid2 = false
    
    var rampInThreeRampGrid = false
    var rampInThreeRampGrid2 = false
    
    var wallInThreeLeftWallGrid = false
    var wallInThreeLeftWallGrid2 = false
    var wallInThreeRightWallGrid = false
    var wallInThreeRightWallGrid2 = false
    
    var floorInThreeTopFloorGrid = false
    var floorInThreeTopfloorGrid2 = false
    var floorInThreeBottomFloorGrid = false
    var floorInThreeBottomfloorGrid2 = false
    
    var rampInFourRampGrid = false
    var rampInFourRampGrid2 = false
    
    var wallInFourLeftWallGrid = false
    var wallInFourLeftWallGrid2 = false
    var wallInFourRightWallGrid = false
    var wallInFourRightWallGrid2 = false
    
    var floorInFourTopFloorGrid = false
    var floorInFourTopfloorGrid2 = false
    var floorInFourBottomFloorGrid = false
    var floorInFourBottomfloorGrid2 = false
 
    //
    
    var ramp2InOneRampGrid = false
    var ramp2InOneRampGrid2 = false
    
    var wall2InOneLeftWallGrid = false
    var wall2InOneLeftWallGrid2 = false
    var wall2InOneRightWallGrid = false
    var wall2InOneRightWallGrid2 = false
    
    var floor2InOneTopFloorGrid = false
    var floor2InOneTopfloorGrid2 = false
    var floor2InOneBottomFloorGrid = false
    var floor2InOneBottomfloorGrid2 = false
    
    var ramp2InTwoRampGrid = false
    var ramp2InTwoRampGrid2 = false
    
    var wall2InTwoLeftWallGrid = false
    var wall2InTwoLeftWallGrid2 = false
    var wall2InTwoRightWallGrid = false
    var wall2InTwoRightWallGrid2 = false
    
    var floor2InTwoTopFloorGrid = false
    var floor2InTwoTopfloorGrid2 = false
    var floor2InTwoBottomFloorGrid = false
    var floor2InTwoBottomfloorGrid2 = false
    
    var ramp2InThreeRampGrid = false
    var ramp2InThreeRampGrid2 = false
    
    var wall2InThreeLeftWallGrid = false
    var wall2InThreeLeftWallGrid2 = false
    var wall2InThreeRightWallGrid = false
    var wall2InThreeRightWallGrid2 = false
    
    var floor2InThreeTopFloorGrid = false
    var floor2InThreeTopfloorGrid2 = false
    var floor2InThreeBottomFloorGrid = false
    var floor2InThreeBottomfloorGrid2 = false
    
    var ramp2InFourRampGrid = false
    var ramp2InFourRampGrid2 = false
    
    var wall2InFourLeftWallGrid = false
    var wall2InFourLeftWallGrid2 = false
    var wall2InFourRightWallGrid = false
    var wall2InFourRightWallGrid2 = false
    
    var floor2InFourTopFloorGrid = false
    var floor2InFourTopfloorGrid2 = false
    var floor2InFourBottomFloorGrid = false
    var floor2InFourBottomfloorGrid2 = false
    
    //
    
    var ramp3InOneRampGrid = false
    var ramp3InOneRampGrid2 = false
    
    var wall3InOneLeftWallGrid = false
    var wall3InOneLeftWallGrid2 = false
    var wall3InOneRightWallGrid = false
    var wall3InOneRightWallGrid2 = false
    
    var floor3InOneTopFloorGrid = false
    var floor3InOneTopfloorGrid2 = false
    var floor3InOneBottomFloorGrid = false
    var floor3InOneBottomfloorGrid2 = false
    
    var ramp3InTwoRampGrid = false
    var ramp3InTwoRampGrid2 = false
    
    var wall3InTwoLeftWallGrid = false
    var wall3InTwoLeftWallGrid2 = false
    var wall3InTwoRightWallGrid = false
    var wall3InTwoRightWallGrid2 = false
    
    var floor3InTwoTopFloorGrid = false
    var floor3InTwoTopfloorGrid2 = false
    var floor3InTwoBottomFloorGrid = false
    var floor3InTwoBottomfloorGrid2 = false
    
    var ramp3InThreeRampGrid = false
    var ramp3InThreeRampGrid2 = false
    
    var wall3InThreeLeftWallGrid = false
    var wall3InThreeLeftWallGrid2 = false
    var wall3InThreeRightWallGrid = false
    var wall3InThreeRightWallGrid2 = false
    
    var floor3InThreeTopFloorGrid = false
    var floor3InThreeTopfloorGrid2 = false
    var floor3InThreeBottomFloorGrid = false
    var floor3InThreeBottomfloorGrid2 = false

    var ramp3InFourRampGrid = false
    var ramp3InFourRampGrid2 = false
    
    var wall3InFourLeftWallGrid = false
    var wall3InFourLeftWallGrid2 = false
    var wall3InFourRightWallGrid = false
    var wall3InFourRightWallGrid2 = false
    
    var floor3InFourTopFloorGrid = false
    var floor3InFourTopfloorGrid2 = false
    var floor3InFourBottomFloorGrid = false
    var floor3InFourBottomfloorGrid2 = false
    
    //
    
    var ramp4InOneRampGrid = false
    var ramp4InOneRampGrid2 = false
    
    var wall4InOneLeftWallGrid = false
    var wall4InOneLeftWallGrid2 = false
    var wall4InOneRightWallGrid = false
    var wall4InOneRightWallGrid2 = false
    
    var floor4InOneTopFloorGrid = false
    var floor4InOneTopfloorGrid2 = false
    var floor4InOneBottomFloorGrid = false
    var floor4InOneBottomfloorGrid2 = false
    
    var ramp4InTwoRampGrid = false
    var ramp4InTwoRampGrid2 = false
    
    var wall4InTwoLeftWallGrid = false
    var wall4InTwoLeftWallGrid2 = false
    var wall4InTwoRightWallGrid = false
    var wall4InTwoRightWallGrid2 = false
    
    var floor4InTwoTopFloorGrid = false
    var floor4InTwoTopfloorGrid2 = false
    var floor4InTwoBottomFloorGrid = false
    var floor4InTwoBottomfloorGrid2 = false
    
    var ramp4InThreeRampGrid = false
    var ramp4InThreeRampGrid2 = false
    
    var wall4InThreeLeftWallGrid = false
    var wall4InThreeLeftWallGrid2 = false
    var wall4InThreeRightWallGrid = false
    var wall4InThreeRightWallGrid2 = false
    
    var floor4InThreeTopFloorGrid = false
    var floor4InThreeTopfloorGrid2 = false
    var floor4InThreeBottomFloorGrid = false
    var floor4InThreeBottomfloorGrid2 = false

    var ramp4InFourRampGrid = false
    var ramp4InFourRampGrid2 = false
    
    var wall4InFourLeftWallGrid = false
    var wall4InFourLeftWallGrid2 = false
    var wall4InFourRightWallGrid = false
    var wall4InFourRightWallGrid2 = false
    
    var floor4InFourTopFloorGrid = false
    var floor4InFourTopfloorGrid2 = false
    var floor4InFourBottomFloorGrid = false
    var floor4InFourBottomfloorGrid2 = false
    
    //
    
    var rampeffectsAllowed = true
    var walleffectsAllowed = true
    var flooreffectsAllowed = true
    
    var ramp2effectsAllowed = true
    var wall2effectsAllowed = true
    var floor2effectsAllowed = true
    
    var ramp3effectsAllowed = true
    var wall3effectsAllowed = true
    var floor3effectsAllowed = true
    
    var ramp4effectsAllowed = true
    var wall4effectsAllowed = true
    var floor4effectsAllowed = true
    
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
        
        if skinsScene.currentSkin == nil{
            
            skinsScene.currentSkin = String("Player")
            
        }
        
        
        
        self.lastUpdateTime = 0
        
        self.physicsWorld.contactDelegate = self
        
        
        if HomeScene.level5HaveStar1 != nil{
        haveStar1 = HomeScene.level5HaveStar1
        }
        if HomeScene.level5HaveStar2 != nil{
        haveStar2 = HomeScene.level5HaveStar2
        }
        if HomeScene.level5HaveStar3 != nil{
        haveStar3 = HomeScene.level5HaveStar3
        }
        
        self.spinOne = self.childNode(withName: "spinOne") as? SKSpriteNode
        self.spinOneShade = self.childNode(withName: "spinOneShade") as? SKSpriteNode
        self.spinTwo = self.childNode(withName: "spinTwo") as? SKSpriteNode
        self.spinTwoShade = self.childNode(withName: "spinTwoShade") as? SKSpriteNode
        
        
        self.moveshade = self.childNode(withName: "moveShade") as? SKSpriteNode
        
        self.playerShadow = self.childNode(withName: "playerShadow") as? SKSpriteNode
        self.player = self.childNode(withName: "player") as? SKSpriteNode
        
        self.spike2 = self.childNode(withName: "spike2") as? SKSpriteNode
        
        self.ramp = self.childNode(withName: "ramp") as? SKSpriteNode
        self.rampShadow = self.childNode(withName: "rampShadow") as? SKSpriteNode
        self.wall = self.childNode(withName: "wall") as? SKSpriteNode
        self.wallShadow = self.childNode(withName: "wallShadow") as? SKSpriteNode
        self.floor = self.childNode(withName: "floor") as? SKSpriteNode
        self.floorShadow = self.childNode(withName: "floorShadow") as? SKSpriteNode
        
        self.ramp2 = self.childNode(withName: "ramp2") as? SKSpriteNode
        self.rampShadow2 = self.childNode(withName: "rampShadow2") as? SKSpriteNode
        self.wall2 = self.childNode(withName: "wall2") as? SKSpriteNode
        self.wallShadow2 = self.childNode(withName: "wallShadow2") as? SKSpriteNode
        self.floor2 = self.childNode(withName: "floor2") as? SKSpriteNode
        self.floorShadow2 = self.childNode(withName: "floorShadow2") as? SKSpriteNode
        
        self.ramp3 = self.childNode(withName: "ramp3") as? SKSpriteNode
        self.rampShadow3 = self.childNode(withName: "rampShadow3") as? SKSpriteNode
        self.wall3 = self.childNode(withName: "wall3") as? SKSpriteNode
        self.wallShadow3 = self.childNode(withName: "wallShadow3") as? SKSpriteNode
        self.floor3 = self.childNode(withName: "floor3") as? SKSpriteNode
        self.floorShadow3 = self.childNode(withName: "floorShadow3") as? SKSpriteNode
        
        self.ramp4 = self.childNode(withName: "ramp4") as? SKSpriteNode
        self.rampShadow4 = self.childNode(withName: "rampShadow4") as? SKSpriteNode
        self.wall4 = self.childNode(withName: "wall4") as? SKSpriteNode
        self.wallShadow4 = self.childNode(withName: "wallShadow4") as? SKSpriteNode
        self.floor4 = self.childNode(withName: "floor4") as? SKSpriteNode
        self.floorShadow4 = self.childNode(withName: "floorShadow4") as? SKSpriteNode
        
        self.topBar = self.childNode(withName: "topBar") as? SKSpriteNode
        self.ground = self.childNode(withName: "ground") as? SKSpriteNode
        self.realground = self.childNode(withName: "realground") as? SKSpriteNode
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
        
        self.twoGrid = self.childNode(withName: "twoGrid") as? SKSpriteNode
        self.twoRampGrid = self.childNode(withName: "twoRampGrid") as? SKSpriteNode
        self.twoTopFloorGrid = self.childNode(withName: "twoTopFloorGrid") as? SKSpriteNode
        self.twoBottomFloorGrid = self.childNode(withName: "twoBottomFloorGrid") as? SKSpriteNode
        self.twoLeftWallGrid = self.childNode(withName: "twoLeftWallGrid") as? SKSpriteNode
        self.twoRightWallGrid = self.childNode(withName: "twoRightWallGrid") as? SKSpriteNode
        
        self.threeGrid = self.childNode(withName: "threeGrid") as? SKSpriteNode
        self.threeRampGrid = self.childNode(withName: "threeRampGrid") as? SKSpriteNode
        self.threeTopFloorGrid = self.childNode(withName: "threeTopFloorGrid") as? SKSpriteNode
        self.threeBottomFloorGrid = self.childNode(withName: "threeBottomFloorGrid") as? SKSpriteNode
        self.threeLeftWallGrid = self.childNode(withName: "threeLeftWallGrid") as? SKSpriteNode
        self.threeRightWallGrid = self.childNode(withName: "threeRightWallGrid") as? SKSpriteNode
        
        self.fourGrid = self.childNode(withName: "fourGrid") as? SKSpriteNode
        self.fourRampGrid = self.childNode(withName: "fourRampGrid") as? SKSpriteNode
        self.fourTopFloorGrid = self.childNode(withName: "fourTopFloorGrid") as? SKSpriteNode
        self.fourBottomFloorGrid = self.childNode(withName: "fourBottomFloorGrid") as? SKSpriteNode
        self.fourLeftWallGrid = self.childNode(withName: "fourLeftWallGrid") as? SKSpriteNode
        self.fourRightWallGrid = self.childNode(withName: "fourRightWallGrid") as? SKSpriteNode
        
        self.bounce = self.childNode(withName: "bounce") as? SKSpriteNode
        self.move = self.childNode(withName: "move") as? SKSpriteNode
        
        self.turretOne = self.childNode(withName: "turretOne") as? SKSpriteNode
        self.turretOneShade = self.childNode(withName: "turretOneShade") as? SKSpriteNode
        self.turretTwo = self.childNode(withName: "turretTwo") as? SKSpriteNode
        self.turretTwoShade = self.childNode(withName: "turretTwoShade") as? SKSpriteNode
        
        
        player!.texture = SKTexture(imageNamed: skinsScene.currentSkin!)
        
        spike2!.physicsBody?.restitution = 0
        
        player!.physicsBody = SKPhysicsBody(rectangleOf: player!.size)
        player!.physicsBody?.isDynamic = true
        player!.physicsBody?.affectedByGravity = true
        player!.physicsBody?.friction = 1
        player!.physicsBody?.mass = 0.093
        player!.physicsBody?.allowsRotation = false
        player!.physicsBody?.restitution = 0
        
        
        
        
        
        
        
        player!.physicsBody?.categoryBitMask = ColliderType4.player2
        player!.physicsBody?.collisionBitMask = ColliderType4.ground2
        player!.physicsBody?.contactTestBitMask = ColliderType4.ground2
        
        ground!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        ramp!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        wall!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        ramp2!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        wall2!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        ramp3!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        wall3!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        bounce!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        move!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        spinOne!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        spinTwo!.physicsBody?.categoryBitMask = ColliderType4.ground2
        
        spike2!.physicsBody?.categoryBitMask = ColliderType4.spike
        
        
        
        cameraNode.position.x = player!.position.x + 200
        cameraNode.position.y = player!.position.y + 120
        let Wait3 = SKAction.wait(forDuration: 2)
        let Wait4 = SKAction.wait(forDuration: 1)
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
        
        let moveMoveBlockRight = SKAction.moveTo(y: -18, duration: 8)
        let moveMoveBlockLeft = SKAction.moveTo(y: -978, duration: 8)
        
        let moveMoveBlock = SKAction.sequence([Wait4, moveMoveBlockRight, Wait4, moveMoveBlockLeft])
        
        let repeatMoveMoveBlock = SKAction.repeatForever(moveMoveBlock)
        
        move!.run(repeatMoveMoveBlock)
        
        let rotateSpin1 = SKAction.rotate(byAngle: -5, duration: 5)
        let rotateSpin2 = SKAction.rotate(byAngle: -5, duration: 5)
        
        let rotate = SKAction.sequence([rotateSpin1, rotateSpin2])
        
        let repeatRotate = SKAction.repeatForever(rotate)
        
        spinOne!.run(repeatRotate)
        spinTwo!.run(repeatRotate)
        
        
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

        if HomeScene.level5HaveStar1 == true{
            
            Star1!.position = StarSpot1!.position
            Star1!.size = StarSpot1!.size
            StarShade1!.size = StarSpot3!.size
            
        }
        
        if HomeScene.level5HaveStar2 == true{
            
            Star2!.position = StarSpot2!.position
            Star2!.size = StarSpot2!.size
            StarShade2!.size = StarSpot3!.size
            
        }
        
        if HomeScene.level5HaveStar3 == true{
            
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
        
        if contact.bodyA.node?.name == "player"{
            
            firstBody = contact.bodyA
            secondBody = contact.bodyB
            
            
        } else {
            
            firstBody = contact.bodyB
            secondBody = contact.bodyA
            
        }
        
        
        
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "bounce" {
          
            player!.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 100))
            
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
                
                // + 520
                
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
                
                    let moveUpTopbar = SKAction.move(to: CGPoint(x: cameraNode.position.x, y: cameraNode.position.y + 620), duration: 0.5)
                
                    //+ 620
                    
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
            
        }
        if firstBody.node?.name == "player" && secondBody.node?.name == "ramp2" {
            
            onGround = true
            onGround2 = true
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "floor2" {
            
            onGround = true
            onGround2 = true
            
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "ramp3" {
            
            onGround = true
            onGround2 = true
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "floor3" {
            
            onGround = true
            onGround2 = true
            
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "ramp4" {
            
            onGround = true
            onGround2 = true
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "floor4" {
            
            onGround = true
            onGround2 = true
            
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "bounce" {
            
            onGround = true
            onGround2 = true
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "move" {
            
            onGround = true
            onGround2 = true
            
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "spinOne" {
            
            onGround = true
            onGround2 = true
            
        }
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "spinTwo" {
            
            onGround = true
            onGround2 = true
            
        }
        
        
        
        if firstBody.node?.name == "player" && secondBody.node?.name == "spike2" {
            
            
            characterExplodeEmitter(position: CGPoint(x: player!.position.x, y: player!.position.y - (player!.size.height / 2)), rotation: 0)
            player!.physicsBody?.pinned = true
            player?.isHidden = true
            playerShadow?.isHidden = true
            player!.physicsBody?.isDynamic = false
            resetfunc()
            
        }
        
        
        
    }
    
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

            if resetButton2!.contains(location!){
                clicknoise()
                let resetButtonShrink2 = SKAction.resize(toWidth: 113.4, height: 113.4, duration: 0.1)
                let resetShrink2 = SKAction.resize(toWidth: 77.76, height: 77.76, duration: 0.1)
                
                reset2!.run(resetShrink2)
                resetButton2!.run(resetButtonShrink2)
                resetButtonShade2!.run(resetButtonShrink2)
                
                resetpressed2 = true
                
            }
            
            if allowTouch == true{
                
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
                
            if topBar!.contains(ramp2!){
                    
                ramp2!.physicsBody?.isDynamic = false
                    
            }
                
            if topBar!.contains(wall2!){
                    
                wall2!.physicsBody?.isDynamic = false
                    
            }
                
            if topBar!.contains(floor2!){
                    
                floor2!.physicsBody?.isDynamic = false
                    
            }
                
            if topBar!.contains(ramp3!){
                    
                ramp3!.physicsBody?.isDynamic = false
                    
            }
                
            if topBar!.contains(wall3!){
                    
                wall3!.physicsBody?.isDynamic = false
                    
            }
                
            if topBar!.contains(floor3!){
                    
                floor3!.physicsBody?.isDynamic = false
                    
            }
                
                if topBar!.contains(ramp4!){
                        
                    ramp4!.physicsBody?.isDynamic = false
                        
                }
                    
                if topBar!.contains(wall4!){
                        
                    wall4!.physicsBody?.isDynamic = false
                        
                }
                    
                if topBar!.contains(floor4!){
                        
                    floor4!.physicsBody?.isDynamic = false
                        
                }
            if rampInOneRampGrid2 == true || rampInTwoRampGrid2 == true || rampInThreeRampGrid2 == true || rampInFourRampGrid2 == true {
                
                rampeffectsAllowed = false
                
            }
            
            if wallInOneLeftWallGrid2 == true || wallInOneRightWallGrid2 == true || wallInTwoLeftWallGrid2 == true || wallInTwoRightWallGrid2 == true || wallInThreeLeftWallGrid2 == true || wallInThreeRightWallGrid2 == true || wallInFourLeftWallGrid2 == true || wallInFourRightWallGrid2 == true {
                
                walleffectsAllowed = false
                
            }
            
            if floorInOneTopfloorGrid2 == true || floorInOneBottomfloorGrid2 == true || floorInTwoTopfloorGrid2 == true || floorInTwoBottomfloorGrid2 == true ||
            floorInThreeTopfloorGrid2 == true || floorInThreeBottomfloorGrid2 == true || floorInFourTopfloorGrid2 == true || floorInFourBottomfloorGrid2 == true{
                
                flooreffectsAllowed = false
            }
                
                
            if ramp2InOneRampGrid2 == true || ramp2InTwoRampGrid2 == true || ramp2InThreeRampGrid2 == true || ramp2InFourRampGrid2 == true {
                
                ramp2effectsAllowed = false
                
            }
                
            if wall2InOneLeftWallGrid2 == true || wall2InOneRightWallGrid2 == true || wall2InTwoLeftWallGrid2 == true || wall2InTwoRightWallGrid2 == true || wall2InThreeLeftWallGrid2 == true || wall2InThreeRightWallGrid2 == true || wall2InFourLeftWallGrid2 == true || wall2InFourRightWallGrid2 == true{
                    
                wall2effectsAllowed = false
            }
                
            if floor2InOneTopfloorGrid2 == true || floor2InOneBottomfloorGrid2 == true || floor2InTwoTopfloorGrid2 == true || floor2InTwoBottomfloorGrid2 == true ||
                floor2InThreeTopfloorGrid2 == true || floor2InThreeBottomfloorGrid2 == true || floor2InFourTopfloorGrid2 == true || floor2InFourBottomfloorGrid2 == true{
                    
                floor2effectsAllowed = false
            }
                
            if ramp3InOneRampGrid2 == true || ramp3InTwoRampGrid2 == true || ramp3InThreeRampGrid2 == true || ramp3InFourRampGrid2 == true {
                
                ramp3effectsAllowed = false
                
            }
                
            if wall3InOneLeftWallGrid2 == true || wall3InOneRightWallGrid2 == true || wall3InTwoLeftWallGrid2 == true || wall3InTwoRightWallGrid2 == true || wall3InThreeLeftWallGrid2 == true || wall3InThreeRightWallGrid2 == true || wall3InFourLeftWallGrid2 == true || wall3InFourRightWallGrid2 == true{
                    
                wall3effectsAllowed = false
            }
                
            if floor3InOneTopfloorGrid2 == true || floor3InOneBottomfloorGrid2 == true || floor3InTwoTopfloorGrid2 == true || floor3InTwoBottomfloorGrid2 == true ||
                floor3InThreeTopfloorGrid2 == true || floor3InThreeBottomfloorGrid2 == true || floor3InFourTopfloorGrid2 == true || floor3InFourBottomfloorGrid2 == true{
                
                floor3effectsAllowed = false
                
            }
                
                if ramp4InOneRampGrid2 == true || ramp4InTwoRampGrid2 == true || ramp4InThreeRampGrid2 == true || ramp4InFourRampGrid2 == true {
                    
                    ramp4effectsAllowed = false
                    
                }
                    
                if wall4InOneLeftWallGrid2 == true || wall4InOneRightWallGrid2 == true || wall4InTwoLeftWallGrid2 == true || wall4InTwoRightWallGrid2 == true || wall4InThreeLeftWallGrid2 == true || wall4InThreeRightWallGrid2 == true || wall4InFourLeftWallGrid2 == true || wall4InFourRightWallGrid2 == true{
                        
                    wall4effectsAllowed = false
                }
                    
                if floor4InOneTopfloorGrid2 == true || floor4InOneBottomfloorGrid2 == true || floor4InTwoTopfloorGrid2 == true || floor4InTwoBottomfloorGrid2 == true || floor4InThreeTopfloorGrid2 == true || floor4InThreeBottomfloorGrid2 == true || floor4InFourTopfloorGrid2 == true || floor4InFourBottomfloorGrid2 == true{
                    
                    floor4effectsAllowed = false
                    
                }
            if wall!.contains(location!) {
                
                if wallInOneRightWallGrid == false && wallInOneLeftWallGrid == false && wallInTwoRightWallGrid == false && wallInTwoLeftWallGrid == false && wallInThreeRightWallGrid == false && wallInThreeLeftWallGrid == false && wallInFourRightWallGrid == false && wallInFourLeftWallGrid == false{
                
                touchingWall = true
                    
                }
            }
            
            if ramp!.contains(location!) {
                
                if rampInOneRampGrid == false && rampInTwoRampGrid == false && rampInThreeRampGrid == false && rampInFourRampGrid == false{
                
                    touchingRamp = true
                    
                }
            }
            
            if floor!.contains(location!) {
                
                if floorInOneBottomFloorGrid == false && floorInOneTopFloorGrid == false && floorInTwoBottomFloorGrid == false && floorInTwoTopFloorGrid == false && floorInThreeBottomFloorGrid == false && floorInThreeTopFloorGrid == false && floorInFourBottomFloorGrid == false && floorInFourTopFloorGrid == false{
                    
                    touchingFloor = true
                    
                }
            }
                
            if wall2!.contains(location!) {
                    
                if wall2InOneRightWallGrid == false && wall2InOneLeftWallGrid == false && wall2InTwoRightWallGrid == false && wall2InTwoLeftWallGrid == false && wall2InThreeRightWallGrid == false && wall2InThreeLeftWallGrid == false && wall2InFourRightWallGrid == false && wall2InFourLeftWallGrid == false{
                    
                    touchingWall2 = true
                        
                }
            }
                
            if ramp2!.contains(location!) {
                    
                if ramp2InOneRampGrid == false && ramp2InTwoRampGrid == false && ramp2InThreeRampGrid == false && ramp2InFourRampGrid == false{
                    
                    touchingRamp2 = true
                    
                }
            }
                
            if floor2!.contains(location!) {
                    
                if floor2InOneBottomFloorGrid == false && floor2InOneTopFloorGrid == false && floor2InTwoBottomFloorGrid == false && floor2InTwoTopFloorGrid == false && floor2InThreeBottomFloorGrid == false && floor2InThreeTopFloorGrid == false && floor2InFourBottomFloorGrid == false && floor2InFourTopFloorGrid == false {
                        
                        touchingFloor2 = true
                }
            }
                
            if wall3!.contains(location!) {
                    
                if wall3InOneRightWallGrid == false && wall3InOneLeftWallGrid == false && wall3InTwoRightWallGrid == false && wall3InTwoLeftWallGrid == false && wall3InThreeRightWallGrid == false && wall3InThreeLeftWallGrid == false && wall3InFourRightWallGrid == false && wall3InFourLeftWallGrid == false{
                    
                    touchingWall3 = true
                        
                }
            }
                
            if ramp3!.contains(location!) {
                    
                if ramp3InOneRampGrid == false && ramp3InTwoRampGrid == false && ramp3InThreeRampGrid == false && ramp3InFourRampGrid == false{
                    
                    touchingRamp3 = true
                    
                }
            }
                
            if floor3!.contains(location!) {
                    
                if floor3InOneBottomFloorGrid == false && floor3InOneTopFloorGrid == false && floor3InTwoBottomFloorGrid == false && floor3InTwoTopFloorGrid == false && floor3InThreeBottomFloorGrid == false && floor3InThreeTopFloorGrid == false && floor3InFourBottomFloorGrid == false && floor3InFourTopFloorGrid == false{
                        
                        touchingFloor3 = true
                }
            }
                
                if wall4!.contains(location!) {
                        
                    if wall4InOneRightWallGrid == false && wall4InOneLeftWallGrid == false && wall4InTwoRightWallGrid == false && wall4InTwoLeftWallGrid == false && wall4InThreeRightWallGrid == false && wall4InThreeLeftWallGrid == false && wall4InFourRightWallGrid == false && wall4InFourLeftWallGrid == false{
                        
                        touchingWall4 = true
                            
                    }
                }
                    
                if ramp4!.contains(location!) {
                        
                    if ramp4InOneRampGrid == false && ramp4InTwoRampGrid == false && ramp4InThreeRampGrid == false && ramp4InFourRampGrid == false{
                        
                        touchingRamp4 = true
                        
                    }
                }
                    
                if floor4!.contains(location!) {
                        
                    if floor4InOneBottomFloorGrid == false && floor4InOneTopFloorGrid == false && floor4InTwoBottomFloorGrid == false && floor4InTwoTopFloorGrid == false && floor4InThreeBottomFloorGrid == false && floor4InThreeTopFloorGrid == false && floor4InFourBottomFloorGrid == false && floor4InFourTopFloorGrid == false{
                            
                            touchingFloor4 = true
                    }
                }
    
            if floor!.contains(location!) || ramp!.contains(location!) || wall!.contains(location!) || floor2!.contains(location!) || ramp2!.contains(location!) || wall2!.contains(location!) || floor3!.contains(location!) || ramp3!.contains(location!) || wall3!.contains(location!) || floor4!.contains(location!) || ramp4!.contains(location!) || wall4!.contains(location!){
            
            if (rampInOneRampGrid == true || floorInOneBottomFloorGrid == true || floorInOneTopFloorGrid == true || wallInOneRightWallGrid == true || wallInOneLeftWallGrid == true || ramp2InOneRampGrid == true || floor2InOneBottomFloorGrid == true || floor2InOneTopFloorGrid == true || wall2InOneRightWallGrid == true || wall2InOneLeftWallGrid == true || ramp3InOneRampGrid == true || floor3InOneBottomFloorGrid == true || floor3InOneTopFloorGrid == true || wall3InOneRightWallGrid == true || wall3InOneLeftWallGrid == true || ramp4InOneRampGrid == true || floor4InOneBottomFloorGrid == true || floor4InOneTopFloorGrid == true || wall4InOneRightWallGrid == true || wall4InOneLeftWallGrid == true) || (rampInTwoRampGrid == true || floorInTwoBottomFloorGrid == true || floorInTwoTopFloorGrid == true || wallInTwoRightWallGrid == true || wallInTwoLeftWallGrid == true || ramp2InTwoRampGrid == true || floor2InTwoBottomFloorGrid == true || floor2InTwoTopFloorGrid == true || wall2InTwoRightWallGrid == true || wall2InTwoLeftWallGrid == true || ramp3InTwoRampGrid == true || floor3InTwoBottomFloorGrid == true || floor3InTwoTopFloorGrid == true || wall3InTwoRightWallGrid == true || wall3InTwoLeftWallGrid == true || ramp4InTwoRampGrid == true || floor4InTwoBottomFloorGrid == true || floor4InTwoTopFloorGrid == true || wall4InTwoRightWallGrid == true || wall4InTwoLeftWallGrid == true) || (rampInThreeRampGrid == true || floorInThreeBottomFloorGrid == true || floorInThreeTopFloorGrid == true || wallInThreeRightWallGrid == true || wallInThreeLeftWallGrid == true || ramp2InThreeRampGrid == true || floor2InThreeBottomFloorGrid == true || floor2InThreeTopFloorGrid == true || wall2InThreeRightWallGrid == true || wall2InThreeLeftWallGrid == true || ramp3InThreeRampGrid == true || floor3InThreeBottomFloorGrid == true || floor3InThreeTopFloorGrid == true || wall3InThreeRightWallGrid == true || wall3InThreeLeftWallGrid == true || ramp4InThreeRampGrid == true || floor4InThreeBottomFloorGrid == true || floor4InThreeTopFloorGrid == true || wall4InThreeRightWallGrid == true || wall4InThreeLeftWallGrid == true) || (rampInFourRampGrid == true || floorInFourBottomFloorGrid == true || floorInFourTopFloorGrid == true || wallInFourRightWallGrid == true || wallInFourLeftWallGrid == true || ramp2InFourRampGrid == true || floor2InFourBottomFloorGrid == true || floor2InFourTopFloorGrid == true || wall2InFourRightWallGrid == true || wall2InFourLeftWallGrid == true || ramp3InFourRampGrid == true || floor3InFourBottomFloorGrid == true || floor3InFourTopFloorGrid == true || wall3InFourRightWallGrid == true || wall3InFourLeftWallGrid == true || ramp4InFourRampGrid == true || floor4InFourBottomFloorGrid == true || floor4InFourTopFloorGrid == true || wall4InFourRightWallGrid == true || wall4InFourLeftWallGrid == true){
                
            
               player!.physicsBody?.isDynamic = true
                
                }
            }
                
                
            
            if rightTouch!.contains(location!){
                
                touchingRight = true
                
            }
            
            
            
            
            if leftTouch!.contains(location!){
                
                touchingLeft = true
                
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
                
            
        if allowTouch == true && passedFinishLine == false{
     
            if (oneGrid!.contains(ramp!.position) || oneGrid!.contains(ramp2!.position) || oneGrid!.contains(ramp3!.position) || oneGrid!.contains(ramp4!.position)) && oneGrid!.alpha != 0 && (touchingRamp == true || touchingRamp2 == true || touchingRamp3 == true || touchingRamp4 == true){
                
                oneRampGrid!.alpha = 0.2
                
            } else {
                
                oneRampGrid!.alpha = 0
                
            }
            
            if (oneGrid!.contains(wall!.position) || oneGrid!.contains(wall2!.position) || oneGrid!.contains(wall3!.position) || oneGrid!.contains(wall4!.position)) && oneGrid!.alpha != 0 && (touchingWall == true || touchingWall2 == true || touchingWall3 == true || touchingWall4 == true){
                
                oneLeftWallGrid!.alpha = 0.2
                
                oneRightWallGrid!.alpha = 0.2
                
            } else {
                
                oneLeftWallGrid!.alpha = 0
                
                oneRightWallGrid!.alpha = 0
                
            }
            
            if (oneGrid!.contains(floor!.position) || oneGrid!.contains(floor2!.position) || oneGrid!.contains(floor3!.position) || oneGrid!.contains(floor4!.position)) && oneGrid!.alpha != 0 && (touchingFloor == true || touchingFloor2 == true || touchingFloor3 == true || touchingFloor4 == true){
                
                oneBottomFloorGrid!.alpha = 0.2
                
                oneTopFloorGrid!.alpha = 0.2
                
            } else {
                
                oneBottomFloorGrid!.alpha = 0
                
                oneTopFloorGrid!.alpha = 0
                
            }
            
            if (twoGrid!.contains(ramp!.position) || twoGrid!.contains(ramp2!.position) || twoGrid!.contains(ramp3!.position) || twoGrid!.contains(ramp4!.position)) && twoGrid!.alpha != 0 && (touchingRamp == true || touchingRamp2 == true || touchingRamp3 == true || touchingRamp4 == true){
                
                twoRampGrid!.alpha = 0.2
                
            } else {
                
                twoRampGrid!.alpha = 0
                
            }
            
            if (twoGrid!.contains(wall!.position) || twoGrid!.contains(wall2!.position) || twoGrid!.contains(wall3!.position) || twoGrid!.contains(wall4!.position)) && twoGrid!.alpha != 0  && (touchingWall == true || touchingWall2 == true || touchingWall3 == true || touchingWall4 == true){
                
                twoLeftWallGrid!.alpha = 0.2
                
                twoRightWallGrid!.alpha = 0.2
                
            } else {
                
                twoLeftWallGrid!.alpha = 0
                
                twoRightWallGrid!.alpha = 0
                
            }
            
            if (twoGrid!.contains(floor!.position) || twoGrid!.contains(floor2!.position) || twoGrid!.contains(floor3!.position) || twoGrid!.contains(floor4!.position)) && twoGrid!.alpha != 0 && (touchingFloor == true || touchingFloor2 == true || touchingFloor3 == true || touchingFloor4 == true){
                
                twoBottomFloorGrid!.alpha = 0.2
                
                twoTopFloorGrid!.alpha = 0.2
                
            } else {
                
                twoBottomFloorGrid!.alpha = 0
                
                twoTopFloorGrid!.alpha = 0
                
            }
            
            if (threeGrid!.contains(ramp!.position) || threeGrid!.contains(ramp2!.position) || threeGrid!.contains(ramp3!.position) || threeGrid!.contains(ramp4!.position)) && (threeGrid!.alpha != 0) && (touchingRamp == true || touchingRamp2 == true || touchingRamp3 == true || touchingRamp4 == true){
                
                threeRampGrid!.alpha = 0.2
                
            } else {
                
                threeRampGrid!.alpha = 0
                
            }
            
            if (threeGrid!.contains(wall!.position) || threeGrid!.contains(wall2!.position) || threeGrid!.contains(wall3!.position) || threeGrid!.contains(wall4!.position)) && threeGrid!.alpha != 0 && (touchingWall == true || touchingWall2 == true || touchingWall3 == true || touchingWall4 == true){
                
                threeLeftWallGrid!.alpha = 0.2
                
                threeRightWallGrid!.alpha = 0.2
                
            } else {
                
                threeLeftWallGrid!.alpha = 0
                
                threeRightWallGrid!.alpha = 0
                
            }
            
            if (threeGrid!.contains(floor!.position) || threeGrid!.contains(floor2!.position) || threeGrid!.contains(floor3!.position) || threeGrid!.contains(floor4!.position)) && threeGrid!.alpha != 0 && (touchingFloor == true || touchingFloor2 == true || touchingFloor3 == true || touchingFloor4 == true){
                
                threeBottomFloorGrid!.alpha = 0.2
                
                threeTopFloorGrid!.alpha = 0.2
                
            } else {
                
                threeBottomFloorGrid!.alpha = 0
                
                threeTopFloorGrid!.alpha = 0
                
            }
            
            if (fourGrid!.contains(ramp!.position) || fourGrid!.contains(ramp2!.position) || fourGrid!.contains(ramp3!.position) || fourGrid!.contains(ramp4!.position)) && fourGrid!.alpha != 0 && (touchingRamp == true || touchingRamp2 == true || touchingRamp3 == true || touchingRamp4 == true){
                
                fourRampGrid!.alpha = 0.2
                
            } else {
                
                fourRampGrid!.alpha = 0
                
            }
            
            if (fourGrid!.contains(wall!.position) || fourGrid!.contains(wall2!.position) || fourGrid!.contains(wall3!.position) || fourGrid!.contains(wall4!.position)) && fourGrid!.alpha != 0 && (touchingWall == true || touchingWall2 == true || touchingWall3 == true || touchingWall4 == true){
                
                fourLeftWallGrid!.alpha = 0.2
                
                fourRightWallGrid!.alpha = 0.2
                
            } else {
                
                fourLeftWallGrid!.alpha = 0
                
                fourRightWallGrid!.alpha = 0
                
            }
            
            if (fourGrid!.contains(floor!.position) || fourGrid!.contains(floor2!.position) || fourGrid!.contains(floor3!.position) || fourGrid!.contains(floor4!.position)) && fourGrid!.alpha != 0 && (touchingFloor == true || touchingFloor2 == true || touchingFloor3 == true || touchingFloor4 == true){
                
                fourBottomFloorGrid!.alpha = 0.2
                
                fourTopFloorGrid!.alpha = 0.2
                
            } else {
                
                fourBottomFloorGrid!.alpha = 0
                
                fourTopFloorGrid!.alpha = 0
                
            }
            
            if oneGrid!.contains(ramp!.position)  {
                    

                rampInOneRampGrid = true
                    
            } else {
                
                rampInOneRampGrid = false
                
            }
                
            
                
            if twoGrid!.contains(ramp!.position){
                
                rampInTwoRampGrid = true
                
            } else {
                
                rampInTwoRampGrid = false
                
            }
                
                
                
            if threeGrid!.contains(ramp!.position){
                    
                rampInThreeRampGrid = true
                    
            } else {
                    
                rampInThreeRampGrid = false
                    
            }
            
            if fourGrid!.contains(ramp!.position){
                    
                rampInFourRampGrid = true
                    
            } else {
                    
                rampInFourRampGrid = false
                    
            }
            
            if oneGrid!.contains(ramp2!.position){
                                    
                ramp2InOneRampGrid = true
                                
            } else {
                                                    
                ramp2InOneRampGrid = false
                                    
            }
                
            if twoGrid!.contains(ramp2!.position){
                
                ramp2InTwoRampGrid = true
        
            } else {
                
                ramp2InTwoRampGrid = false
                
            }
                
            if threeGrid!.contains(ramp2!.position){
                
                ramp2InThreeRampGrid = true
                    
            } else {
                
                ramp2InThreeRampGrid = false
                
                
            }
            
            if fourGrid!.contains(ramp2!.position){
                
                ramp2InFourRampGrid = true
                    
            } else {
                
                ramp2InFourRampGrid = false
                
                
            }
            if oneGrid!.contains(ramp3!.position){
                
                ramp3InOneRampGrid = true
                    
            } else {
                
                ramp3InOneRampGrid = false
                
            }
                
            if twoGrid!.contains(ramp3!.position){
                
                ramp3InTwoRampGrid = true
                
                
            } else {
                
                ramp3InTwoRampGrid = false
                
            }
                
            if threeGrid!.contains(ramp3!.position){
                
                ramp3InThreeRampGrid = true
                
            } else {
                
                ramp3InThreeRampGrid = false
                
            }
            
            if fourGrid!.contains(ramp3!.position){
                
                ramp3InFourRampGrid = true
                
            } else {
                
                ramp3InFourRampGrid = false
                
            }
            
            if oneGrid!.contains(ramp4!.position){
                
                ramp4InOneRampGrid = true
                    
            } else {
                
                ramp4InOneRampGrid = false
                
            }
                
            if twoGrid!.contains(ramp4!.position){
                
                ramp4InTwoRampGrid = true
                
                
            } else {
                
                ramp4InTwoRampGrid = false
                
            }
                
            if threeGrid!.contains(ramp4!.position){
                
                ramp4InThreeRampGrid = true
                
            } else {
                
                ramp4InThreeRampGrid = false
                
            }
            
            if fourGrid!.contains(ramp4!.position){
                
                ramp4InFourRampGrid = true
                
            } else {
                
                ramp4InFourRampGrid = false
                
            }
                
            
            
            if oneGrid!.contains(wall!.position) && oneGrid!.alpha != 0{
                
                if oneLeftWallGrid!.contains(wall!.position){
                wallInOneLeftWallGrid = true
                wallInOneRightWallGrid = false
                
                }
                
                if oneRightWallGrid!.contains(wall!.position){
                wallInOneRightWallGrid = true
                wallInOneLeftWallGrid = false
                
                }
                
      
            } else {
                
                wallInOneLeftWallGrid = false
                
                wallInOneRightWallGrid = false
                
            }
                
            if twoGrid!.contains(wall!.position) && twoGrid!.alpha != 0{
                    
                if twoLeftWallGrid!.contains(wall!.position){
                wallInTwoLeftWallGrid = true
                wallInTwoRightWallGrid = false
                    
                }
                    
                if twoRightWallGrid!.contains(wall!.position){
                wallInTwoRightWallGrid = true
                wallInTwoLeftWallGrid = false
                    
                }
                    
                    
            } else {
                    
                wallInTwoLeftWallGrid = false
                
                wallInTwoRightWallGrid = false
            
            }
                
            if threeGrid!.contains(wall!.position) && threeGrid!.alpha != 0{
                        
                if threeLeftWallGrid!.contains(wall!.position){
                    
                wallInThreeLeftWallGrid = true
                    
                wallInThreeRightWallGrid = false
                        
                }
                        
                if threeRightWallGrid!.contains(wall!.position){
                    
                wallInThreeRightWallGrid = true
                    
                wallInThreeLeftWallGrid = false
                        
                }
                        
            } else {
                        
                wallInThreeLeftWallGrid = false
                
                wallInThreeRightWallGrid = false
                
            }
            
            if fourGrid!.contains(wall!.position) && fourGrid!.alpha != 0{
                        
                if fourLeftWallGrid!.contains(wall!.position){
                    
                wallInFourLeftWallGrid = true
                    
                wallInFourRightWallGrid = false
                        
                }
                        
                if fourRightWallGrid!.contains(wall!.position){
                    
                wallInFourRightWallGrid = true
                    
                wallInFourLeftWallGrid = false
                        
                }
                        
            } else {
                        
                wallInFourLeftWallGrid = false
                
                wallInFourRightWallGrid = false
                
            }
                
                if oneGrid!.contains(wall2!.position) && oneGrid!.alpha != 0{
                    
                    if oneLeftWallGrid!.contains(wall2!.position){
                        
                    wall2InOneLeftWallGrid = true
                        
                    wall2InOneRightWallGrid = false
                    
                    }
                    
                    if oneRightWallGrid!.contains(wall2!.position){
                        
                    wall2InOneRightWallGrid = true
                        
                    wall2InOneLeftWallGrid = false
                    
                    }
                    
                } else {
                    
                    wall2InOneLeftWallGrid = false
                    
                    wall2InOneRightWallGrid = false
                    
                }
        
                if twoGrid!.contains(wall2!.position) && twoGrid!.alpha != 0{
                        
                    if twoLeftWallGrid!.contains(wall2!.position){
                        
                    wall2InTwoLeftWallGrid = true
                        
                    wall2InTwoRightWallGrid = false
                        
                    }
                        
                    if twoRightWallGrid!.contains(wall2!.position){
                        
                    wall2InTwoRightWallGrid = true
                        
                    wall2InTwoLeftWallGrid = false
                        
                    }
                        
                } else {
                        
                    wall2InTwoLeftWallGrid = false
                        
                    wall2InTwoRightWallGrid = false

                }
            
        
            
            
                    
                if threeGrid!.contains(wall2!.position) && threeGrid!.alpha != 0{
                            
                    if threeLeftWallGrid!.contains(wall2!.position){
                        
                    wall2InThreeLeftWallGrid = true
                        
                    wall2InThreeRightWallGrid = false
                            
                    }
                            
                    if threeRightWallGrid!.contains(wall2!.position){
                        
                    wall2InThreeRightWallGrid = true
                        
                    wall2InThreeLeftWallGrid = false
                            
                    }
                            
                } else {
                            
                    wall2InThreeLeftWallGrid = false

                    wall2InThreeRightWallGrid = false
                    
                }
        
            
            
            if fourGrid!.contains(wall2!.position) && fourGrid!.alpha != 0{
                        
                if fourLeftWallGrid!.contains(wall2!.position){
                    
                wall2InFourLeftWallGrid = true
                    
                wall2InFourRightWallGrid = false
                        
                }
                        
                if fourRightWallGrid!.contains(wall2!.position){
                    
                wall2InFourRightWallGrid = true
                    
                wall2InFourLeftWallGrid = false
                        
                }
                        
            } else {
                        
                wall2InFourLeftWallGrid = false

                wall2InFourRightWallGrid = false
                
            }
        }
        
                    
                    
                if oneGrid!.contains(wall3!.position) && oneGrid!.alpha != 0{
                    
                    if oneLeftWallGrid!.contains(wall3!.position){
                        
                    wall3InOneLeftWallGrid = true
                        
                    wall3InOneRightWallGrid = false
                    
                    }
                    
                    if oneRightWallGrid!.contains(wall3!.position){
                        
                    wall3InOneRightWallGrid = true
                        
                    wall3InOneLeftWallGrid = false
                    
                    }
                    
                } else {
                    
                    wall3InOneLeftWallGrid = false
                    
                    wall3InOneRightWallGrid = false
                    
                }
                    
                if twoGrid!.contains(wall3!.position) && twoGrid!.alpha != 0{
                        
                    if twoLeftWallGrid!.contains(wall3!.position){
                        
                    wall3InTwoLeftWallGrid = true
                        
                    wall3InTwoRightWallGrid = false
                        
                    }
                        
                    if twoRightWallGrid!.contains(wall3!.position){
                        
                    wall3InTwoRightWallGrid = true
                        
                    wall3InTwoLeftWallGrid = false
                        
                    }
                        
                } else {
                        
                    wall3InTwoLeftWallGrid = false
                        
                    wall3InTwoRightWallGrid = false

                }
                    
                if threeGrid!.contains(wall3!.position) && threeGrid!.alpha != 0{
                            
                    if threeLeftWallGrid!.contains(wall3!.position){
                        
                    wall3InThreeLeftWallGrid = true
                        
                    wall3InThreeRightWallGrid = false
                            
                    }
                            
                    if threeRightWallGrid!.contains(wall3!.position){
                        
                    wall3InThreeRightWallGrid = true
                        
                    wall3InThreeLeftWallGrid = false
                            
                    }
                            
                } else {
                            
                    wall3InThreeLeftWallGrid = false
                            
                    wall3InThreeRightWallGrid = false
                    
                    }
            
            if fourGrid!.contains(wall4!.position) && fourGrid!.alpha != 0{
                        
                if fourLeftWallGrid!.contains(wall3!.position){
                    
                wall3InFourLeftWallGrid = true
                    
                wall3InFourRightWallGrid = false
                        
                }
                        
                if fourRightWallGrid!.contains(wall3!.position){
                    
                wall3InFourRightWallGrid = true
                    
                wall3InFourLeftWallGrid = false
                        
                }
                        
            } else {
                        
                wall3InFourLeftWallGrid = false

                wall3InFourRightWallGrid = false
                
            }
            
            if oneGrid!.contains(wall4!.position) && oneGrid!.alpha != 0{
                
                if oneLeftWallGrid!.contains(wall4!.position){
                    
                wall4InOneLeftWallGrid = true
                    
                wall4InOneRightWallGrid = false
                
                }
                
                if oneRightWallGrid!.contains(wall4!.position){
                    
                wall4InOneRightWallGrid = true
                    
                wall4InOneLeftWallGrid = false
                
                }
                
            } else {
                
                wall4InOneLeftWallGrid = false
                
                wall4InOneRightWallGrid = false
                
            }
                
            if twoGrid!.contains(wall4!.position) && twoGrid!.alpha != 0{
                    
                if twoLeftWallGrid!.contains(wall4!.position){
                    
                wall4InTwoLeftWallGrid = true
                    
                wall4InTwoRightWallGrid = false
                    
                }
                    
                if twoRightWallGrid!.contains(wall3!.position){
                    
                wall4InTwoRightWallGrid = true
                    
                wall4InTwoLeftWallGrid = false
                    
                }
                    
            } else {
                    
                wall4InTwoLeftWallGrid = false
                    
                wall4InTwoRightWallGrid = false

            }
                
            if threeGrid!.contains(wall4!.position) && threeGrid!.alpha != 0{
                        
                if threeLeftWallGrid!.contains(wall4!.position){
                    
                wall4InThreeLeftWallGrid = true
                    
                wall4InThreeRightWallGrid = false
                        
                }
                        
                if threeRightWallGrid!.contains(wall4!.position){
                    
                wall4InThreeRightWallGrid = true
                    
                wall4InThreeLeftWallGrid = false
                        
                }
                        
            } else {
                        
                wall4InThreeLeftWallGrid = false
                        
                wall4InThreeRightWallGrid = false
                
                }
        
        if fourGrid!.contains(wall4!.position) && fourGrid!.alpha != 0{
                    
            if fourLeftWallGrid!.contains(wall4!.position){
                
            wall4InFourLeftWallGrid = true
                
            wall4InFourRightWallGrid = false
                    
            }
                    
            if fourRightWallGrid!.contains(wall4!.position){
                
            wall4InFourRightWallGrid = true
                
            wall4InFourLeftWallGrid = false
                    
            }
                    
        } else {
                    
            wall4InFourLeftWallGrid = false

            wall4InFourRightWallGrid = false
            
        }
            
            
         }
  
            if oneGrid!.contains(floor!.position){
                
                
                if oneTopFloorGrid!.contains(floor!.position){
                    
                floorInOneTopFloorGrid = true
                    
                floorInOneBottomFloorGrid = false
                    
                }
                    
                if oneBottomFloorGrid!.contains(floor!.position){
                    
                floorInOneBottomFloorGrid = true
                    
                floorInOneTopFloorGrid = false
                    
                }
                
            } else {
                
                floorInOneBottomFloorGrid = false
                
                floorInOneTopFloorGrid = false
                
            }
         
        
            if twoGrid!.contains(floor!.position){
                    
                    
                if twoTopFloorGrid!.contains(floor!.position){
                        
                    floorInTwoTopFloorGrid = true
                    
                    floorInTwoBottomFloorGrid = false
                        
                }
                        
                if twoBottomFloorGrid!.contains(floor!.position){
                        
                    floorInTwoBottomFloorGrid = true
                    
                    floorInTwoTopFloorGrid = false
                        
                }
                    
                    
            
                    
            } else {
                    
                floorInTwoBottomFloorGrid = false
                    
                floorInTwoTopFloorGrid = false
                
            }
        
            if threeGrid!.contains(floor!.position){
                    
                    
                if threeTopFloorGrid!.contains(floor!.position){
                        
                    floorInThreeTopFloorGrid = true
                    
                    floorInThreeBottomFloorGrid = false
                        
                }
                        
                if threeBottomFloorGrid!.contains(floor!.position){
                        
                    floorInThreeBottomFloorGrid = true
                    
                    floorInThreeTopFloorGrid = false
                        
                }
                    
            } else {
                    
                floorInThreeBottomFloorGrid = false
                    
                floorInThreeTopFloorGrid = false
                    
            }
        
        if fourGrid!.contains(floor!.position){
                
                
            if fourTopFloorGrid!.contains(floor!.position){
                    
                floorInFourTopFloorGrid = true
                
                floorInFourBottomFloorGrid = false
                    
            }
                    
            if fourBottomFloorGrid!.contains(floor!.position){
                    
                floorInFourBottomFloorGrid = true
                
                floorInFourTopFloorGrid = false
                    
            }
                
        } else {
                
            floorInFourBottomFloorGrid = false
                
            floorInFourTopFloorGrid = false
                
        }
            if oneGrid!.contains(floor2!.position){
                    
                    
                if oneTopFloorGrid!.contains(floor2!.position){
                        
                    floor2InOneTopFloorGrid = true
                    
                    floor2InOneBottomFloorGrid = false
                        
                }
                        
                if oneBottomFloorGrid!.contains(floor2!.position){
                        
                    floor2InOneBottomFloorGrid = true
                    
                    floor2InOneTopFloorGrid = false
                        
                }
        
                } else {
                    
                    floor2InOneBottomFloorGrid = false
                    
                    floor2InOneTopFloorGrid = false
           
                }
                
                
                if twoGrid!.contains(floor2!.position){
                    
                    
                    if twoTopFloorGrid!.contains(floor2!.position){
                        
                    floor2InTwoTopFloorGrid = true
                        
                    floor2InTwoBottomFloorGrid = false
                        
                    }
                        
                    if twoBottomFloorGrid!.contains(floor2!.position){
                        
                    floor2InTwoBottomFloorGrid = true
                        
                    floor2InTwoTopFloorGrid = false
                        
                    }
                    
                } else {
                    
                    floor2InTwoBottomFloorGrid = false
                
                    floor2InTwoTopFloorGrid = false
        
                }
                
                
                
                if threeGrid!.contains(floor2!.position){
                    
                    
                    if threeTopFloorGrid!.contains(floor2!.position){
                        
                    floor2InThreeTopFloorGrid = true
                        
                    floor2InThreeBottomFloorGrid = false
                        
                    }
                        
                    if threeBottomFloorGrid!.contains(floor2!.position){
                        
                    floor2InThreeBottomFloorGrid = true
                        
                    floor2InThreeTopFloorGrid = false
                        
                    }
                    
                } else {
                    
                    floor2InThreeBottomFloorGrid = false
 
                    floor2InThreeTopFloorGrid = false
                    
                }
        
        if fourGrid!.contains(floor2!.position){
            
            
            if fourTopFloorGrid!.contains(floor2!.position){
                
            floor2InFourTopFloorGrid = true
                
            floor2InFourBottomFloorGrid = false
                
            }
                
            if fourBottomFloorGrid!.contains(floor2!.position){
                
            floor2InFourBottomFloorGrid = true
                
            floor2InFourTopFloorGrid = false
                
            }
            
        } else {
            
            floor2InFourBottomFloorGrid = false

            floor2InFourTopFloorGrid = false
            
        }
                
                if oneGrid!.contains(floor3!.position){
                    
                    
                    if oneTopFloorGrid!.contains(floor3!.position){
                        
                    floor3InOneTopFloorGrid = true
                        
                    floor3InOneBottomFloorGrid = false
                        
                    }
                        
                    if oneBottomFloorGrid!.contains(floor3!.position){
                        
                    floor3InOneBottomFloorGrid = true
                        
                    floor3InOneTopFloorGrid = false
                        
                    }
    
                } else {
                    
                    floor3InOneBottomFloorGrid = false
                    
                    floor3InOneTopFloorGrid = false
                    
                }
                
                
                
                
                if twoGrid!.contains(floor3!.position){
                    
                    
                    if twoTopFloorGrid!.contains(floor3!.position){
                        
                    floor3InTwoTopFloorGrid = true
                        
                    floor3InTwoBottomFloorGrid = false
                        
                    }
                        
                    if twoBottomFloorGrid!.contains(floor3!.position){
                        
                    floor3InTwoBottomFloorGrid = true
                        
                    floor3InTwoTopFloorGrid = false
                        
                    }
                    
                } else {
                    
                    floor3InTwoBottomFloorGrid = false
                    
                    floor3InTwoTopFloorGrid = false
                    
                }
                
                if threeGrid!.contains(floor3!.position){
                    
                    
                    if threeTopFloorGrid!.contains(floor3!.position){
                        
                    floor3InThreeTopFloorGrid = true
                        
                    floor3InThreeBottomFloorGrid = false
                        
                    }
                        
                    if threeBottomFloorGrid!.contains(floor3!.position){
                        
                    floor3InThreeBottomFloorGrid = true
                        
                    floor3InThreeTopFloorGrid = false
                        
                    }
                    
                } else {
                    
                    floor3InThreeBottomFloorGrid = false
                   
                    floor3InThreeTopFloorGrid = false
                    
                }
        
        if fourGrid!.contains(floor3!.position){
            
            
            if fourTopFloorGrid!.contains(floor3!.position){
                
            floor3InFourTopFloorGrid = true
                
            floor3InFourBottomFloorGrid = false
                
            }
                
            if fourBottomFloorGrid!.contains(floor3!.position){
                
            floor3InFourBottomFloorGrid = true
                
            floor3InFourTopFloorGrid = false
                
            }
            
        } else {
            
            floor3InFourBottomFloorGrid = false
           
            floor3InFourTopFloorGrid = false
            
        }
        
        if oneGrid!.contains(floor4!.position){
            
            
            if oneTopFloorGrid!.contains(floor4!.position){
                
            floor4InOneTopFloorGrid = true
                
            floor4InOneBottomFloorGrid = false
                
            }
                
            if oneBottomFloorGrid!.contains(floor4!.position){
                
            floor4InOneBottomFloorGrid = true
                
            floor4InOneTopFloorGrid = false
                
            }

        } else {
            
            floor4InOneBottomFloorGrid = false
            
            floor4InOneTopFloorGrid = false
            
        }
        
        
        
        
        if twoGrid!.contains(floor4!.position){
            
            
            if twoTopFloorGrid!.contains(floor4!.position){
                
            floor4InTwoTopFloorGrid = true
                
            floor4InTwoBottomFloorGrid = false
                
            }
                
            if twoBottomFloorGrid!.contains(floor4!.position){
                
            floor4InTwoBottomFloorGrid = true
                
            floor4InTwoTopFloorGrid = false
                
            }
            
        } else {
            
            floor4InTwoBottomFloorGrid = false
            
            floor4InTwoTopFloorGrid = false
            
        }
        
        if threeGrid!.contains(floor4!.position){
            
            
            if threeTopFloorGrid!.contains(floor4!.position){
                
            floor4InThreeTopFloorGrid = true
                
            floor4InThreeBottomFloorGrid = false
                
            }
                
            if threeBottomFloorGrid!.contains(floor4!.position){
                
            floor4InThreeBottomFloorGrid = true
                
            floor4InThreeTopFloorGrid = false
                
            }
            
        } else {
            
            floor4InThreeBottomFloorGrid = false
           
            floor4InThreeTopFloorGrid = false
            
        }

if fourGrid!.contains(floor4!.position){
    
    
    if fourTopFloorGrid!.contains(floor4!.position){
        
    floor4InFourTopFloorGrid = true
        
    floor4InFourBottomFloorGrid = false
        
    }
        
    if fourBottomFloorGrid!.contains(floor4!.position){
        
    floor4InFourBottomFloorGrid = true
        
    floor4InFourTopFloorGrid = false
        
    }
    
} else {
    
    floor4InFourBottomFloorGrid = false
   
    floor4InFourTopFloorGrid = false
    
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
            
            if leftTouch!.contains(wall2!.position) || rightTouch!.contains(wall2!.position){
                
                let wallGrow = SKAction.resize(toWidth: 36, height: 160, duration: 0.3)
                
                wall2!.run(wallGrow)
                wallShadow2!.run(wallGrow)
                
                
            }
            
            if leftTouch!.contains(floor2!.position) || rightTouch!.contains(floor2!.position){
                
                let floorGrow = SKAction.resize(toWidth: 36, height: 160, duration: 0.3)
                
                floor2!.run(floorGrow)
                floorShadow2!.run(floorGrow)
                
            }
            
            if leftTouch!.contains(ramp2!.position) || rightTouch!.contains(ramp2!.position){
                
                let rampGrow = SKAction.resize(toWidth: 23, height: 201, duration: 0.3)
                
                ramp2!.run(rampGrow)
                rampShadow2!.run(rampGrow)
                
            }
            
            if leftTouch!.contains(wall3!.position) || rightTouch!.contains(wall3!.position){
                
                let wallGrow = SKAction.resize(toWidth: 36, height: 160, duration: 0.3)
                
                wall3!.run(wallGrow)
                wallShadow3!.run(wallGrow)
                
                
            }
            
            if leftTouch!.contains(floor3!.position) || rightTouch!.contains(floor3!.position){
                
                let floorGrow = SKAction.resize(toWidth: 36, height: 160, duration: 0.3)
                
                floor3!.run(floorGrow)
                floorShadow3!.run(floorGrow)
                
            }
            
            if leftTouch!.contains(ramp3!.position) || rightTouch!.contains(ramp3!.position){
                
                let rampGrow = SKAction.resize(toWidth: 23, height: 201, duration: 0.3)
                
                ramp3!.run(rampGrow)
                rampShadow3!.run(rampGrow)
                
            }
        
        if leftTouch!.contains(wall4!.position) || rightTouch!.contains(wall4!.position){
            
            let wallGrow = SKAction.resize(toWidth: 36, height: 160, duration: 0.3)
            
            wall4!.run(wallGrow)
            wallShadow4!.run(wallGrow)
            
            
        }
        
        if leftTouch!.contains(floor4!.position) || rightTouch!.contains(floor4!.position){
            
            let floorGrow = SKAction.resize(toWidth: 36, height: 160, duration: 0.3)
            
            floor4!.run(floorGrow)
            floorShadow4!.run(floorGrow)
            
        }
        
        if leftTouch!.contains(ramp4!.position) || rightTouch!.contains(ramp4!.position){
            
            let rampGrow = SKAction.resize(toWidth: 23, height: 201, duration: 0.3)
            
            ramp4!.run(rampGrow)
            rampShadow4!.run(rampGrow)
            
        }
            
            
            
            if touchingWall == true && wallInOneRightWallGrid2 == false && wallInOneLeftWallGrid2 == false &&  wallInTwoRightWallGrid2 == false && wallInTwoLeftWallGrid2 == false && wallInOneRightWallGrid2 == false && wallInOneLeftWallGrid2 == false &&  wallInThreeRightWallGrid2 == false && wallInThreeLeftWallGrid2 == false &&  wallInFourRightWallGrid2 == false && wallInFourLeftWallGrid2 == false && allowTouch == true{
                
                wall!.position = location!
                wallShadow!.position.x = location!.x
                wallShadow!.position.y = location!.y - 8
                
                
            }
        
            if touchingWall2 == true && wall2InOneRightWallGrid2 == false && wall2InOneLeftWallGrid2 == false &&  wall2InTwoRightWallGrid2 == false && wall2InTwoLeftWallGrid2 == false && wall2InOneRightWallGrid2 == false && wall2InOneLeftWallGrid2 == false && wall2InThreeRightWallGrid2 == false && wall2InThreeLeftWallGrid2 == false && wall2InFourRightWallGrid2 == false && wall2InFourLeftWallGrid2 == false && allowTouch == true{
                
                wall2!.position = location!
                wallShadow2!.position.x = location!.x
                wallShadow2!.position.y = location!.y - 8
                
            }
        
            if touchingWall3 == true && wall3InOneRightWallGrid2 == false && wall3InOneLeftWallGrid2 == false &&  wall3InTwoRightWallGrid2 == false && wall3InTwoLeftWallGrid2 == false && wall3InOneRightWallGrid2 == false && wall3InOneLeftWallGrid2 == false && wall3InThreeRightWallGrid2 == false && wall3InThreeLeftWallGrid2 == false && wall3InFourRightWallGrid2 == false && wall3InFourLeftWallGrid2 == false && allowTouch == true{
                
                wall3!.position = location!
                wallShadow3!.position.x = location!.x
                wallShadow3!.position.y = location!.y - 8
                
            }
        
        if touchingWall4 == true && wall4InOneRightWallGrid2 == false && wall4InOneLeftWallGrid2 == false &&  wall4InTwoRightWallGrid2 == false && wall4InTwoLeftWallGrid2 == false && wall4InOneRightWallGrid2 == false && wall4InOneLeftWallGrid2 == false && wall4InThreeRightWallGrid2 == false && wall4InThreeLeftWallGrid2 == false && wall4InFourRightWallGrid2 == false && wall4InFourLeftWallGrid2 == false && allowTouch == true{
            
            wall4!.position = location!
            wallShadow3!.position.x = location!.x
            wallShadow4!.position.y = location!.y - 8
            
        }
            if touchingRamp == true && rampInOneRampGrid2 == false && rampInTwoRampGrid2 == false && rampInThreeRampGrid2 == false && rampInFourRampGrid2 == false && allowTouch == true{
                
                ramp!.position = location!
                rampShadow!.position.x = location!.x
                rampShadow!.position.y = location!.y - 8
                
            }
        
            if touchingRamp2 == true && ramp2InOneRampGrid2 == false && ramp2InTwoRampGrid2 == false && ramp2InThreeRampGrid2 == false && ramp2InFourRampGrid2 == false && allowTouch == true{
                
                ramp2!.position = location!
                rampShadow2!.position.x = location!.x
                rampShadow2!.position.y = location!.y - 8
                
            }
        
            if touchingRamp3 == true && ramp3InOneRampGrid2 == false && ramp3InTwoRampGrid2 == false && ramp3InThreeRampGrid2 == false && ramp3InFourRampGrid2 == false && allowTouch == true{
                
                ramp3!.position = location!
                rampShadow3!.position.x = location!.x
                rampShadow3!.position.y = location!.y - 8
                
            }
        
        if touchingRamp4 == true && ramp4InOneRampGrid2 == false && ramp4InTwoRampGrid2 == false && ramp4InThreeRampGrid2 == false && ramp4InFourRampGrid2 == false && allowTouch == true{
            
            ramp4!.position = location!
            rampShadow4!.position.x = location!.x
            rampShadow4!.position.y = location!.y - 8
            
        }
            
            if touchingFloor == true && floorInOneBottomfloorGrid2 == false && floorInOneTopfloorGrid2 == false && floorInTwoBottomfloorGrid2 == false && floorInTwoTopfloorGrid2 == false && floorInThreeBottomfloorGrid2 == false && floorInThreeTopfloorGrid2 == false && floorInFourBottomfloorGrid2 == false && floorInFourTopfloorGrid2 == false && allowTouch == true{
                
                floor!.position = location!
                floorShadow!.position.x = location!.x
                floorShadow!.position.y = location!.y - 8
                
            }
 
            if touchingFloor2 == true && floor2InOneBottomfloorGrid2 == false && floor2InOneTopfloorGrid2 == false && floor2InTwoBottomfloorGrid2 == false && floor2InTwoTopfloorGrid2 == false && floor2InThreeBottomfloorGrid2 == false && floor2InThreeTopfloorGrid2 == false && floor2InFourBottomfloorGrid2 == false && floor2InFourTopfloorGrid2 == false && allowTouch == true{
                    
                floor2!.position = location!
                floorShadow2!.position.x = location!.x
                floorShadow2!.position.y = location!.y - 8
                    
            }
         
            if touchingFloor3 == true && floor3InOneBottomfloorGrid2 == false && floor3InOneTopfloorGrid2 == false && floor3InTwoBottomfloorGrid2 == false && floor3InTwoTopfloorGrid2 == false && floor3InThreeBottomfloorGrid2 == false && floor3InThreeTopfloorGrid2 == false && floor3InFourBottomfloorGrid2 == false && floor3InFourTopfloorGrid2 == false && allowTouch == true{
                    
                floor3!.position = location!
                floorShadow3!.position.x = location!.x
                floorShadow3!.position.y = location!.y - 8
                    
            }
        
        if touchingFloor4 == true && floor4InOneBottomfloorGrid2 == false && floor4InOneTopfloorGrid2 == false && floor4InTwoBottomfloorGrid2 == false && floor4InTwoTopfloorGrid2 == false && floor4InThreeBottomfloorGrid2 == false && floor4InThreeTopfloorGrid2 == false && floor4InFourBottomfloorGrid2 == false && floor4InFourTopfloorGrid2 == false && allowTouch == true{
                
            floor4!.position = location!
            floorShadow4!.position.x = location!.x
            floorShadow4!.position.y = location!.y - 8
                
        }
        }
    
    
    //MARK: Touches Ended
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            location = t.location(in: self)
            
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
               // let mainmenuscene = level6(fileNamed: "level6")
               // mainmenuscene?.scaleMode = .aspectFill
               // self.scene?.view?.presentScene(mainmenuscene!)
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
                
                    touchingFloor2 = false
                    touchingRamp2 = false
                    touchingWall2 = false
                
                    touchingFloor3 = false
                    touchingRamp3 = false
                    touchingWall3 = false
            
                    touchingFloor4 = false
                    touchingRamp4 = false
                    touchingWall4 = false
            
            
            //MARK: Grid One
            
                
                if oneGrid!.alpha != 0 && (floorInOneBottomFloorGrid == true || floorInOneTopFloorGrid == true) {
                    
                    if floorInOneBottomFloorGrid == true {
                        
                        floorInOneBottomfloorGrid2 = true
                        
                        oneGrid!.alpha = 0
                        
                        floor!.position = oneBottomFloorGrid!.position
                        floorShadow!.position.y = oneBottomFloorGrid!.position.y - 8
                        floorShadow!.position.x = oneBottomFloorGrid!.position.x
                        
                        
                    }
                    
                    if floorInOneTopFloorGrid == true {
                        
                        floorInOneTopfloorGrid2 = true
                        
                        oneGrid!.alpha = 0
                        
                        floor!.position = oneTopFloorGrid!.position
                        floorShadow!.position.y = oneTopFloorGrid!.position.y - 8
                        floorShadow!.position.x = oneTopFloorGrid!.position.x
                        
                    }
                
                floor!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                floor!.physicsBody?.isDynamic = false
                floor!.physicsBody?.friction = 1
                
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
                
            if oneGrid!.alpha != 0 && (wallInOneRightWallGrid == true || wallInOneLeftWallGrid == true) {
                    
                wall!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                wall!.physicsBody?.isDynamic = false
            
                if wallInOneLeftWallGrid == true {
                    
                    wallInOneLeftWallGrid2 = true
                    
                    oneGrid!.alpha = 0
               
                    wall!.position = oneLeftWallGrid!.position
                    wallShadow!.position.x = oneLeftWallGrid!.position.x
                    wallShadow!.position.y = oneLeftWallGrid!.position.y - 8
                    
                }
                
                if wallInOneRightWallGrid == true {
                    
                    wallInOneRightWallGrid2 = true
                    
                    oneGrid!.alpha = 0
                    
                    wall!.position = oneRightWallGrid!.position
                    wallShadow!.position.x = oneRightWallGrid!.position.x
                    wallShadow!.position.y = oneRightWallGrid!.position.y - 8
                    
                }
                
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
                
                if oneGrid!.alpha != 0 && rampInOneRampGrid == true {
                
                    ramp!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp!.size.width - 14, height: ramp!.size.height + 90), center: CGPoint(x: 0, y: -21))
                
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
                    
                oneGrid!.alpha = 0
                    
                ramp!.position = oneRampGrid!.position
                rampShadow!.position.x = oneRampGrid!.position.x
                rampShadow!.position.y = oneRampGrid!.position.y - 8
                
            }
                    
            if rampInOneRampGrid == false {
                
                player!.physicsBody?.isDynamic = true
                
            }
                    
                    if oneGrid!.alpha != 0 && (floor2InOneBottomFloorGrid == true || floor2InOneTopFloorGrid == true) {
                        
                        if floor2InOneBottomFloorGrid == true {
                            
                            floor2InOneBottomfloorGrid2 = true
                            
                            oneGrid!.alpha = 0
                            
                            floor2!.position = oneBottomFloorGrid!.position
                            floorShadow2!.position.y = oneBottomFloorGrid!.position.y - 8
                            floorShadow2!.position.x = oneBottomFloorGrid!.position.x
                            
                            
                        }
                        
                        if floor2InOneTopFloorGrid == true {
                            
                            floor2InOneTopfloorGrid2 = true
                            
                            oneGrid!.alpha = 0
                            
                            floor2!.position = oneTopFloorGrid!.position
                            floorShadow2!.position.y = oneTopFloorGrid!.position.y - 8
                            floorShadow2!.position.x = oneTopFloorGrid!.position.x
                            
                        }
                    
                    floor2!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    floor2!.physicsBody?.isDynamic = false
                    floor2!.physicsBody?.friction = 1
                    
                        if floor2effectsAllowed == true {
                            
                            if floor2!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.floor2!.position.x, y: self.floor2!.position.y), rotation: 1.5708)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        floor2!.run(rampseq)
                                
                            }
                        }
                    }
                    
                    if floor2InOneBottomFloorGrid == false || floor2InOneTopFloorGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                if oneGrid!.alpha != 0 && (wall2InOneRightWallGrid == true || wall2InOneLeftWallGrid == true) {
                        
                    wall2!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    wall2!.physicsBody?.isDynamic = false
                
                    if wall2InOneLeftWallGrid == true {
                        
                        wall2InOneLeftWallGrid2 = true
                        
                        oneGrid!.alpha = 0
                        
                        wall2!.position = oneLeftWallGrid!.position
                        wallShadow2!.position.x = oneLeftWallGrid!.position.x
                        wallShadow2!.position.y = oneLeftWallGrid!.position.y - 8
                        
                    }
                    
                    if wall2InOneRightWallGrid == true {
                        
                        wall2InOneRightWallGrid2 = true
                        
                        oneGrid!.alpha = 0
                        
                        wall2!.position = oneRightWallGrid!.position
                        wallShadow2!.position.x = oneRightWallGrid!.position.x
                        wallShadow2!.position.y = oneRightWallGrid!.position.y - 8
                        
                    }
                    
                        if wall2effectsAllowed == true {
                            
                            if wall2!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.wall2!.position.x, y: self.wall2!.position.y), rotation: 0)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        wall2!.run(rampseq)
                                
                        }
                    }
                }
                  
                    if wall2InOneLeftWallGrid == false || wall2InOneRightWallGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    if oneGrid!.alpha != 0 && ramp2InOneRampGrid == true {
                    
                        ramp2!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp2!.size.width - 14, height: ramp2!.size.height + 90), center: CGPoint(x: 0, y: -21))
                    
                    ramp2!.physicsBody?.isDynamic = false
                    ramp2!.physicsBody?.friction = 1
                    
                    if ramp2effectsAllowed == true {
                        
                        if ramp2!.contains(location!){
                        
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.ramp2!.position.x, y: self.ramp2!.position.y), rotation: -0.785398163)
                    
                            }
                            
                            let wait = SKAction.wait(forDuration: 0.001)
                            
                            let rampseq = SKAction.sequence([wait, explosion])
                            
                            ramp2!.run(rampseq)
                        }
                    }
                    
                    ramp2InOneRampGrid2 = true
                    
                    oneGrid!.alpha = 0
                        
                    ramp2!.position = oneRampGrid!.position
                    rampShadow2!.position.x = oneRampGrid!.position.x
                    rampShadow2!.position.y = oneRampGrid!.position.y - 8
                    
                }
                        
                if ramp2InOneRampGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                    
                    if oneGrid!.alpha != 0 && (floor3InOneBottomFloorGrid == true || floor3InOneTopFloorGrid == true) {
                        
                        if floor3InOneBottomFloorGrid == true {
                            
                            floor3InOneBottomfloorGrid2 = true
                            
                            oneGrid!.alpha = 0
                            
                            floor3!.position = oneBottomFloorGrid!.position
                            floorShadow3!.position.y = oneBottomFloorGrid!.position.y - 8
                            floorShadow3!.position.x = oneBottomFloorGrid!.position.x
                            
                            
                        }
                        
                        if floor3InOneTopFloorGrid == true {
                            
                            floor3InOneTopfloorGrid2 = true
                            
                            oneGrid!.alpha = 0
                            
                            floor3!.position = oneTopFloorGrid!.position
                            floorShadow3!.position.y = oneTopFloorGrid!.position.y - 8
                            floorShadow3!.position.x = oneTopFloorGrid!.position.x
                            
                        }
                    
                    floor3!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    floor3!.physicsBody?.isDynamic = false
                    floor3!.physicsBody?.friction = 1
                    
                        if floor3effectsAllowed == true {
                            
                            if floor3!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.floor3!.position.x, y: self.floor3!.position.y), rotation: 1.5708)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        floor3!.run(rampseq)
                                
                            }
                        }
                    }
                    
                    if floor3InOneBottomFloorGrid == false || floor3InOneTopFloorGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                if oneGrid!.alpha != 0 && (wall3InOneRightWallGrid == true || wall3InOneLeftWallGrid == true) {
                        
                    wall3!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    wall3!.physicsBody?.isDynamic = false
                
                    if wall3InOneLeftWallGrid == true {
                        
                        wall3InOneLeftWallGrid2 = true
                        
                        oneGrid!.alpha = 0
                   
                        wall3!.position = oneLeftWallGrid!.position
                        wallShadow3!.position.x = oneLeftWallGrid!.position.x
                        wallShadow3!.position.y = oneLeftWallGrid!.position.y - 8
                        
                    }
                    
                    if wall3InOneRightWallGrid == true {
                        
                        wall3InOneRightWallGrid2 = true
                        
                        oneGrid!.alpha = 0
                        
                        wall3!.position = oneRightWallGrid!.position
                        wallShadow3!.position.x = oneRightWallGrid!.position.x
                        wallShadow3!.position.y = oneRightWallGrid!.position.y - 8
                        
                    }
                    
                        if wall3effectsAllowed == true {
                            
                            if wall3!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.wall3!.position.x, y: self.wall3!.position.y), rotation: 0)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        wall3!.run(rampseq)
                                
                        }
                    }
                }
                  
                    if wall3InOneLeftWallGrid == false || wall3InOneRightWallGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    if oneGrid!.alpha != 0 && ramp3InOneRampGrid == true {
                    
                        ramp3!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp3!.size.width - 14, height: ramp3!.size.height + 90), center: CGPoint(x: 0, y: -21))
                    
                    ramp3!.physicsBody?.isDynamic = false
                    ramp3!.physicsBody?.friction = 1
                    
                    if ramp3effectsAllowed == true {
                        
                        if ramp3!.contains(location!){
                        
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.ramp3!.position.x, y: self.ramp3!.position.y), rotation: -0.785398163)
                    
                            }
                            
                            let wait = SKAction.wait(forDuration: 0.001)
                            
                            let rampseq = SKAction.sequence([wait, explosion])
                            
                            ramp3!.run(rampseq)
                        }
                    }
                    
                    ramp3InOneRampGrid2 = true
                    
                    oneGrid!.alpha = 0
                        
                    ramp3!.position = oneRampGrid!.position
                    rampShadow3!.position.x = oneRampGrid!.position.x
                    rampShadow3!.position.y = oneRampGrid!.position.y - 8
                    
                }
                        
                if ramp3InOneRampGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                    
            //
                    
                    if oneGrid!.alpha != 0 && (floor4InOneBottomFloorGrid == true || floor4InOneTopFloorGrid == true) {
                        
                        if floor4InOneBottomFloorGrid == true {
                            
                            floor4InOneBottomfloorGrid2 = true
                            
                            oneGrid!.alpha = 0
                            
                            floor4!.position = oneBottomFloorGrid!.position
                            floorShadow4!.position.y = oneBottomFloorGrid!.position.y - 8
                            floorShadow4!.position.x = oneBottomFloorGrid!.position.x
                            
                            
                        }
                        
                        if floor4InOneTopFloorGrid == true {
                            
                            floor4InOneTopfloorGrid2 = true
                            
                            oneGrid!.alpha = 0
                            
                            floor4!.position = oneTopFloorGrid!.position
                            floorShadow4!.position.y = oneTopFloorGrid!.position.y - 8
                            floorShadow4!.position.x = oneTopFloorGrid!.position.x
                            
                        }
                    
                    floor4!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    floor4!.physicsBody?.isDynamic = false
                    floor4!.physicsBody?.friction = 1
                    
                        if floor4effectsAllowed == true {
                            
                            if floor4!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.floor4!.position.x, y: self.floor4!.position.y), rotation: 1.5708)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        floor4!.run(rampseq)
                                
                            }
                        }
                    }
                    
                    if floor4InOneBottomFloorGrid == false || floor4InOneTopFloorGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                if oneGrid!.alpha != 0 && (wall4InOneRightWallGrid == true || wall4InOneLeftWallGrid == true) {
                        
                    wall4!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    wall4!.physicsBody?.isDynamic = false
                
                    if wall4InOneLeftWallGrid == true {
                        
                        wall4InOneLeftWallGrid2 = true
                        
                        oneGrid!.alpha = 0
                   
                        wall4!.position = oneLeftWallGrid!.position
                        wallShadow4!.position.x = oneLeftWallGrid!.position.x
                        wallShadow4!.position.y = oneLeftWallGrid!.position.y - 8
                        
                    }
                    
                    if wall4InOneRightWallGrid == true {
                        
                        wall4InOneRightWallGrid2 = true
                        
                        oneGrid!.alpha = 0
                        
                        wall4!.position = oneRightWallGrid!.position
                        wallShadow4!.position.x = oneRightWallGrid!.position.x
                        wallShadow4!.position.y = oneRightWallGrid!.position.y - 8
                        
                    }
                    
                        if wall4effectsAllowed == true {
                            
                            if wall4!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.wall4!.position.x, y: self.wall4!.position.y), rotation: 0)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        wall4!.run(rampseq)
                                
                        }
                    }
                }
                  
                    if wall4InOneLeftWallGrid == false || wall4InOneRightWallGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    if oneGrid!.alpha != 0 && ramp4InOneRampGrid == true {
                    
                        ramp4!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp4!.size.width - 14, height: ramp4!.size.height + 90), center: CGPoint(x: 0, y: -21))
                    
                    ramp4!.physicsBody?.isDynamic = false
                    ramp4!.physicsBody?.friction = 1
                    
                    if ramp4effectsAllowed == true {
                        
                        if ramp4!.contains(location!){
                        
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.ramp4!.position.x, y: self.ramp4!.position.y), rotation: -0.785398163)
                    
                            }
                            
                            let wait = SKAction.wait(forDuration: 0.001)
                            
                            let rampseq = SKAction.sequence([wait, explosion])
                            
                            ramp4!.run(rampseq)
                        }
                    }
                    
                    ramp4InOneRampGrid2 = true
                    
                    oneGrid!.alpha = 0
                        
                    ramp4!.position = oneRampGrid!.position
                    rampShadow4!.position.x = oneRampGrid!.position.x
                    rampShadow4!.position.y = oneRampGrid!.position.y - 8
                    
                }
                        
                if ramp4InOneRampGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                    
                    
                    
            //MARK: Grid Two
                    if twoGrid!.alpha != 0 && (floorInTwoBottomFloorGrid == true || floorInTwoTopFloorGrid == true) {
                        
                        if floorInTwoBottomFloorGrid == true {
                            
                            floorInTwoBottomfloorGrid2 = true
                            
                            twoGrid!.alpha = 0
                            
                            floor!.position = twoBottomFloorGrid!.position
                            floorShadow!.position.y = twoBottomFloorGrid!.position.y - 8
                            floorShadow!.position.x = twoBottomFloorGrid!.position.x
                            
                            
                        }
                        
                        if floorInTwoTopFloorGrid == true {
                            
                            floorInTwoTopfloorGrid2 = true
                            
                            twoGrid!.alpha = 0
                            
                            floor!.position = twoTopFloorGrid!.position
                            floorShadow!.position.y = twoTopFloorGrid!.position.y - 8
                            floorShadow!.position.x = twoTopFloorGrid!.position.x
                            
                        }
                    
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
                    
                    if floorInTwoBottomFloorGrid == false || floorInTwoTopFloorGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                if twoGrid!.alpha != 0 && (wallInTwoRightWallGrid == true || wallInTwoLeftWallGrid == true) {
                        
                    wall!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    wall!.physicsBody?.isDynamic = false
                
                    if wallInTwoLeftWallGrid == true {
                        
                        wallInTwoLeftWallGrid2 = true
                        
                        twoGrid!.alpha = 0
                   
                        wall!.position = twoLeftWallGrid!.position
                        wallShadow!.position.x = twoLeftWallGrid!.position.x
                        wallShadow!.position.y = twoLeftWallGrid!.position.y - 8
                        
                    }
                    
                    if wallInTwoRightWallGrid == true {
                        
                        wallInTwoRightWallGrid2 = true
                        
                        twoGrid!.alpha = 0
                        
                        wall!.position = twoRightWallGrid!.position
                        wallShadow!.position.x = twoRightWallGrid!.position.x
                        wallShadow!.position.y = twoRightWallGrid!.position.y - 8
                        
                    }
                    
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
                  
                    if wallInTwoLeftWallGrid == false || wallInTwoRightWallGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    if twoGrid!.alpha != 0 && rampInTwoRampGrid == true {
                    
                        ramp!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp!.size.width - 14, height: ramp!.size.height + 90), center: CGPoint(x: 0, y: -21))
                    
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
                    
                    rampInTwoRampGrid2 = true
                    
                    twoGrid!.alpha = 0
                    
                    ramp!.position = twoRampGrid!.position
                    rampShadow!.position.x = twoRampGrid!.position.x
                    rampShadow!.position.y = twoRampGrid!.position.y - 8
                    
                }
                        
                if rampInTwoRampGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                        
                        if twoGrid!.alpha != 0 && (floor2InTwoBottomFloorGrid == true || floor2InTwoTopFloorGrid == true) {
                            
                            if floor2InTwoBottomFloorGrid == true {
                                
                                floor2InTwoBottomfloorGrid2 = true
                                
                                twoGrid!.alpha = 0
                                
                                floor2!.position = twoBottomFloorGrid!.position
                                floorShadow2!.position.y = twoBottomFloorGrid!.position.y - 8
                                floorShadow2!.position.x = twoBottomFloorGrid!.position.x
                                
                                
                            }
                            
                            if floor2InTwoTopFloorGrid == true {
                                
                                floor2InTwoTopfloorGrid2 = true
                                
                                twoGrid!.alpha = 0
                                
                                floor2!.position = twoTopFloorGrid!.position
                                floorShadow2!.position.y = twoTopFloorGrid!.position.y - 8
                                floorShadow2!.position.x = twoTopFloorGrid!.position.x
                                
                            }
                        
                        floor2!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                        floor2!.physicsBody?.isDynamic = false
                        floor2!.physicsBody?.friction = 1
                        
                            if floor2effectsAllowed == true {
                                
                                if floor2!.contains(location!){
                                    
                                    let explosion = SKAction.run {
                                        self.explosionEmitter(position: CGPoint(x: self.floor2!.position.x, y: self.floor2!.position.y), rotation: 1.5708)
                                    
                                            }
                                            
                                            let wait = SKAction.wait(forDuration: 0.001)
                                            
                                            let rampseq = SKAction.sequence([wait, explosion])
                                            
                                            floor2!.run(rampseq)
                                    
                                }
                            }
                        }
                        
                        if floor2InTwoBottomFloorGrid == false || floor2InTwoTopFloorGrid == false {
                            
                            player!.physicsBody?.isDynamic = true
                            
                        }
                        
                    if twoGrid!.alpha != 0 && (wall2InTwoRightWallGrid == true || wall2InTwoLeftWallGrid == true) {
                            
                        wall2!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                        wall2!.physicsBody?.isDynamic = false
                    
                        if wall2InTwoLeftWallGrid == true {
                            
                            wall2InTwoLeftWallGrid2 = true
                            
                            twoGrid!.alpha = 0
                            
                            wall2!.position = twoLeftWallGrid!.position
                            wallShadow2!.position.x = twoLeftWallGrid!.position.x
                            wallShadow2!.position.y = twoLeftWallGrid!.position.y - 8
                            
                        }
                        
                        if wall2InTwoRightWallGrid == true {
                            
                            wall2InTwoRightWallGrid2 = true
                            
                            twoGrid!.alpha = 0
                            
                            wall2!.position = twoRightWallGrid!.position
                            wallShadow2!.position.x = twoRightWallGrid!.position.x
                            wallShadow2!.position.y = twoRightWallGrid!.position.y - 8
                            
                        }
                        
                            if wall2effectsAllowed == true {
                                
                                if wall2!.contains(location!){
                                    
                                    let explosion = SKAction.run {
                                        self.explosionEmitter(position: CGPoint(x: self.wall2!.position.x, y: self.wall2!.position.y), rotation: 0)
                                    
                                            }
                                            
                                            let wait = SKAction.wait(forDuration: 0.001)
                                            
                                            let rampseq = SKAction.sequence([wait, explosion])
                                            
                                            wall2!.run(rampseq)
                                    
                            }
                        }
                    }
                      
                        if wall2InTwoLeftWallGrid == false || wall2InTwoRightWallGrid == false {
                            
                            player!.physicsBody?.isDynamic = true
                            
                        }
                        
                        if twoGrid!.alpha != 0 && ramp2InTwoRampGrid == true {
                        
                            ramp2!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp2!.size.width - 14, height: ramp2!.size.height + 90), center: CGPoint(x: 0, y: -21))
                        
                        ramp2!.physicsBody?.isDynamic = false
                        ramp2!.physicsBody?.friction = 1
                        
                        if ramp2effectsAllowed == true {
                            
                            if ramp2!.contains(location!){
                            
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.ramp2!.position.x, y: self.ramp2!.position.y), rotation: -0.785398163)
                        
                                }
                                
                                let wait = SKAction.wait(forDuration: 0.001)
                                
                                let rampseq = SKAction.sequence([wait, explosion])
                                
                                ramp2!.run(rampseq)
                            }
                        }
                        
                        ramp2InTwoRampGrid2 = true
                        
                        twoGrid!.alpha = 0
                            
                        ramp2!.position = twoRampGrid!.position
                        rampShadow2!.position.x = twoRampGrid!.position.x
                        rampShadow2!.position.y = twoRampGrid!.position.y - 8
                        
                    }
                            
                    if ramp2InTwoRampGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                        
                        if twoGrid!.alpha != 0 && (floor3InTwoBottomFloorGrid == true || floor3InTwoTopFloorGrid == true) {
                            
                            if floor3InTwoBottomFloorGrid == true {
                                
                                floor3InTwoBottomfloorGrid2 = true
                                
                                twoGrid!.alpha = 0
                                
                                floor3!.position = twoBottomFloorGrid!.position
                                floorShadow3!.position.y = twoBottomFloorGrid!.position.y - 8
                                floorShadow3!.position.x = twoBottomFloorGrid!.position.x
                                
                                
                            }
                            
                            if floor3InTwoTopFloorGrid == true {
                                
                                floor3InTwoTopfloorGrid2 = true
                                
                                twoGrid!.alpha = 0
                                
                                floor3!.position = twoTopFloorGrid!.position
                                floorShadow3!.position.y = twoTopFloorGrid!.position.y - 8
                                floorShadow3!.position.x = twoTopFloorGrid!.position.x
                                
                            }
                        
                        floor3!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                        floor3!.physicsBody?.isDynamic = false
                        floor3!.physicsBody?.friction = 1
                        
                            if floor3effectsAllowed == true {
                                
                                if floor3!.contains(location!){
                                    
                                    let explosion = SKAction.run {
                                        self.explosionEmitter(position: CGPoint(x: self.floor3!.position.x, y: self.floor3!.position.y), rotation: 1.5708)
                                    
                                            }
                                            
                                            let wait = SKAction.wait(forDuration: 0.001)
                                            
                                            let rampseq = SKAction.sequence([wait, explosion])
                                            
                                            floor3!.run(rampseq)
                                    
                                }
                            }
                        }
                        
                        if floor3InTwoBottomFloorGrid == false || floor3InTwoTopFloorGrid == false {
                            
                            player!.physicsBody?.isDynamic = true
                            
                        }
                        
                    if twoGrid!.alpha != 0 && (wall3InTwoRightWallGrid == true || wall3InTwoLeftWallGrid == true) {
                            
                        wall3!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                        wall3!.physicsBody?.isDynamic = false
                    
                        if wall3InTwoLeftWallGrid == true {
                            
                            wall3InTwoLeftWallGrid2 = true
                            
                            twoGrid!.alpha = 0
                       
                            wall3!.position = twoLeftWallGrid!.position
                            wallShadow3!.position.x = twoLeftWallGrid!.position.x
                            wallShadow3!.position.y = twoLeftWallGrid!.position.y - 8
                            
                        }
                        
                        if wall3InTwoRightWallGrid == true {
                            
                            wall3InTwoRightWallGrid2 = true
                            
                            twoGrid!.alpha = 0
                            
                            wall3!.position = twoRightWallGrid!.position
                            wallShadow3!.position.x = twoRightWallGrid!.position.x
                            wallShadow3!.position.y = twoRightWallGrid!.position.y - 8
                            
                        }
                        
                            if wall3effectsAllowed == true {
                                
                                if wall3!.contains(location!){
                                    
                                    let explosion = SKAction.run {
                                        self.explosionEmitter(position: CGPoint(x: self.wall3!.position.x, y: self.wall3!.position.y), rotation: 0)
                                    
                                            }
                                            
                                            let wait = SKAction.wait(forDuration: 0.001)
                                            
                                            let rampseq = SKAction.sequence([wait, explosion])
                                            
                                            wall3!.run(rampseq)
                                    
                            }
                        }
                    }
                      
                        if wall3InTwoLeftWallGrid == false || wall3InTwoRightWallGrid == false {
                            
                            player!.physicsBody?.isDynamic = true
                            
                        }
                        
                        if twoGrid!.alpha != 0 && ramp3InTwoRampGrid == true {
                        
                            ramp3!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp3!.size.width - 14, height: ramp3!.size.height + 90), center: CGPoint(x: 0, y: -21))
                        
                        ramp3!.physicsBody?.isDynamic = false
                        ramp3!.physicsBody?.friction = 1
                        
                        if ramp3effectsAllowed == true {
                            
                            if ramp3!.contains(location!){
                            
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.ramp3!.position.x, y: self.ramp3!.position.y), rotation: -0.785398163)
                        
                                }
                                
                                let wait = SKAction.wait(forDuration: 0.001)
                                
                                let rampseq = SKAction.sequence([wait, explosion])
                                
                                ramp3!.run(rampseq)
                            }
                        }
                        
                        ramp3InTwoRampGrid2 = true
                            
                        twoGrid!.alpha = 0
                            
                        ramp3!.position = twoRampGrid!.position
                        rampShadow3!.position.x = twoRampGrid!.position.x
                        rampShadow3!.position.y = twoRampGrid!.position.y - 8
                        
                    }
                            
                    if ramp3InTwoRampGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    //
                    
                    if twoGrid!.alpha != 0 && (floor4InTwoBottomFloorGrid == true || floor4InTwoTopFloorGrid == true) {
                        
                        if floor4InTwoBottomFloorGrid == true {
                            
                            floor4InTwoBottomfloorGrid2 = true
                            
                            twoGrid!.alpha = 0
                            
                            floor4!.position = twoBottomFloorGrid!.position
                            floorShadow4!.position.y = twoBottomFloorGrid!.position.y - 8
                            floorShadow4!.position.x = twoBottomFloorGrid!.position.x
                            
                            
                        }
                        
                        if floor4InTwoTopFloorGrid == true {
                            
                            floor4InTwoTopfloorGrid2 = true
                            
                            twoGrid!.alpha = 0
                            
                            floor4!.position = twoTopFloorGrid!.position
                            floorShadow4!.position.y = twoTopFloorGrid!.position.y - 8
                            floorShadow4!.position.x = twoTopFloorGrid!.position.x
                            
                        }
                    
                    floor4!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    floor4!.physicsBody?.isDynamic = false
                    floor4!.physicsBody?.friction = 1
                    
                        if floor4effectsAllowed == true {
                            
                            if floor4!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.floor4!.position.x, y: self.floor4!.position.y), rotation: 1.5708)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        floor4!.run(rampseq)
                                
                            }
                        }
                    }
                    
                    if floor4InTwoBottomFloorGrid == false || floor4InTwoTopFloorGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                if twoGrid!.alpha != 0 && (wall4InTwoRightWallGrid == true || wall4InTwoLeftWallGrid == true) {
                        
                    wall4!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    wall4!.physicsBody?.isDynamic = false
                
                    if wall4InTwoLeftWallGrid == true {
                        
                        wall4InTwoLeftWallGrid2 = true
                        
                        twoGrid!.alpha = 0
                   
                        wall4!.position = twoLeftWallGrid!.position
                        wallShadow4!.position.x = twoLeftWallGrid!.position.x
                        wallShadow4!.position.y = twoLeftWallGrid!.position.y - 8
                        
                    }
                    
                    if wall4InTwoRightWallGrid == true {
                        
                        wall4InTwoRightWallGrid2 = true
                        
                        twoGrid!.alpha = 0
                        
                        wall4!.position = twoRightWallGrid!.position
                        wallShadow4!.position.x = twoRightWallGrid!.position.x
                        wallShadow4!.position.y = twoRightWallGrid!.position.y - 8
                        
                    }
                    
                        if wall4effectsAllowed == true {
                            
                            if wall4!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.wall4!.position.x, y: self.wall4!.position.y), rotation: 0)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        wall4!.run(rampseq)
                                
                        }
                    }
                }
                  
                    if wall4InTwoLeftWallGrid == false || wall4InTwoRightWallGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    if twoGrid!.alpha != 0 && ramp4InTwoRampGrid == true {
                    
                        ramp4!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp4!.size.width - 14, height: ramp4!.size.height + 90), center: CGPoint(x: 0, y: -21))
                    
                    ramp4!.physicsBody?.isDynamic = false
                    ramp4!.physicsBody?.friction = 1
                    
                    if ramp4effectsAllowed == true {
                        
                        if ramp4!.contains(location!){
                        
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.ramp4!.position.x, y: self.ramp4!.position.y), rotation: -0.785398163)
                    
                            }
                            
                            let wait = SKAction.wait(forDuration: 0.001)
                            
                            let rampseq = SKAction.sequence([wait, explosion])
                            
                            ramp4!.run(rampseq)
                        }
                    }
                    
                    ramp4InTwoRampGrid2 = true
                        
                    twoGrid!.alpha = 0
                        
                    ramp4!.position = twoRampGrid!.position
                    rampShadow4!.position.x = twoRampGrid!.position.x
                    rampShadow4!.position.y = twoRampGrid!.position.y - 8
                    
                }
                        
                if ramp4InTwoRampGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                
                
                
                //MARK: Grid Three
                    if threeGrid!.alpha != 0 && (floorInThreeBottomFloorGrid == true || floorInThreeTopFloorGrid == true) {
                        
                        if floorInThreeBottomFloorGrid == true {
                            
                            floorInThreeBottomfloorGrid2 = true
                            
                            threeGrid!.alpha = 0
                            
                            floor!.position = threeBottomFloorGrid!.position
                            floorShadow!.position.y = threeBottomFloorGrid!.position.y - 8
                            floorShadow!.position.x = threeBottomFloorGrid!.position.x
                            
                            
                        }
                        
                        if floorInThreeTopFloorGrid == true {
                            
                            floorInThreeTopfloorGrid2 = true
                            
                            threeGrid!.alpha = 0
                            
                            floor!.position = threeTopFloorGrid!.position
                            floorShadow!.position.y = threeTopFloorGrid!.position.y - 8
                            floorShadow!.position.x = threeTopFloorGrid!.position.x
                            
                        }
                    
                    floor!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    floor!.physicsBody?.isDynamic = false
                    floor!.physicsBody?.friction = 1
                    
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
                    
                    if floorInThreeBottomFloorGrid == false || floorInThreeTopFloorGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                if threeGrid!.alpha != 0 && (wallInThreeRightWallGrid == true || wallInThreeLeftWallGrid == true) {
                        
                    wall!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    wall!.physicsBody?.isDynamic = false
                
                    if wallInThreeLeftWallGrid == true {
                        
                        wallInThreeLeftWallGrid2 = true
                        
                        threeGrid!.alpha = 0
                   
                        wall!.position = threeLeftWallGrid!.position
                        wallShadow!.position.x = threeLeftWallGrid!.position.x
                        wallShadow!.position.y = threeLeftWallGrid!.position.y - 8
                        
                    }
                    
                    if wallInThreeRightWallGrid == true {
                        
                        wallInThreeRightWallGrid2 = true
                        
                        threeGrid!.alpha = 0
                        
                        wall!.position = threeRightWallGrid!.position
                        wallShadow!.position.x = threeRightWallGrid!.position.x
                        wallShadow!.position.y = threeRightWallGrid!.position.y - 8
                        
                    }
                    
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
                  
                    if wallInThreeLeftWallGrid == false || wallInThreeRightWallGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    if threeGrid!.alpha != 0 && rampInThreeRampGrid == true {
                    
                        ramp!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp!.size.width - 14, height: ramp!.size.height + 90), center: CGPoint(x: 0, y: -21))
                    
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
                    
                    rampInThreeRampGrid2 = true
                        
                    threeGrid!.alpha = 0
                        
                    ramp!.position = threeRampGrid!.position
                    rampShadow!.position.x = threeRampGrid!.position.x
                    rampShadow!.position.y = threeRampGrid!.position.y - 8
                    
                }
                        
                if rampInThreeRampGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                        
                        if threeGrid!.alpha != 0 && (floor2InThreeBottomFloorGrid == true || floor2InThreeTopFloorGrid == true) {
                            
                            if floor2InThreeBottomFloorGrid == true {
                                
                                floor2InThreeBottomfloorGrid2 = true
                                
                                threeGrid!.alpha = 0
                                
                                floor2!.position = threeBottomFloorGrid!.position
                                floorShadow2!.position.y = threeBottomFloorGrid!.position.y - 8
                                floorShadow2!.position.x = threeBottomFloorGrid!.position.x
                                
                                
                            }
                            
                            if floor2InThreeTopFloorGrid == true {
                                
                                floor2InThreeTopfloorGrid2 = true
                                
                                threeGrid!.alpha = 0
                                
                                floor2!.position = threeTopFloorGrid!.position
                                floorShadow2!.position.y = threeTopFloorGrid!.position.y - 8
                                floorShadow2!.position.x = threeTopFloorGrid!.position.x
                                
                            }
                        
                        floor2!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                        floor2!.physicsBody?.isDynamic = false
                        floor2!.physicsBody?.friction = 1
                        
                            if floor2effectsAllowed == true {
                                
                                if floor2!.contains(location!){
                                    
                                    let explosion = SKAction.run {
                                        self.explosionEmitter(position: CGPoint(x: self.floor2!.position.x, y: self.floor2!.position.y), rotation: 1.5708)
                                    
                                            }
                                            
                                            let wait = SKAction.wait(forDuration: 0.001)
                                            
                                            let rampseq = SKAction.sequence([wait, explosion])
                                            
                                            floor2!.run(rampseq)
                                    
                                }
                            }
                        }
                        
                        if floor2InThreeBottomFloorGrid == false || floor2InThreeTopFloorGrid == false {
                            
                            player!.physicsBody?.isDynamic = true
                            
                        }
                        
                    if threeGrid!.alpha != 0 && (wall2InThreeRightWallGrid == true || wall2InThreeLeftWallGrid == true) {
                            
                        wall2!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                        wall2!.physicsBody?.isDynamic = false
                    
                        if wall2InThreeLeftWallGrid == true {
                            
                            wall2InThreeLeftWallGrid2 = true
                            
                            threeGrid!.alpha = 0
                            
                            wall2!.position = threeLeftWallGrid!.position
                            wallShadow2!.position.x = threeLeftWallGrid!.position.x
                            wallShadow2!.position.y = threeLeftWallGrid!.position.y - 8
                            
                        }
                        
                        if wall2InThreeRightWallGrid == true {
                            
                            wall2InThreeRightWallGrid2 = true
                            
                            threeGrid!.alpha = 0
                            
                            wall2!.position = threeRightWallGrid!.position
                            wallShadow2!.position.x = threeRightWallGrid!.position.x
                            wallShadow2!.position.y = threeRightWallGrid!.position.y - 8
                            
                        }
                        
                            if wall2effectsAllowed == true {
                                
                                if wall2!.contains(location!){
                                    
                                    let explosion = SKAction.run {
                                        self.explosionEmitter(position: CGPoint(x: self.wall2!.position.x, y: self.wall2!.position.y), rotation: 0)
                                    
                                            }
                                            
                                            let wait = SKAction.wait(forDuration: 0.001)
                                            
                                            let rampseq = SKAction.sequence([wait, explosion])
                                            
                                            wall2!.run(rampseq)
                                    
                            }
                        }
                    }
                      
                        if wall2InThreeLeftWallGrid == false || wall2InThreeRightWallGrid == false {
                            
                            player!.physicsBody?.isDynamic = true
                            
                        }
                        
                        if threeGrid!.alpha != 0 && ramp2InThreeRampGrid == true {
                        
                            ramp2!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp2!.size.width - 14, height: ramp2!.size.height + 90), center: CGPoint(x: 0, y: -21))
                        
                        ramp2!.physicsBody?.isDynamic = false
                        ramp2!.physicsBody?.friction = 1
                        
                        if ramp2effectsAllowed == true {
                            
                            if ramp2!.contains(location!){
                            
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.ramp2!.position.x, y: self.ramp2!.position.y), rotation: -0.785398163)
                        
                                }
                                
                                let wait = SKAction.wait(forDuration: 0.001)
                                
                                let rampseq = SKAction.sequence([wait, explosion])
                                
                                ramp2!.run(rampseq)
                            }
                        }
                        
                        ramp2InThreeRampGrid2 = true
                        
                        threeGrid!.alpha = 0
                            
                        ramp2!.position = threeRampGrid!.position
                        rampShadow2!.position.x = threeRampGrid!.position.x
                        rampShadow2!.position.y = threeRampGrid!.position.y - 8
                        
                    }
                            
                    if ramp2InThreeRampGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                        
                        if threeGrid!.alpha != 0 && (floor3InThreeBottomFloorGrid == true || floor3InThreeTopFloorGrid == true) {
                            
                            if floor3InThreeBottomFloorGrid == true {
                                
                                floor3InThreeBottomfloorGrid2 = true
                                
                                threeGrid!.alpha = 0
                                
                                floor3!.position = threeBottomFloorGrid!.position
                                floorShadow3!.position.y = threeBottomFloorGrid!.position.y - 8
                                floorShadow3!.position.x = threeBottomFloorGrid!.position.x
                                
                                
                            }
                            
                            if floor3InThreeTopFloorGrid == true {
                                
                                floor3InThreeTopfloorGrid2 = true
                                
                                threeGrid!.alpha = 0
                                
                                floor3!.position = threeTopFloorGrid!.position
                                floorShadow3!.position.y = threeTopFloorGrid!.position.y - 8
                                floorShadow3!.position.x = threeTopFloorGrid!.position.x
                                
                            }
                        
                        floor3!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                        floor3!.physicsBody?.isDynamic = false
                        floor3!.physicsBody?.friction = 1
                        
                            if floor3effectsAllowed == true {
                                
                                if floor3!.contains(location!){
                                    
                                    let explosion = SKAction.run {
                                        self.explosionEmitter(position: CGPoint(x: self.floor3!.position.x, y: self.floor3!.position.y), rotation: 1.5708)
                                    
                                            }
                                            
                                            let wait = SKAction.wait(forDuration: 0.001)
                                            
                                            let rampseq = SKAction.sequence([wait, explosion])
                                            
                                            floor3!.run(rampseq)
                                    
                                }
                            }
                        }
                        
                        if floor3InThreeBottomFloorGrid == false || floor3InThreeTopFloorGrid == false {
                            
                            player!.physicsBody?.isDynamic = true
                            
                        }
                        
                    if threeGrid!.alpha != 0 && (wall3InThreeRightWallGrid == true || wall3InThreeLeftWallGrid == true) {
                            
                        wall3!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                        wall3!.physicsBody?.isDynamic = false
                    
                        if wall3InThreeLeftWallGrid == true {
                            
                            wall3InThreeLeftWallGrid2 = true
                            
                            threeGrid!.alpha = 0
                       
                            wall3!.position = threeLeftWallGrid!.position
                            wallShadow3!.position.x = threeLeftWallGrid!.position.x
                            wallShadow3!.position.y = threeLeftWallGrid!.position.y - 8
                            
                        }
                        
                        if wall3InThreeRightWallGrid == true {
                            
                            wall3InThreeRightWallGrid2 = true
                            
                            threeGrid!.alpha = 0
                            
                            wall3!.position = threeRightWallGrid!.position
                            wallShadow3!.position.x = threeRightWallGrid!.position.x
                            wallShadow3!.position.y = threeRightWallGrid!.position.y - 8
                            
                        }
                        
                            if wall3effectsAllowed == true {
                                
                                if wall3!.contains(location!){
                                    
                                    let explosion = SKAction.run {
                                        self.explosionEmitter(position: CGPoint(x: self.wall3!.position.x, y: self.wall3!.position.y), rotation: 0)
                                    
                                            }
                                            
                                            let wait = SKAction.wait(forDuration: 0.001)
                                            
                                            let rampseq = SKAction.sequence([wait, explosion])
                                            
                                            wall3!.run(rampseq)
                                    
                            }
                        }
                    }
                      
                        if wall3InThreeLeftWallGrid == false || wall3InThreeRightWallGrid == false {
                            
                            player!.physicsBody?.isDynamic = true
                            
                        }
                        
                        if threeGrid!.alpha != 0 && ramp3InThreeRampGrid == true {
                        
                            ramp3!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp3!.size.width - 14, height: ramp3!.size.height + 90), center: CGPoint(x: 0, y: -21))
                        
                        ramp3!.physicsBody?.isDynamic = false
                        ramp3!.physicsBody?.friction = 1
                        
                        if ramp3effectsAllowed == true {
                            
                            if ramp3!.contains(location!){
                            
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.ramp3!.position.x, y: self.ramp3!.position.y), rotation: -0.785398163)
                        
                                }
                                
                                let wait = SKAction.wait(forDuration: 0.001)
                                
                                let rampseq = SKAction.sequence([wait, explosion])
                                
                                ramp3!.run(rampseq)
                            }
                        }
                        
                        ramp3InThreeRampGrid2 = true
                        
                            threeGrid!.alpha = 0
                            
                        ramp3!.position = threeRampGrid!.position
                        rampShadow3!.position.x = threeRampGrid!.position.x
                        rampShadow3!.position.y = threeRampGrid!.position.y - 8
                        
                    }
                            
                    if ramp3InThreeRampGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    //
                    
                    if threeGrid!.alpha != 0 && (floor4InThreeBottomFloorGrid == true || floor4InThreeTopFloorGrid == true) {
                        
                        if floor4InThreeBottomFloorGrid == true {
                            
                            floor4InThreeBottomfloorGrid2 = true
                            
                            threeGrid!.alpha = 0
                            
                            floor4!.position = threeBottomFloorGrid!.position
                            floorShadow4!.position.y = threeBottomFloorGrid!.position.y - 8
                            floorShadow4!.position.x = threeBottomFloorGrid!.position.x
                            
                            
                        }
                        
                        if floor4InThreeTopFloorGrid == true {
                            
                            floor4InThreeTopfloorGrid2 = true
                            
                            threeGrid!.alpha = 0
                            
                            floor4!.position = threeTopFloorGrid!.position
                            floorShadow4!.position.y = threeTopFloorGrid!.position.y - 8
                            floorShadow4!.position.x = threeTopFloorGrid!.position.x
                            
                        }
                    
                    floor4!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    floor4!.physicsBody?.isDynamic = false
                    floor4!.physicsBody?.friction = 1
                    
                        if floor4effectsAllowed == true {
                            
                            if floor4!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.floor4!.position.x, y: self.floor4!.position.y), rotation: 1.5708)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        floor4!.run(rampseq)
                                
                            }
                        }
                    }
                    
                    if floor4InThreeBottomFloorGrid == false || floor4InThreeTopFloorGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                if threeGrid!.alpha != 0 && (wall4InThreeRightWallGrid == true || wall4InThreeLeftWallGrid == true) {
                        
                    wall4!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    wall4!.physicsBody?.isDynamic = false
                
                    if wall4InThreeLeftWallGrid == true {
                        
                        wall4InThreeLeftWallGrid2 = true
                        
                        threeGrid!.alpha = 0
                   
                        wall4!.position = threeLeftWallGrid!.position
                        wallShadow4!.position.x = threeLeftWallGrid!.position.x
                        wallShadow4!.position.y = threeLeftWallGrid!.position.y - 8
                        
                    }
                    
                    if wall4InThreeRightWallGrid == true {
                        
                        wall4InThreeRightWallGrid2 = true
                        
                        threeGrid!.alpha = 0
                        
                        wall4!.position = threeRightWallGrid!.position
                        wallShadow4!.position.x = threeRightWallGrid!.position.x
                        wallShadow4!.position.y = threeRightWallGrid!.position.y - 8
                        
                    }
                    
                        if wall4effectsAllowed == true {
                            
                            if wall4!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.wall4!.position.x, y: self.wall4!.position.y), rotation: 0)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        wall4!.run(rampseq)
                                
                        }
                    }
                }
                  
                    if wall4InThreeLeftWallGrid == false || wall4InThreeRightWallGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    if threeGrid!.alpha != 0 && ramp4InThreeRampGrid == true {
                    
                        ramp4!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp4!.size.width - 14, height: ramp4!.size.height + 90), center: CGPoint(x: 0, y: -21))
                    
                    ramp4!.physicsBody?.isDynamic = false
                    ramp4!.physicsBody?.friction = 1
                    
                    if ramp4effectsAllowed == true {
                        
                        if ramp4!.contains(location!){
                        
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.ramp4!.position.x, y: self.ramp4!.position.y), rotation: -0.785398163)
                    
                            }
                            
                            let wait = SKAction.wait(forDuration: 0.001)
                            
                            let rampseq = SKAction.sequence([wait, explosion])
                            
                            ramp4!.run(rampseq)
                        }
                    }
                    
                    ramp4InThreeRampGrid2 = true
                    
                        threeGrid!.alpha = 0
                        
                    ramp4!.position = threeRampGrid!.position
                    rampShadow4!.position.x = threeRampGrid!.position.x
                    rampShadow4!.position.y = threeRampGrid!.position.y - 8
                    
                }
                        
                if ramp4InThreeRampGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
        
        
        //MARK: Grid Four
            if fourGrid!.alpha != 0 && (floorInFourBottomFloorGrid == true || floorInFourTopFloorGrid == true) {
                
                if floorInFourBottomFloorGrid == true {
                    
                    floorInFourBottomfloorGrid2 = true
                    
                    fourGrid!.alpha = 0
                    
                    floor!.position = fourBottomFloorGrid!.position
                    floorShadow!.position.y = fourBottomFloorGrid!.position.y - 8
                    floorShadow!.position.x = fourBottomFloorGrid!.position.x
                    
                    
                }
                
                if floorInFourTopFloorGrid == true {
                    
                    floorInFourTopfloorGrid2 = true
                    
                    fourGrid!.alpha = 0
                    
                    floor!.position = fourTopFloorGrid!.position
                    floorShadow!.position.y = fourTopFloorGrid!.position.y - 8
                    floorShadow!.position.x = fourTopFloorGrid!.position.x
                    
                }
            
            floor!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
            floor!.physicsBody?.isDynamic = false
            floor!.physicsBody?.friction = 1
            
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
            
            if floorInFourBottomFloorGrid == false || floorInFourTopFloorGrid == false {
                
                player!.physicsBody?.isDynamic = true
                
            }
            
        if fourGrid!.alpha != 0 && (wallInFourRightWallGrid == true || wallInFourLeftWallGrid == true) {
                
            wall!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
            wall!.physicsBody?.isDynamic = false
        
            if wallInFourLeftWallGrid == true {
                
                wallInFourLeftWallGrid2 = true
                
                threeGrid!.alpha = 0
           
                wall!.position = fourLeftWallGrid!.position
                wallShadow!.position.x = fourLeftWallGrid!.position.x
                wallShadow!.position.y = fourLeftWallGrid!.position.y - 8
                
            }
            
            if wallInFourRightWallGrid == true {
                
                wallInFourRightWallGrid2 = true
                
                fourGrid!.alpha = 0
                
                wall!.position = fourRightWallGrid!.position
                wallShadow!.position.x = fourRightWallGrid!.position.x
                wallShadow!.position.y = fourRightWallGrid!.position.y - 8
                
            }
            
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
          
            if wallInFourLeftWallGrid == false || wallInFourRightWallGrid == false {
                
                player!.physicsBody?.isDynamic = true
                
            }
            
            if fourGrid!.alpha != 0 && rampInFourRampGrid == true {
            
                ramp!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp!.size.width - 14, height: ramp!.size.height + 90), center: CGPoint(x: 0, y: -21))
            
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
                
            
            rampInFourRampGrid2 = true
                
            fourGrid!.alpha = 0
                
            ramp!.position = fourRampGrid!.position
            rampShadow!.position.x = fourRampGrid!.position.x
            rampShadow!.position.y = fourRampGrid!.position.y - 8
            
        }
                
        if rampInFourRampGrid == false {
            
            player!.physicsBody?.isDynamic = true
            
        }
                
                if fourGrid!.alpha != 0 && (floor2InFourBottomFloorGrid == true || floor2InFourTopFloorGrid == true) {
                    
                    if floor2InFourBottomFloorGrid == true {
                        
                        floor2InFourBottomfloorGrid2 = true
                        
                        fourGrid!.alpha = 0
                        
                        floor2!.position = fourBottomFloorGrid!.position
                        floorShadow2!.position.y = fourBottomFloorGrid!.position.y - 8
                        floorShadow2!.position.x = fourBottomFloorGrid!.position.x
                        
                        
                    }
                    
                    if floor2InFourTopFloorGrid == true {
                        
                        floor2InFourTopfloorGrid2 = true
                        
                        fourGrid!.alpha = 0
                        
                        floor2!.position = fourTopFloorGrid!.position
                        floorShadow2!.position.y = fourTopFloorGrid!.position.y - 8
                        floorShadow2!.position.x = fourTopFloorGrid!.position.x
                        
                    }
                
                floor2!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                floor2!.physicsBody?.isDynamic = false
                floor2!.physicsBody?.friction = 1
                
                    if floor2effectsAllowed == true {
                        
                        if floor2!.contains(location!){
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.floor2!.position.x, y: self.floor2!.position.y), rotation: 1.5708)
                            
                                    }
                                    
                                    let wait = SKAction.wait(forDuration: 0.001)
                                    
                                    let rampseq = SKAction.sequence([wait, explosion])
                                    
                                    floor2!.run(rampseq)
                            
                        }
                    }
                }
                
                if floor2InFourBottomFloorGrid == false || floor2InFourTopFloorGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                
            if fourGrid!.alpha != 0 && (wall2InFourRightWallGrid == true || wall2InFourLeftWallGrid == true) {
                    
                wall2!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                wall2!.physicsBody?.isDynamic = false
            
                if wall2InFourLeftWallGrid == true {
                    
                    wall2InFourLeftWallGrid2 = true
                    
                    fourGrid!.alpha = 0
                    
                    wall2!.position = fourLeftWallGrid!.position
                    wallShadow2!.position.x = fourLeftWallGrid!.position.x
                    wallShadow2!.position.y = fourLeftWallGrid!.position.y - 8
                    
                }
                
                if wall2InFourRightWallGrid == true {
                    
                    wall2InFourRightWallGrid2 = true
                    
                    fourGrid!.alpha = 0
                    
                    wall2!.position = fourRightWallGrid!.position
                    wallShadow2!.position.x = fourRightWallGrid!.position.x
                    wallShadow2!.position.y = fourRightWallGrid!.position.y - 8
                    
                }
                
                    if wall2effectsAllowed == true {
                        
                        if wall2!.contains(location!){
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.wall2!.position.x, y: self.wall2!.position.y), rotation: 0)
                            
                                    }
                                    
                                    let wait = SKAction.wait(forDuration: 0.001)
                                    
                                    let rampseq = SKAction.sequence([wait, explosion])
                                    
                                    wall2!.run(rampseq)
                            
                    }
                }
            }
              
                if wall2InFourLeftWallGrid == false || wall2InFourRightWallGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                
                if fourGrid!.alpha != 0 && ramp2InFourRampGrid == true {
                
                    ramp2!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp2!.size.width - 14, height: ramp2!.size.height + 90), center: CGPoint(x: 0, y: -21))
                
                ramp2!.physicsBody?.isDynamic = false
                ramp2!.physicsBody?.friction = 1
                
                if ramp2effectsAllowed == true {
                    
                    if ramp2!.contains(location!){
                    
                        
                        let explosion = SKAction.run {
                            self.explosionEmitter(position: CGPoint(x: self.ramp2!.position.x, y: self.ramp2!.position.y), rotation: -0.785398163)
                
                        }
                        
                        let wait = SKAction.wait(forDuration: 0.001)
                        
                        let rampseq = SKAction.sequence([wait, explosion])
                        
                        ramp2!.run(rampseq)
                    }
                }
                
                ramp2InFourRampGrid2 = true
                
                    fourGrid!.alpha = 0
                    
                ramp2!.position = fourRampGrid!.position
                rampShadow2!.position.x = fourRampGrid!.position.x
                rampShadow2!.position.y = fourRampGrid!.position.y - 8
                
            }
                    
            if ramp2InFourRampGrid == false {
                
                player!.physicsBody?.isDynamic = true
                
            }
                
                if fourGrid!.alpha != 0 && (floor3InFourBottomFloorGrid == true || floor3InFourTopFloorGrid == true) {
                    
                    if floor3InFourBottomFloorGrid == true {
                        
                        floor3InFourBottomfloorGrid2 = true
                        
                        fourGrid!.alpha = 0
                        
                        floor3!.position = fourBottomFloorGrid!.position
                        floorShadow3!.position.y = fourBottomFloorGrid!.position.y - 8
                        floorShadow3!.position.x = fourBottomFloorGrid!.position.x
                        
                        
                    }
                    
                    if floor3InFourTopFloorGrid == true {
                        
                        floor3InFourTopfloorGrid2 = true
                        
                        fourGrid!.alpha = 0
                        
                        floor3!.position = fourTopFloorGrid!.position
                        floorShadow3!.position.y = fourTopFloorGrid!.position.y - 8
                        floorShadow3!.position.x = fourTopFloorGrid!.position.x
                        
                    }
                
                floor3!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                floor3!.physicsBody?.isDynamic = false
                floor3!.physicsBody?.friction = 1
                
                    if floor3effectsAllowed == true {
                        
                        if floor3!.contains(location!){
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.floor3!.position.x, y: self.floor3!.position.y), rotation: 1.5708)
                            
                                    }
                                    
                                    let wait = SKAction.wait(forDuration: 0.001)
                                    
                                    let rampseq = SKAction.sequence([wait, explosion])
                                    
                                    floor3!.run(rampseq)
                            
                        }
                    }
                }
                
                if floor3InFourBottomFloorGrid == false || floor3InFourTopFloorGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                
            if fourGrid!.alpha != 0 && (wall3InFourRightWallGrid == true || wall3InFourLeftWallGrid == true) {
                    
                wall3!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                wall3!.physicsBody?.isDynamic = false
            
                if wall3InFourLeftWallGrid == true {
                    
                    wall3InFourLeftWallGrid2 = true
                    
                    fourGrid!.alpha = 0
               
                    wall3!.position = fourLeftWallGrid!.position
                    wallShadow3!.position.x = fourLeftWallGrid!.position.x
                    wallShadow3!.position.y = fourLeftWallGrid!.position.y - 8
                    
                }
                
                if wall3InFourRightWallGrid == true {
                    
                    wall3InFourRightWallGrid2 = true
                    
                    fourGrid!.alpha = 0
                    
                    wall3!.position = fourRightWallGrid!.position
                    wallShadow3!.position.x = fourRightWallGrid!.position.x
                    wallShadow3!.position.y = fourRightWallGrid!.position.y - 8
                    
                }
                
                    if wall3effectsAllowed == true {
                        
                        if wall3!.contains(location!){
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.wall3!.position.x, y: self.wall3!.position.y), rotation: 0)
                            
                                    }
                                    
                                    let wait = SKAction.wait(forDuration: 0.001)
                                    
                                    let rampseq = SKAction.sequence([wait, explosion])
                                    
                                    wall3!.run(rampseq)
                            
                    }
                }
            }
              
                if wall3InFourLeftWallGrid == false || wall3InFourRightWallGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
                }
                
                if fourGrid!.alpha != 0 && ramp3InFourRampGrid == true {
                
                    ramp3!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp3!.size.width - 14, height: ramp3!.size.height + 90), center: CGPoint(x: 0, y: -21))
                
                ramp3!.physicsBody?.isDynamic = false
                ramp3!.physicsBody?.friction = 1
                
                if ramp3effectsAllowed == true {
                    
                    if ramp3!.contains(location!){
                    
                        
                        let explosion = SKAction.run {
                            self.explosionEmitter(position: CGPoint(x: self.ramp3!.position.x, y: self.ramp3!.position.y), rotation: -0.785398163)
                
                        }
                        
                        let wait = SKAction.wait(forDuration: 0.001)
                        
                        let rampseq = SKAction.sequence([wait, explosion])
                        
                        ramp3!.run(rampseq)
                    }
                }
                
                ramp3InFourRampGrid2 = true
                
                    fourGrid!.alpha = 0
                    
                ramp3!.position = fourRampGrid!.position
                rampShadow3!.position.x = fourRampGrid!.position.x
                rampShadow3!.position.y = fourRampGrid!.position.y - 8
                
            }
                    
            if ramp3InFourRampGrid == false {
                
                player!.physicsBody?.isDynamic = true
                
            }
                    
                    if fourGrid!.alpha != 0 && (floor4InFourBottomFloorGrid == true || floor4InFourTopFloorGrid == true) {
                        
                        if floor4InFourBottomFloorGrid == true {
                            
                            floor4InFourBottomfloorGrid2 = true
                            
                            fourGrid!.alpha = 0
                            
                            floor4!.position = fourBottomFloorGrid!.position
                            floorShadow4!.position.y = fourBottomFloorGrid!.position.y - 8
                            floorShadow4!.position.x = fourBottomFloorGrid!.position.x
                            
                            
                        }
                        
                        if floor4InFourTopFloorGrid == true {
                            
                            floor4InFourTopfloorGrid2 = true
                            
                            fourGrid!.alpha = 0
                            
                            floor4!.position = fourTopFloorGrid!.position
                            floorShadow4!.position.y = fourTopFloorGrid!.position.y - 8
                            floorShadow4!.position.x = fourTopFloorGrid!.position.x
                            
                        }
                    
                    floor4!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    floor4!.physicsBody?.isDynamic = false
                    floor4!.physicsBody?.friction = 1
                    
                        if floor4effectsAllowed == true {
                            
                            if floor4!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.floor4!.position.x, y: self.floor4!.position.y), rotation: 1.5708)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        floor4!.run(rampseq)
                                
                            }
                        }
                    }
                    
                    if floor4InFourBottomFloorGrid == false || floor4InFourTopFloorGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                if fourGrid!.alpha != 0 && (wall4InFourRightWallGrid == true || wall4InFourLeftWallGrid == true) {
                        
                    wall4!.physicsBody = SKPhysicsBody(rectangleOf: floor!.size)
                    wall4!.physicsBody?.isDynamic = false
                
                    if wall4InFourLeftWallGrid == true {
                        
                        wall4InFourLeftWallGrid2 = true
                        
                        fourGrid!.alpha = 0
                   
                        wall4!.position = fourLeftWallGrid!.position
                        wallShadow4!.position.x = fourLeftWallGrid!.position.x
                        wallShadow4!.position.y = fourLeftWallGrid!.position.y - 8
                        
                    }
                    
                    if wall4InFourRightWallGrid == true {
                        
                        wall4InFourRightWallGrid2 = true
                        
                        fourGrid!.alpha = 0
                        
                        wall4!.position = fourRightWallGrid!.position
                        wallShadow4!.position.x = fourRightWallGrid!.position.x
                        wallShadow4!.position.y = fourRightWallGrid!.position.y - 8
                        
                    }
                    
                        if wall4effectsAllowed == true {
                            
                            if wall4!.contains(location!){
                                
                                let explosion = SKAction.run {
                                    self.explosionEmitter(position: CGPoint(x: self.wall4!.position.x, y: self.wall4!.position.y), rotation: 0)
                                
                                        }
                                        
                                        let wait = SKAction.wait(forDuration: 0.001)
                                        
                                        let rampseq = SKAction.sequence([wait, explosion])
                                        
                                        wall4!.run(rampseq)
                                
                        }
                    }
                }
                  
                    if wall4InFourLeftWallGrid == false || wall4InFourRightWallGrid == false {
                        
                        player!.physicsBody?.isDynamic = true
                        
                    }
                    
                    if fourGrid!.alpha != 0 && ramp4InFourRampGrid == true {
                    
                        ramp4!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: ramp4!.size.width - 14, height: ramp4!.size.height + 90), center: CGPoint(x: 0, y: -21))
                    
                    ramp4!.physicsBody?.isDynamic = false
                    ramp4!.physicsBody?.friction = 1
                    
                    if ramp4effectsAllowed == true {
                        
                        if ramp4!.contains(location!){
                        
                            
                            let explosion = SKAction.run {
                                self.explosionEmitter(position: CGPoint(x: self.ramp4!.position.x, y: self.ramp4!.position.y), rotation: -0.785398163)
                    
                            }
                            
                            let wait = SKAction.wait(forDuration: 0.001)
                            
                            let rampseq = SKAction.sequence([wait, explosion])
                            
                            ramp4!.run(rampseq)
                        }
                    }
                    
                    ramp4InFourRampGrid2 = true
                    
                        fourGrid!.alpha = 0
                        
                    ramp4!.position = fourRampGrid!.position
                    rampShadow4!.position.x = fourRampGrid!.position.x
                    rampShadow4!.position.y = fourRampGrid!.position.y - 8
                    
                }
                        
                if ramp4InFourRampGrid == false {
                    
                    player!.physicsBody?.isDynamic = true
                    
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
    
    func characterExplodeEmitter(position: CGPoint, rotation: CGFloat) {
        
        let explosion = SKEmitterNode(fileNamed: "playerExplode.sks")
        explosion!.position = CGPoint(x: position.x, y: position.y)
        explosion!.zRotation = rotation
        addChild(explosion!)
        
    }
    
    
    func roundEmitter() {
        
        let explosion = SKEmitterNode(fileNamed: "playerTrail.sks")
        explosion!.position = CGPoint(x: player!.position.x, y: player!.position.y - 30)
        addChild(explosion!)
        
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
        
        spinOneShade!.position.x = spinOne!.position.x
        spinOneShade!.position.y = spinOne!.position.y - 8
        
        spinOneShade!.zRotation = spinOne!.zRotation
        
        spinTwoShade!.position.x = spinTwo!.position.x
        spinTwoShade!.position.y = spinTwo!.position.y - 8
        
        spinTwoShade!.zRotation = spinTwo!.zRotation
        
        moveshade!.position.x = move!.position.x
        moveshade!.position.y = move!.position.y - 8
        
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
  //MARK: ALERT!!!
            let cameraYMove = SKAction.move(to: CGPoint(x: player!.position.x + 200, y: player!.position.y + 200), duration: 2)
            
            // + 1400
            
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
        
        if passedFinishLine == true{
            
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
        
            Star1!.position = CGPoint(x: 400, y: -400)
            
            StarShade1!.position = CGPoint(x: 400, y: -408)
        }
        
        if haveStar2 == true{
        
            Star2!.position = StarSpot2!.position
            
            StarShade2!.position.x = StarSpot2!.position.x
            StarShade2!.position.y = StarSpot2!.position.y - 8
            
            self.Star2!.zPosition = -2
            self.StarShade2!.zPosition = -3
        }
        if haveStar2 == false || haveStar2 == nil{
        
            Star2!.position = CGPoint(x: 1920, y: -1360)
        
            StarShade2!.position = CGPoint(x: 1920, y: -1368)
            
        }
        
        if haveStar3 == true{
        
            Star3!.position = StarSpot3!.position
            
            StarShade3!.position.x = StarSpot3!.position.x
            StarShade3!.position.y = StarSpot3!.position.y - 8
            
            self.Star3!.zPosition = -2
            self.StarShade3!.zPosition = -3
        }
        if haveStar3 == false || haveStar3 == nil{
            
            Star3!.position = CGPoint(x: 3040, y: -720)
        
            StarShade3!.position = CGPoint(x: 3040, y: -728)
            
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
        
        if rampInTwoRampGrid2 == true {
    
            ramp!.position = twoRampGrid!.position
            rampShadow!.position.x = twoRampGrid!.position.x
            rampShadow!.position.y = twoRampGrid!.position.y - 8
            
        }
        
        if rampInThreeRampGrid2 == true {
    
            ramp!.position = threeRampGrid!.position
            rampShadow!.position.x = threeRampGrid!.position.x
            rampShadow!.position.y = threeRampGrid!.position.y - 8
            
        }
        
        if rampInFourRampGrid2 == true {
    
            ramp!.position = fourRampGrid!.position
            rampShadow!.position.x = fourRampGrid!.position.x
            rampShadow!.position.y = fourRampGrid!.position.y - 8
            
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
        
        if wallInTwoRightWallGrid2 == true {
        
            wall!.position = twoRightWallGrid!.position
            wallShadow!.position.x = twoRightWallGrid!.position.x
            wallShadow!.position.y = twoRightWallGrid!.position.y - 8
        }
        
        
            
        if wallInTwoLeftWallGrid2 == true {
        
                wall!.position = twoLeftWallGrid!.position
                wallShadow!.position.x = twoLeftWallGrid!.position.x
                wallShadow!.position.y = twoLeftWallGrid!.position.y - 8
            
            
        }
        
        if wallInThreeRightWallGrid2 == true {
        
                wall!.position = threeRightWallGrid!.position
                wallShadow!.position.x = threeRightWallGrid!.position.x
                wallShadow!.position.y = threeRightWallGrid!.position.y - 8
        }
        
        
            
        if wallInThreeLeftWallGrid2 == true {
        
                wall!.position = threeLeftWallGrid!.position
                wallShadow!.position.x = threeLeftWallGrid!.position.x
                wallShadow!.position.y = threeLeftWallGrid!.position.y - 8
            
            
        }
        
        if wallInFourRightWallGrid2 == true {
        
                wall!.position = fourRightWallGrid!.position
                wallShadow!.position.x = fourRightWallGrid!.position.x
                wallShadow!.position.y = fourRightWallGrid!.position.y - 8
        }
        
        
            
        if wallInFourLeftWallGrid2 == true {
        
                wall!.position = fourLeftWallGrid!.position
                wallShadow!.position.x = fourLeftWallGrid!.position.x
                wallShadow!.position.y = fourLeftWallGrid!.position.y - 8
            
            
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
        
        if floorInTwoBottomfloorGrid2 == true {
        
            floor!.position = twoBottomFloorGrid!.position
            floorShadow!.position.x = twoBottomFloorGrid!.position.x
            floorShadow!.position.y = twoBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floorInTwoTopfloorGrid2 == true {
        
            floor!.position = twoTopFloorGrid!.position
            floorShadow!.position.x = twoTopFloorGrid!.position.x
            floorShadow!.position.y = twoTopFloorGrid!.position.y - 8
            
                
            }
        
        if floorInThreeBottomfloorGrid2 == true {
        
            floor!.position = threeBottomFloorGrid!.position
            floorShadow!.position.x = threeBottomFloorGrid!.position.x
            floorShadow!.position.y = threeBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floorInThreeTopfloorGrid2 == true {
        
            floor!.position = threeTopFloorGrid!.position
            floorShadow!.position.x = threeTopFloorGrid!.position.x
            floorShadow!.position.y = threeTopFloorGrid!.position.y - 8
            
                
            }
        
        if floorInFourBottomfloorGrid2 == true {
        
            floor!.position = fourBottomFloorGrid!.position
            floorShadow!.position.x = fourBottomFloorGrid!.position.x
            floorShadow!.position.y = fourBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floorInFourTopfloorGrid2 == true {
        
            floor!.position = fourTopFloorGrid!.position
            floorShadow!.position.x = fourTopFloorGrid!.position.x
            floorShadow!.position.y = fourTopFloorGrid!.position.y - 8
            
                
            }
        
        if ramp2InOneRampGrid2 == true {
    
            ramp2!.position = oneRampGrid!.position
            rampShadow2!.position.x = oneRampGrid!.position.x
            rampShadow2!.position.y = oneRampGrid!.position.y - 8
            
        }
        
        if ramp2InTwoRampGrid2 == true {
    
            ramp2!.position = twoRampGrid!.position
            rampShadow2!.position.x = twoRampGrid!.position.x
            rampShadow2!.position.y = twoRampGrid!.position.y - 8
            
        }
        
        if ramp2InThreeRampGrid2 == true {
    
            ramp2!.position = threeRampGrid!.position
            rampShadow2!.position.x = threeRampGrid!.position.x
            rampShadow2!.position.y = threeRampGrid!.position.y - 8
            
        }
        
        if ramp2InFourRampGrid2 == true {
    
            ramp2!.position = fourRampGrid!.position
            rampShadow2!.position.x = fourRampGrid!.position.x
            rampShadow2!.position.y = fourRampGrid!.position.y - 8
            
        }
        
        if wall2InOneRightWallGrid2 == true {
        
            wall2!.position = oneRightWallGrid!.position
            wallShadow2!.position.x = oneRightWallGrid!.position.x
            wallShadow2!.position.y = oneRightWallGrid!.position.y - 8
        }
        
        
            
        if wall2InOneLeftWallGrid2 == true {
        
            wall2!.position = oneLeftWallGrid!.position
            wallShadow2!.position.x = oneLeftWallGrid!.position.x
            wallShadow2!.position.y = oneLeftWallGrid!.position.y - 8
            
        }
        
        if wall2InTwoRightWallGrid2 == true {
        
            wall2!.position = twoRightWallGrid!.position
            wallShadow2!.position.x = twoRightWallGrid!.position.x
            wallShadow2!.position.y = twoRightWallGrid!.position.y - 8
        }
        
        
            
        if wall2InTwoLeftWallGrid2 == true {
        
                wall2!.position = twoLeftWallGrid!.position
                wallShadow2!.position.x = twoLeftWallGrid!.position.x
                wallShadow2!.position.y = twoLeftWallGrid!.position.y - 8
            
            
        }
        
        if wall2InThreeRightWallGrid2 == true {
        
                wall2!.position = threeRightWallGrid!.position
                wallShadow2!.position.x = threeRightWallGrid!.position.x
                wallShadow2!.position.y = threeRightWallGrid!.position.y - 8
        }
        
        
            
        if wall2InThreeLeftWallGrid2 == true {
        
                wall2!.position = threeLeftWallGrid!.position
                wallShadow2!.position.x = threeLeftWallGrid!.position.x
                wallShadow2!.position.y = threeLeftWallGrid!.position.y - 8
            
            
        }
        
        if wall2InFourRightWallGrid2 == true {
        
                wall2!.position = fourRightWallGrid!.position
                wallShadow2!.position.x = fourRightWallGrid!.position.x
                wallShadow2!.position.y = fourRightWallGrid!.position.y - 8
        }
        
        
            
        if wall2InFourLeftWallGrid2 == true {
        
                wall2!.position = fourLeftWallGrid!.position
                wallShadow2!.position.x = fourLeftWallGrid!.position.x
                wallShadow2!.position.y = fourLeftWallGrid!.position.y - 8
            
            
        }
        
        
        if floor2InOneBottomfloorGrid2 == true {
        
            floor2!.position = oneBottomFloorGrid!.position
            floorShadow2!.position.x = oneBottomFloorGrid!.position.x
            floorShadow2!.position.y = oneBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor2InOneTopfloorGrid2 == true {
        
            floor2!.position = oneTopFloorGrid!.position
            floorShadow2!.position.x = oneTopFloorGrid!.position.x
            floorShadow2!.position.y = oneTopFloorGrid!.position.y - 8
            
                
            }
        
        if floor2InTwoBottomfloorGrid2 == true {
        
            floor2!.position = twoBottomFloorGrid!.position
            floorShadow2!.position.x = twoBottomFloorGrid!.position.x
            floorShadow2!.position.y = twoBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor2InTwoTopfloorGrid2 == true {
        
            floor2!.position = twoTopFloorGrid!.position
            floorShadow2!.position.x = twoTopFloorGrid!.position.x
            floorShadow2!.position.y = twoTopFloorGrid!.position.y - 8
            
                
            }
        
        if floor2InThreeBottomfloorGrid2 == true {
        
            floor2!.position = threeBottomFloorGrid!.position
            floorShadow2!.position.x = threeBottomFloorGrid!.position.x
            floorShadow2!.position.y = threeBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor2InThreeTopfloorGrid2 == true {
        
            floor2!.position = threeTopFloorGrid!.position
            floorShadow2!.position.x = threeTopFloorGrid!.position.x
            floorShadow2!.position.y = threeTopFloorGrid!.position.y - 8
            
                
            }
        
        if floor2InFourBottomfloorGrid2 == true {
        
            floor2!.position = fourBottomFloorGrid!.position
            floorShadow2!.position.x = fourBottomFloorGrid!.position.x
            floorShadow2!.position.y = fourBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor2InFourTopfloorGrid2 == true {
        
            floor2!.position = fourTopFloorGrid!.position
            floorShadow2!.position.x = fourTopFloorGrid!.position.x
            floorShadow2!.position.y = fourTopFloorGrid!.position.y - 8
            
                
            }
        
        if ramp3InOneRampGrid2 == true {
    
            ramp3!.position = oneRampGrid!.position
            rampShadow3!.position.x = oneRampGrid!.position.x
            rampShadow3!.position.y = oneRampGrid!.position.y - 8
            
        }
        
        if ramp3InTwoRampGrid2 == true {
    
            ramp3!.position = twoRampGrid!.position
            rampShadow3!.position.x = twoRampGrid!.position.x
            rampShadow3!.position.y = twoRampGrid!.position.y - 8
            
        }
        
        if ramp3InThreeRampGrid2 == true {
    
            ramp3!.position = threeRampGrid!.position
            rampShadow3!.position.x = threeRampGrid!.position.x
            rampShadow3!.position.y = threeRampGrid!.position.y - 8
            
        }
        
        if ramp3InFourRampGrid2 == true {
    
            ramp3!.position = fourRampGrid!.position
            rampShadow3!.position.x = fourRampGrid!.position.x
            rampShadow3!.position.y = fourRampGrid!.position.y - 8
            
        }
        
        if wall3InOneRightWallGrid2 == true {
        
            wall3!.position = oneRightWallGrid!.position
            wallShadow3!.position.x = oneRightWallGrid!.position.x
            wallShadow3!.position.y = oneRightWallGrid!.position.y - 8
        }
        
        
            
        if wall3InOneLeftWallGrid2 == true {
        
            wall3!.position = oneLeftWallGrid!.position
            wallShadow3!.position.x = oneLeftWallGrid!.position.x
            wallShadow3!.position.y = oneLeftWallGrid!.position.y - 8
            
        }
        
        if wall3InTwoRightWallGrid2 == true {
        
            wall3!.position = twoRightWallGrid!.position
            wallShadow3!.position.x = twoRightWallGrid!.position.x
            wallShadow3!.position.y = twoRightWallGrid!.position.y - 8
        }
        
        
            
        if wall3InTwoLeftWallGrid2 == true {
        
                wall3!.position = twoLeftWallGrid!.position
                wallShadow3!.position.x = twoLeftWallGrid!.position.x
                wallShadow3!.position.y = twoLeftWallGrid!.position.y - 8
            
            
        }
        
        if wall3InThreeRightWallGrid2 == true {
        
                wall3!.position = threeRightWallGrid!.position
                wallShadow3!.position.x = threeRightWallGrid!.position.x
                wallShadow3!.position.y = threeRightWallGrid!.position.y - 8
        }
        
        
            
        if wall3InThreeLeftWallGrid2 == true {
        
                wall3!.position = threeLeftWallGrid!.position
                wallShadow3!.position.x = threeLeftWallGrid!.position.x
                wallShadow3!.position.y = threeLeftWallGrid!.position.y - 8
            
            
        }
        
        if wall3InFourRightWallGrid2 == true {
        
                wall3!.position = fourRightWallGrid!.position
                wallShadow3!.position.x = fourRightWallGrid!.position.x
                wallShadow3!.position.y = fourRightWallGrid!.position.y - 8
        }
        
        
            
        if wall3InFourLeftWallGrid2 == true {
        
                wall3!.position = fourLeftWallGrid!.position
                wallShadow3!.position.x = fourLeftWallGrid!.position.x
                wallShadow3!.position.y = fourLeftWallGrid!.position.y - 8
            
            
        }
        
        
        if floor3InOneBottomfloorGrid2 == true {
        
            floor3!.position = oneBottomFloorGrid!.position
            floorShadow3!.position.x = oneBottomFloorGrid!.position.x
            floorShadow3!.position.y = oneBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor3InOneTopfloorGrid2 == true {
        
            floor3!.position = oneTopFloorGrid!.position
            floorShadow3!.position.x = oneTopFloorGrid!.position.x
            floorShadow3!.position.y = oneTopFloorGrid!.position.y - 8
            
                
            }
        
        if floor3InTwoBottomfloorGrid2 == true {
        
            floor3!.position = twoBottomFloorGrid!.position
            floorShadow3!.position.x = twoBottomFloorGrid!.position.x
            floorShadow3!.position.y = twoBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor3InTwoTopfloorGrid2 == true {
        
            floor3!.position = twoTopFloorGrid!.position
            floorShadow3!.position.x = twoTopFloorGrid!.position.x
            floorShadow3!.position.y = twoTopFloorGrid!.position.y - 8
            
                
            }
        
        if floor3InThreeBottomfloorGrid2 == true {
        
            floor3!.position = threeBottomFloorGrid!.position
            floorShadow3!.position.x = threeBottomFloorGrid!.position.x
            floorShadow3!.position.y = threeBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor3InThreeTopfloorGrid2 == true {
        
            floor3!.position = threeTopFloorGrid!.position
            floorShadow3!.position.x = threeTopFloorGrid!.position.x
            floorShadow3!.position.y = threeTopFloorGrid!.position.y - 8
            
                
            }
        
        if floor3InFourBottomfloorGrid2 == true {
        
            floor3!.position = fourBottomFloorGrid!.position
            floorShadow3!.position.x = fourBottomFloorGrid!.position.x
            floorShadow3!.position.y = fourBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor3InFourTopfloorGrid2 == true {
        
            floor3!.position = fourTopFloorGrid!.position
            floorShadow3!.position.x = fourTopFloorGrid!.position.x
            floorShadow3!.position.y = fourTopFloorGrid!.position.y - 8
            
                
            }
        
        if ramp4InOneRampGrid2 == true {
    
            ramp4!.position = oneRampGrid!.position
            rampShadow4!.position.x = oneRampGrid!.position.x
            rampShadow4!.position.y = oneRampGrid!.position.y - 8
            
        }
        
        if ramp4InTwoRampGrid2 == true {
    
            ramp4!.position = twoRampGrid!.position
            rampShadow4!.position.x = twoRampGrid!.position.x
            rampShadow4!.position.y = twoRampGrid!.position.y - 8
            
        }
        
        if ramp4InThreeRampGrid2 == true {
    
            ramp4!.position = threeRampGrid!.position
            rampShadow4!.position.x = threeRampGrid!.position.x
            rampShadow4!.position.y = threeRampGrid!.position.y - 8
            
        }
        
        if ramp4InFourRampGrid2 == true {
    
            ramp4!.position = fourRampGrid!.position
            rampShadow4!.position.x = fourRampGrid!.position.x
            rampShadow4!.position.y = fourRampGrid!.position.y - 8
            
        }
        
        if wall4InOneRightWallGrid2 == true {
        
            wall4!.position = oneRightWallGrid!.position
            wallShadow4!.position.x = oneRightWallGrid!.position.x
            wallShadow4!.position.y = oneRightWallGrid!.position.y - 8
        }
        
        
            
        if wall4InOneLeftWallGrid2 == true {
        
            wall4!.position = oneLeftWallGrid!.position
            wallShadow4!.position.x = oneLeftWallGrid!.position.x
            wallShadow4!.position.y = oneLeftWallGrid!.position.y - 8
            
        }
        
        if wall4InTwoRightWallGrid2 == true {
        
            wall4!.position = twoRightWallGrid!.position
            wallShadow4!.position.x = twoRightWallGrid!.position.x
            wallShadow4!.position.y = twoRightWallGrid!.position.y - 8
        }
        
        
            
        if wall4InTwoLeftWallGrid2 == true {
        
                wall4!.position = twoLeftWallGrid!.position
                wallShadow4!.position.x = twoLeftWallGrid!.position.x
                wallShadow4!.position.y = twoLeftWallGrid!.position.y - 8
            
            
        }
        
        if wall4InThreeRightWallGrid2 == true {
        
                wall4!.position = threeRightWallGrid!.position
                wallShadow4!.position.x = threeRightWallGrid!.position.x
                wallShadow4!.position.y = threeRightWallGrid!.position.y - 8
        }
        
        
            
        if wall4InThreeLeftWallGrid2 == true {
        
                wall4!.position = threeLeftWallGrid!.position
                wallShadow4!.position.x = threeLeftWallGrid!.position.x
                wallShadow4!.position.y = threeLeftWallGrid!.position.y - 8
            
            
        }
        
        if wall4InFourRightWallGrid2 == true {
        
                wall4!.position = fourRightWallGrid!.position
                wallShadow4!.position.x = fourRightWallGrid!.position.x
                wallShadow4!.position.y = fourRightWallGrid!.position.y - 8
        }
        
        
            
        if wall4InFourLeftWallGrid2 == true {
        
                wall4!.position = fourLeftWallGrid!.position
                wallShadow4!.position.x = fourLeftWallGrid!.position.x
                wallShadow4!.position.y = fourLeftWallGrid!.position.y - 8
            
            
        }
        
        
        if floor4InOneBottomfloorGrid2 == true {
        
            floor4!.position = oneBottomFloorGrid!.position
            floorShadow4!.position.x = oneBottomFloorGrid!.position.x
            floorShadow4!.position.y = oneBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor4InOneTopfloorGrid2 == true {
        
            floor4!.position = oneTopFloorGrid!.position
            floorShadow4!.position.x = oneTopFloorGrid!.position.x
            floorShadow4!.position.y = oneTopFloorGrid!.position.y - 8
            
                
            }
        
        if floor4InTwoBottomfloorGrid2 == true {
        
            floor4!.position = twoBottomFloorGrid!.position
            floorShadow4!.position.x = twoBottomFloorGrid!.position.x
            floorShadow4!.position.y = twoBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor4InTwoTopfloorGrid2 == true {
        
            floor4!.position = twoTopFloorGrid!.position
            floorShadow4!.position.x = twoTopFloorGrid!.position.x
            floorShadow4!.position.y = twoTopFloorGrid!.position.y - 8
            
                
            }
        
        if floor4InThreeBottomfloorGrid2 == true {
        
            floor4!.position = threeBottomFloorGrid!.position
            floorShadow4!.position.x = threeBottomFloorGrid!.position.x
            floorShadow4!.position.y = threeBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor4InThreeTopfloorGrid2 == true {
        
            floor4!.position = threeTopFloorGrid!.position
            floorShadow4!.position.x = threeTopFloorGrid!.position.x
            floorShadow4!.position.y = threeTopFloorGrid!.position.y - 8
            
                
            }
        
        if floor4InFourBottomfloorGrid2 == true {
        
            floor4!.position = fourBottomFloorGrid!.position
            floorShadow4!.position.x = fourBottomFloorGrid!.position.x
            floorShadow4!.position.y = fourBottomFloorGrid!.position.y - 8
            
                
            }
        
        if floor4InFourTopfloorGrid2 == true {
        
            floor4!.position = fourTopFloorGrid!.position
            floorShadow4!.position.x = fourTopFloorGrid!.position.x
            floorShadow4!.position.y = fourTopFloorGrid!.position.y - 8
            
                
            }
            if touchingFloor == false && (floorInOneBottomfloorGrid2 == false && floorInOneTopfloorGrid2 == false && floorInTwoBottomfloorGrid2 == false && floorInTwoTopfloorGrid2 == false && floorInThreeBottomfloorGrid2 == false && floorInThreeTopfloorGrid2 == false && floorInFourBottomfloorGrid2 == false && floorInFourTopfloorGrid2 == false){
            
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
        
       
        
            if touchingFloor2  == false && (floorInOneTopfloorGrid2 == true || floorInOneBottomfloorGrid2 == true || floorInTwoTopfloorGrid2 == true || floorInTwoBottomfloorGrid2 == true || floorInThreeTopfloorGrid2 == true || floorInThreeBottomfloorGrid2 == true || floorInFourTopfloorGrid2 == true || floorInFourBottomfloorGrid2 == true) && (floor2InOneBottomfloorGrid2 == false && floor2InOneTopfloorGrid2 == false && floor2InTwoBottomfloorGrid2 == false && floor2InTwoTopfloorGrid2 == false && floor2InThreeBottomfloorGrid2 == false && floor2InThreeTopfloorGrid2 == false && floor2InFourBottomfloorGrid2 == false && floor2InFourTopfloorGrid2 == false){
            
                let floorShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
                
                floor2!.run(floorShrink)
                floorShadow2!.run(floorShrink)
                
                floor2!.position.x = topBar!.position.x - 160
                floor2!.position.y = topBar!.position.y
                
                floorShadow2!.position.x = topBar!.position.x - 160
                floorShadow2!.position.y = topBar!.position.y - 8
                
                oneTopFloorGrid!.alpha = 0
                oneBottomFloorGrid!.alpha = 0
                
            }
        
        
        
            
            if touchingFloor3  == false && (floor2InOneTopfloorGrid2 == true || floor2InOneBottomfloorGrid2 == true || floor2InTwoTopfloorGrid2 == true || floor2InTwoBottomfloorGrid2 == true || floor2InThreeTopfloorGrid2 == true || floor2InThreeBottomfloorGrid2 == true || floor2InFourTopfloorGrid2 == true || floor2InFourBottomfloorGrid2 == true) && (floor3InOneBottomfloorGrid2 == false && floor3InOneTopfloorGrid2 == false && floor3InTwoBottomfloorGrid2 == false && floor3InTwoTopfloorGrid2 == false && floor3InThreeBottomfloorGrid2 == false && floor3InThreeTopfloorGrid2 == false && floor3InFourBottomfloorGrid2 == false && floor3InFourTopfloorGrid2 == false){
            
                let floorShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
                
                    floor3!.run(floorShrink)
                    floorShadow3!.run(floorShrink)
                
                floor3!.position.x = topBar!.position.x - 160
                floor3!.position.y = topBar!.position.y
                
                floorShadow3!.position.x = topBar!.position.x - 160
                floorShadow3!.position.y = topBar!.position.y - 8
                
                oneTopFloorGrid!.alpha = 0
                oneBottomFloorGrid!.alpha = 0
                
            }
        
        if touchingFloor4  == false && (floor3InOneTopfloorGrid2 == true || floor3InOneBottomfloorGrid2 == true || floor3InTwoTopfloorGrid2 == true || floor3InTwoBottomfloorGrid2 == true || floor3InThreeTopfloorGrid2 == true || floor3InThreeBottomfloorGrid2 == true || floor3InFourTopfloorGrid2 == true || floor3InFourBottomfloorGrid2 == true) && (floor4InOneBottomfloorGrid2 == false && floor4InOneTopfloorGrid2 == false && floor4InTwoBottomfloorGrid2 == false && floor4InTwoTopfloorGrid2 == false && floor4InThreeBottomfloorGrid2 == false && floor4InThreeTopfloorGrid2 == false && floor4InFourBottomfloorGrid2 == false && floor4InFourTopfloorGrid2 == false){
        
            let floorShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
            
                floor4!.run(floorShrink)
                floorShadow4!.run(floorShrink)
            
            floor4!.position.x = topBar!.position.x - 160
            floor4!.position.y = topBar!.position.y
            
            floorShadow4!.position.x = topBar!.position.x - 160
            floorShadow4!.position.y = topBar!.position.y - 8
            
            oneTopFloorGrid!.alpha = 0
            oneBottomFloorGrid!.alpha = 0
            
        }
        
            if touchingWall == false && (wallInOneLeftWallGrid2 == false && wallInOneRightWallGrid2 == false && wallInTwoLeftWallGrid2 == false && wallInTwoRightWallGrid2 == false && wallInThreeLeftWallGrid2 == false && wallInThreeRightWallGrid2 == false && wallInFourLeftWallGrid2 == false && wallInFourRightWallGrid2 == false){
            
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
    
        
            if touchingWall2 == false && (wallInOneLeftWallGrid2 == true || wallInOneRightWallGrid2 == true || wallInTwoLeftWallGrid2 == true || wallInTwoRightWallGrid2 == true || wallInThreeLeftWallGrid2 == true || wallInThreeRightWallGrid2 == true || wallInFourLeftWallGrid2 == true || wallInFourRightWallGrid2 == true) && (wall2InOneLeftWallGrid2 == false && wall2InOneRightWallGrid2 == false && wall2InTwoLeftWallGrid2 == false && wall2InTwoRightWallGrid2 == false && wall2InThreeLeftWallGrid2 == false && wall2InThreeRightWallGrid2 == false && wall2InFourLeftWallGrid2 == false && wall2InFourRightWallGrid2 == false){
            
                let wallShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
                
                wall2!.run(wallShrink)
                wallShadow2!.run(wallShrink)
                
                wall2!.position.x = topBar!.position.x
                wall2!.position.y = topBar!.position.y
                
                wallShadow2!.position.x = topBar!.position.x
                wallShadow2!.position.y = topBar!.position.y - 8
                
                oneLeftWallGrid!.alpha = 0
                oneRightWallGrid!.alpha = 0
                
            }
        
        
            
            if touchingWall3 == false && (wall2InOneLeftWallGrid2 == true || wall2InOneRightWallGrid2 == true || wall2InTwoLeftWallGrid2 == true || wall2InTwoRightWallGrid2 == true || wall2InThreeLeftWallGrid2 == true || wall2InThreeRightWallGrid2 == true || wall2InFourLeftWallGrid2 == true || wall2InFourRightWallGrid2 == true) && (wall3InOneLeftWallGrid2 == false && wall3InOneRightWallGrid2 == false && wall3InTwoLeftWallGrid2 == false && wall3InTwoRightWallGrid2 == false && wall3InThreeLeftWallGrid2 == false && wall3InThreeRightWallGrid2 == false && wall3InFourLeftWallGrid2 == false && wall3InFourRightWallGrid2 == false){
            
                let wallShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
                
                wall3!.run(wallShrink)
                wallShadow3!.run(wallShrink)
                
                wall3!.position.x = topBar!.position.x
                wall3!.position.y = topBar!.position.y
                
                wallShadow3!.position.x = topBar!.position.x
                wallShadow3!.position.y = topBar!.position.y - 8
                
                oneLeftWallGrid!.alpha = 0
                oneRightWallGrid!.alpha = 0
                
            }
        
        if touchingWall4 == false && (wall3InOneLeftWallGrid2 == true || wall3InOneRightWallGrid2 == true || wall3InTwoLeftWallGrid2 == true || wall3InTwoRightWallGrid2 == true || wall3InThreeLeftWallGrid2 == true || wall3InThreeRightWallGrid2 == true || wall3InFourLeftWallGrid2 == true || wall3InFourRightWallGrid2 == true) && (wall4InOneLeftWallGrid2 == false && wall4InOneRightWallGrid2 == false && wall4InTwoLeftWallGrid2 == false && wall4InTwoRightWallGrid2 == false && wall4InThreeLeftWallGrid2 == false && wall4InThreeRightWallGrid2 == false && wall4InFourLeftWallGrid2 == false && wall4InFourRightWallGrid2 == false){
        
            let wallShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
            
            wall4!.run(wallShrink)
            wallShadow4!.run(wallShrink)
            
            wall4!.position.x = topBar!.position.x
            wall4!.position.y = topBar!.position.y
            
            wallShadow4!.position.x = topBar!.position.x
            wallShadow4!.position.y = topBar!.position.y - 8
            
            oneLeftWallGrid!.alpha = 0
            oneRightWallGrid!.alpha = 0
            
        }
            
            if touchingRamp == false && (rampInOneRampGrid2 == false && rampInTwoRampGrid2 == false && rampInThreeRampGrid2 == false && rampInFourRampGrid2 == false){
                
                ramp!.position.x = topBar!.position.x + 160
                ramp!.position.y = topBar!.position.y
                
                rampShadow!.position.x = topBar!.position.x + 160
                rampShadow!.position.y = topBar!.position.y - 8
                
                oneRampGrid!.alpha = 0
                
            }
        
            
        
            
            if touchingRamp2 == false && (rampInOneRampGrid2 == true || rampInTwoRampGrid2 == true || rampInThreeRampGrid2 == true || rampInFourRampGrid2 == true) && (ramp2InOneRampGrid2 == false && ramp2InTwoRampGrid2 == false && ramp2InThreeRampGrid2 == false && ramp2InFourRampGrid2 == false){
                
                ramp2!.position.x = topBar!.position.x + 160
                ramp2!.position.y = topBar!.position.y
                
                rampShadow2!.position.x = topBar!.position.x + 160
                rampShadow2!.position.y = topBar!.position.y - 8
                
                oneRampGrid!.alpha = 0
                
            }
        
            
       
            
            if touchingRamp3 == false && (ramp2InOneRampGrid2 == true || ramp2InTwoRampGrid2 == true || ramp2InThreeRampGrid2 == true || ramp2InFourRampGrid2 == true) && (ramp3InOneRampGrid2 == false && ramp3InTwoRampGrid2 == false && ramp3InThreeRampGrid2 == false && ramp3InFourRampGrid2 == false){
                
                ramp3!.position.x = topBar!.position.x + 160
                ramp3!.position.y = topBar!.position.y
                
                rampShadow3!.position.x = topBar!.position.x + 160
                rampShadow3!.position.y = topBar!.position.y - 8
                
                oneRampGrid!.alpha = 0
                
            }
            
        if touchingRamp4 == false && (ramp3InOneRampGrid2 == true || ramp3InTwoRampGrid2 == true || ramp3InThreeRampGrid2 == true || ramp3InFourRampGrid2 == true) && (ramp4InOneRampGrid2 == false && ramp4InTwoRampGrid2 == false && ramp4InThreeRampGrid2 == false && ramp4InFourRampGrid2 == false){
            
            ramp4!.position.x = topBar!.position.x + 160
            ramp4!.position.y = topBar!.position.y
            
            rampShadow4!.position.x = topBar!.position.x + 160
            rampShadow4!.position.y = topBar!.position.y - 8
            
            oneRampGrid!.alpha = 0
            
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
                                  
            
            
            
            self.player?.isHidden = false
            self.playerShadow?.isHidden = false
            
                                     self.oneGrid!.alpha = 0.1
            self.twoGrid!.alpha = 0.1
            self.threeGrid!.alpha = 0.1
            self.fourGrid!.alpha = 0.1
            
            self.Star12!.position = CGPoint(x: 0,y: 10000)
                                     self.Star22!.position = CGPoint(x: 0,y: 10000)
                                     self.Star32!.position = CGPoint(x: 0,y: 10000)
                                     
                                     self.StarSpot12!.position = CGPoint(x: 0,y: 10000)
                                     self.StarSpot22!.position = CGPoint(x: 0,y: 10000)
                                     self.StarSpot32!.position = CGPoint(x: 0,y: 10000)
            
            self.rampeffectsAllowed = true
            self.walleffectsAllowed = true
            self.flooreffectsAllowed = true
            
            self.ramp2effectsAllowed = true
            self.wall2effectsAllowed = true
            self.floor2effectsAllowed = true
            
            self.ramp3effectsAllowed = true
            self.wall3effectsAllowed = true
            self.floor3effectsAllowed = true
            
            self.oneRampGrid!.alpha = 0
            self.twoRampGrid!.alpha = 0
            self.threeRampGrid!.alpha = 0
            self.fourRampGrid!.alpha = 0
            
            self.oneLeftWallGrid!.alpha = 0
            self.oneRightWallGrid!.alpha = 0
            
            self.twoLeftWallGrid!.alpha = 0
            self.twoRightWallGrid!.alpha = 0
            
            self.threeLeftWallGrid!.alpha = 0
            self.threeRightWallGrid!.alpha = 0
            
            self.fourLeftWallGrid!.alpha = 0
            self.fourRightWallGrid!.alpha = 0
            
            self.oneTopFloorGrid!.alpha = 0
            self.oneBottomFloorGrid!.alpha = 0
            
            self.twoTopFloorGrid!.alpha = 0
            self.twoBottomFloorGrid!.alpha = 0
            
            self.threeTopFloorGrid!.alpha = 0
            self.threeBottomFloorGrid!.alpha = 0
            
            self.fourTopFloorGrid!.alpha = 0
            self.fourBottomFloorGrid!.alpha = 0
            
            self.player!.physicsBody?.isDynamic = true
            
            
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
                                    
            self.rampInTwoRampGrid = false
            self.rampInTwoRampGrid2 = false
                                    
            self.wallInTwoLeftWallGrid = false
            self.wallInTwoLeftWallGrid2 = false
            self.wallInTwoRightWallGrid = false
            self.wallInTwoRightWallGrid2 = false
                                    
            self.floorInTwoTopFloorGrid = false
            self.floorInTwoTopfloorGrid2 = false
            self.floorInTwoBottomFloorGrid = false
            self.floorInTwoBottomfloorGrid2 = false
                                    
            self.rampInThreeRampGrid = false
            self.rampInThreeRampGrid2 = false
                                    
            self.wallInThreeLeftWallGrid = false
            self.wallInThreeLeftWallGrid2 = false
            self.wallInThreeRightWallGrid = false
            self.wallInThreeRightWallGrid2 = false
                                    
            self.floorInThreeTopFloorGrid = false
            self.floorInThreeTopfloorGrid2 = false
            self.floorInThreeBottomFloorGrid = false
            self.floorInThreeBottomfloorGrid2 = false
            
            self.rampInFourRampGrid = false
            self.rampInFourRampGrid2 = false
                                    
            self.wallInFourLeftWallGrid = false
            self.wallInFourLeftWallGrid2 = false
            self.wallInFourRightWallGrid = false
            self.wallInFourRightWallGrid2 = false
                                    
            self.floorInFourTopFloorGrid = false
            self.floorInFourTopfloorGrid2 = false
            self.floorInFourBottomFloorGrid = false
            self.floorInFourBottomfloorGrid2 = false
            
            
                        
            self.player!.zPosition = 0
            self.playerShadow!.zPosition = -14
            
            self.ramp2InOneRampGrid = false
            self.ramp2InOneRampGrid2 = false
                                    
            self.wall2InOneLeftWallGrid = false
            self.wall2InOneLeftWallGrid2 = false
            self.wall2InOneRightWallGrid = false
            self.wall2InOneRightWallGrid2 = false
                                    
            self.floor2InOneTopFloorGrid = false
            self.floor2InOneTopfloorGrid2 = false
            self.floor2InOneBottomFloorGrid = false
            self.floor2InOneBottomfloorGrid2 = false
                                    
            self.ramp2InTwoRampGrid = false
            self.ramp2InTwoRampGrid2 = false
                                    
            self.wall2InTwoLeftWallGrid = false
            self.wall2InTwoLeftWallGrid2 = false
            self.wall2InTwoRightWallGrid = false
            self.wall2InTwoRightWallGrid2 = false
                                    
            self.floor2InTwoTopFloorGrid = false
            self.floor2InTwoTopfloorGrid2 = false
            self.floor2InTwoBottomFloorGrid = false
            self.floor2InTwoBottomfloorGrid2 = false
                                    
            self.ramp2InThreeRampGrid = false
            self.ramp2InThreeRampGrid2 = false
                                    
            self.wall2InThreeLeftWallGrid = false
            self.wall2InThreeLeftWallGrid2 = false
            self.wall2InThreeRightWallGrid = false
            self.wall2InThreeRightWallGrid2 = false
                                    
            self.floor2InThreeTopFloorGrid = false
            self.floor2InThreeTopfloorGrid2 = false
            self.floor2InThreeBottomFloorGrid = false
            self.floor2InThreeBottomfloorGrid2 = false
            
            self.ramp2InFourRampGrid = false
            self.ramp2InFourRampGrid2 = false
                                    
            self.wall2InFourLeftWallGrid = false
            self.wall2InFourLeftWallGrid2 = false
            self.wall2InFourRightWallGrid = false
            self.wall2InFourRightWallGrid2 = false
                                    
            self.floor2InFourTopFloorGrid = false
            self.floor2InFourTopfloorGrid2 = false
            self.floor2InFourBottomFloorGrid = false
            self.floor2InFourBottomfloorGrid2 = false
                                    
                                    
            self.ramp3InOneRampGrid = false
            self.ramp3InOneRampGrid2 = false
                                    
            self.wall3InOneLeftWallGrid = false
            self.wall3InOneLeftWallGrid2 = false
            self.wall3InOneRightWallGrid = false
            self.wall3InOneRightWallGrid2 = false
                                    
            self.floor3InOneTopFloorGrid = false
            self.floor3InOneTopfloorGrid2 = false
            self.floor3InOneBottomFloorGrid = false
            self.floor3InOneBottomfloorGrid2 = false
                                    
            self.ramp3InTwoRampGrid = false
            self.ramp3InTwoRampGrid2 = false
                                    
            self.wall3InTwoLeftWallGrid = false
            self.wall3InTwoLeftWallGrid2 = false
            self.wall3InTwoRightWallGrid = false
            self.wall3InTwoRightWallGrid2 = false
                                    
            self.floor3InTwoTopFloorGrid = false
            self.floor3InTwoTopfloorGrid2 = false
            self.floor3InTwoBottomFloorGrid = false
            self.floor3InTwoBottomfloorGrid2 = false
                                    
            self.ramp3InThreeRampGrid = false
            self.ramp3InThreeRampGrid2 = false
                                    
            self.wall3InThreeLeftWallGrid = false
            self.wall3InThreeLeftWallGrid2 = false
            self.wall3InThreeRightWallGrid = false
            self.wall3InThreeRightWallGrid2 = false
                                    
            self.floor3InThreeTopFloorGrid = false
            self.floor3InThreeTopfloorGrid2 = false
            self.floor3InThreeBottomFloorGrid = false
            self.floor3InThreeBottomfloorGrid2 = false
                                 
            self.ramp3InFourRampGrid = false
            self.ramp3InFourRampGrid2 = false
                                    
            self.wall3InFourLeftWallGrid = false
            self.wall3InFourLeftWallGrid2 = false
            self.wall3InFourRightWallGrid = false
            self.wall3InFourRightWallGrid2 = false
                                    
            self.floor3InFourTopFloorGrid = false
            self.floor3InFourTopfloorGrid2 = false
            self.floor3InFourBottomFloorGrid = false
            self.floor3InFourBottomfloorGrid2 = false
            
            self.ramp4InOneRampGrid = false
            self.ramp4InOneRampGrid2 = false
                                    
            self.wall4InOneLeftWallGrid = false
            self.wall4InOneLeftWallGrid2 = false
            self.wall4InOneRightWallGrid = false
            self.wall4InOneRightWallGrid2 = false
                                    
            self.floor4InOneTopFloorGrid = false
            self.floor4InOneTopfloorGrid2 = false
            self.floor4InOneBottomFloorGrid = false
            self.floor4InOneBottomfloorGrid2 = false
                                    
            self.ramp4InTwoRampGrid = false
            self.ramp4InTwoRampGrid2 = false
                                    
            self.wall4InTwoLeftWallGrid = false
            self.wall4InTwoLeftWallGrid2 = false
            self.wall4InTwoRightWallGrid = false
            self.wall4InTwoRightWallGrid2 = false
                                    
            self.floor4InTwoTopFloorGrid = false
            self.floor4InTwoTopfloorGrid2 = false
            self.floor4InTwoBottomFloorGrid = false
            self.floor4InTwoBottomfloorGrid2 = false
                                    
            self.ramp4InThreeRampGrid = false
            self.ramp4InThreeRampGrid2 = false
                                    
            self.wall4InThreeLeftWallGrid = false
            self.wall4InThreeLeftWallGrid2 = false
            self.wall4InThreeRightWallGrid = false
            self.wall4InThreeRightWallGrid2 = false
                                    
            self.floor4InThreeTopFloorGrid = false
            self.floor4InThreeTopfloorGrid2 = false
            self.floor4InThreeBottomFloorGrid = false
            self.floor4InThreeBottomfloorGrid2 = false
                                 
            self.ramp4InFourRampGrid = false
            self.ramp4InFourRampGrid2 = false
                                    
            self.wall4InFourLeftWallGrid = false
            self.wall4InFourLeftWallGrid2 = false
            self.wall4InFourRightWallGrid = false
            self.wall4InFourRightWallGrid2 = false
                                    
            self.floor4InFourTopFloorGrid = false
            self.floor4InFourTopfloorGrid2 = false
            self.floor4InFourBottomFloorGrid = false
            self.floor4InFourBottomfloorGrid2 = false
            
                                
            self.player!.physicsBody?.restitution = 0.2
            
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
                                 
                                    
                             
                                     self.wall!.physicsBody?.isDynamic = false
                                     self.wall!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
                                     self.ramp!.physicsBody?.isDynamic = false
                                     self.ramp!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
                                     self.floor!.physicsBody?.isDynamic = false
                                     self.floor!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
            
            self.player!.physicsBody?.pinned = false
            
            self.wall2!.physicsBody?.isDynamic = false
            self.wall2!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
            self.ramp2!.physicsBody?.isDynamic = false
            self.ramp2!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
            self.floor2!.physicsBody?.isDynamic = false
            self.floor2!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
            
            self.wall3!.physicsBody?.isDynamic = false
            self.wall3!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
            self.ramp3!.physicsBody?.isDynamic = false
            self.ramp3!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
            self.floor3!.physicsBody?.isDynamic = false
            self.floor3!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
            
            self.wall4!.physicsBody?.isDynamic = false
            self.wall4!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
            self.ramp4!.physicsBody?.isDynamic = false
            self.ramp4!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
            self.floor!.physicsBody?.isDynamic = false
            self.floor4!.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 0, height: 0))
                       
            
            self.ramp2!.size = CGSize(width: 20, height: 110)
            self.rampShadow2!.size = CGSize(width: 20, height: 110)
            
            self.ramp3!.size = CGSize(width: 20, height: 110)
            self.rampShadow3!.size = CGSize(width: 20, height: 110)
            
            self.ramp4!.size = CGSize(width: 20, height: 110)
            self.rampShadow4!.size = CGSize(width: 20, height: 110)
            
            self.wall2!.size = CGSize(width: 20, height: 80)
            self.wallShadow2!.size = CGSize(width: 20, height: 80)
            
            self.wall3!.size = CGSize(width: 20, height: 80)
            self.wallShadow3!.size = CGSize(width: 20, height: 80)
            
            self.wall4!.size = CGSize(width: 20, height: 80)
            self.wallShadow4!.size = CGSize(width: 20, height: 80)
            
            self.floor2!.size = CGSize(width: 20, height: 80)
            self.floorShadow2!.size = CGSize(width: 20, height: 80)
            
            self.floor3!.size = CGSize(width: 20, height: 80)
            self.floorShadow3!.size = CGSize(width: 20, height: 80)
            
            self.floor4!.size = CGSize(width: 20, height: 80)
            self.floorShadow4!.size = CGSize(width: 20, height: 80)
            
            self.ramp2!.position = CGPoint(x: 0, y: 1000)
            self.rampShadow2!.position = CGPoint(x: 0, y: 1000)
            
            self.ramp3!.position = CGPoint(x: 0, y: 1000)
            self.rampShadow3!.position = CGPoint(x: 0, y: 1000)
            
            self.ramp4!.position = CGPoint(x: 0, y: 1000)
            self.rampShadow4!.position = CGPoint(x: 0, y: 1000)
            
            self.wall2!.position = CGPoint(x: 0, y: 1000)
            self.wallShadow2!.position = CGPoint(x: 0, y: 1000)
            
            self.wall3!.position = CGPoint(x: 0, y: 1000)
            self.wallShadow3!.position = CGPoint(x: 0, y: 1000)
            
            self.wall4!.position = CGPoint(x: 0, y: 1000)
            self.wallShadow4!.position = CGPoint(x: 0, y: 1000)
            
            self.floor2!.position = CGPoint(x: 0, y: 1000)
            self.floorShadow2!.position = CGPoint(x: 0, y: 1000)
            
            self.floor3!.position = CGPoint(x: 0, y: 1000)
            self.floorShadow3!.position = CGPoint(x: 0, y: 1000)
            
            self.floor4!.position = CGPoint(x: 0, y: 1000)
            self.floorShadow4!.position = CGPoint(x: 0, y: 1000)
            
            self.buttonsDown = true
            
            
            
            
                                     self.Star12!.size.height = 500
                                     self.Star12!.size.width = 500
                                     self.Star22!.size.height = 500
                                     self.Star22!.size.width = 500
                                     self.Star32!.size.height = 500
                                     self.Star32!.size.width = 500
            if level5.haveStar12 == false || level5.haveStar12 == nil{
            if HomeScene.level5HaveStar1 != true{
                self.haveStar1 = false
                self.Star1!.position = CGPoint(x: 400, y: -400)
                self.Star1!.size = CGSize(width: 72, height: 72)
                self.Star1!.zPosition = -4
                self.StarShade1!.zPosition = -5
                self.StarShade1!.position = CGPoint(x: 400, y: -408)
                self.StarShade1!.size = CGSize(width: 72, height: 72)
                self.name1!.position = self.Star1!.position
                }
            }
            
            if level5.haveStar22 == false || level5.haveStar22 == nil{
                if HomeScene.level5HaveStar2 != true{
                self.haveStar2 = false
                self.Star2!.position = CGPoint(x: 1920, y: -1360)
                self.Star2!.size = CGSize(width: 72, height: 72)
                self.Star2!.zPosition = -4
                self.StarShade2!.zPosition = -5
                self.StarShade2!.position = CGPoint(x: 1920, y: -1368)
                self.StarShade2!.size = CGSize(width: 72, height: 72)
                self.name2!.position = self.Star2!.position
                }
            }
            
            if level5.haveStar32 == false || level5.haveStar32 == nil{
                if HomeScene.level5HaveStar3 != true{
                self.haveStar3 = false
                self.Star3!.position = CGPoint(x: 3040, y: -720)
                self.Star3!.size = CGSize(width: 72, height: 72)
                self.Star3!.zPosition = -4
                self.StarShade3!.zPosition = -5
                self.StarShade3!.position = CGPoint(x: 3040, y: -728)
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
        
        
        
       
            
            
        
            
        if (oneGrid!.contains(ramp!.position) || oneGrid!.contains(ramp2!.position) || oneGrid!.contains(ramp3!.position) || oneGrid!.contains(ramp4!.position)) && oneGrid!.alpha != 0{
            
            oneRampGrid!.alpha = 0.2
            
        } else {
            
            oneRampGrid!.alpha = 0
            
        }
        
        
        
        if (oneGrid!.contains(wall!.position) || oneGrid!.contains(wall2!.position) || oneGrid!.contains(wall3!.position) || oneGrid!.contains(wall4!.position)) && oneGrid!.alpha != 0{
            
            oneLeftWallGrid!.alpha = 0.2
            
            oneRightWallGrid!.alpha = 0.2
            
        } else {
            
            oneLeftWallGrid!.alpha = 0
            
            oneRightWallGrid!.alpha = 0
            
        }
        
        
        
        if (oneGrid!.contains(floor!.position) || oneGrid!.contains(floor2!.position) || oneGrid!.contains(floor3!.position) || oneGrid!.contains(floor4!.position)) && oneGrid!.alpha != 0{
            
            oneBottomFloorGrid!.alpha = 0.2
            
            oneTopFloorGrid!.alpha = 0.2
            
        } else {
            
            oneBottomFloorGrid!.alpha = 0
            
            oneTopFloorGrid!.alpha = 0
            
        }
        
        
        
        
        if (twoGrid!.contains(ramp!.position) || twoGrid!.contains(ramp2!.position) || twoGrid!.contains(ramp3!.position) || twoGrid!.contains(ramp4!.position)) && twoGrid!.alpha != 0{
            
            twoRampGrid!.alpha = 0.2
            
        } else {
            
            twoRampGrid!.alpha = 0
            
        }
        
        
        
        if (twoGrid!.contains(wall!.position) || twoGrid!.contains(wall2!.position) || twoGrid!.contains(wall3!.position) || twoGrid!.contains(wall4!.position)) && twoGrid!.alpha != 0{
            
            twoLeftWallGrid!.alpha = 0.2
            
            twoRightWallGrid!.alpha = 0.2
            
        } else {
            
            twoLeftWallGrid!.alpha = 0
            
            twoRightWallGrid!.alpha = 0
            
        }
        
        
        
        if (twoGrid!.contains(floor!.position) || twoGrid!.contains(floor2!.position) || twoGrid!.contains(floor3!.position) || twoGrid!.contains(floor4!.position)) && twoGrid!.alpha != 0{
            
            twoBottomFloorGrid!.alpha = 0.2
            
            twoTopFloorGrid!.alpha = 0.2
            
        } else {
            
            twoBottomFloorGrid!.alpha = 0
            
            twoTopFloorGrid!.alpha = 0
            
        }
        
        
        
        if (threeGrid!.contains(ramp!.position) || threeGrid!.contains(ramp2!.position) || threeGrid!.contains(ramp3!.position) || threeGrid!.contains(ramp4!.position)) && threeGrid!.alpha != 0{
            
            threeRampGrid!.alpha = 0.2
            
        } else {
            
            threeRampGrid!.alpha = 0
            
        }
        
        
        
        
        if (threeGrid!.contains(wall!.position) || threeGrid!.contains(wall2!.position) || threeGrid!.contains(wall3!.position) || threeGrid!.contains(wall4!.position)) && threeGrid!.alpha != 0{
            
            threeLeftWallGrid!.alpha = 0.2
            
            threeRightWallGrid!.alpha = 0.2
            
        } else {
            
            threeLeftWallGrid!.alpha = 0
            
            threeRightWallGrid!.alpha = 0
            
        }
        
        
        
        
        if (threeGrid!.contains(floor!.position) || threeGrid!.contains(floor2!.position) || threeGrid!.contains(floor3!.position) || threeGrid!.contains(floor4!.position)) && threeGrid!.alpha != 0{
            
            threeBottomFloorGrid!.alpha = 0.2
            
            threeTopFloorGrid!.alpha = 0.2
            
        } else {
            
            threeBottomFloorGrid!.alpha = 0
            
            threeTopFloorGrid!.alpha = 0
            
        }
        
        if (fourGrid!.contains(ramp!.position) || fourGrid!.contains(ramp2!.position) || fourGrid!.contains(ramp3!.position) || fourGrid!.contains(ramp4!.position)) && fourGrid!.alpha != 0{
            
            fourRampGrid!.alpha = 0.2
            
        } else {
            
            fourRampGrid!.alpha = 0
            
        }
        
        
        
        
        if (fourGrid!.contains(wall!.position) || fourGrid!.contains(wall2!.position) || fourGrid!.contains(wall3!.position) || fourGrid!.contains(wall4!.position)) && fourGrid!.alpha != 0{
            
            fourLeftWallGrid!.alpha = 0.2
            
            fourRightWallGrid!.alpha = 0.2
            
        } else {
            
            fourLeftWallGrid!.alpha = 0
            
            fourRightWallGrid!.alpha = 0
            
        }
        
        
        
        
        if (fourGrid!.contains(floor!.position) || fourGrid!.contains(floor2!.position) || fourGrid!.contains(floor3!.position) || fourGrid!.contains(floor4!.position)) && fourGrid!.alpha != 0{
            
            fourBottomFloorGrid!.alpha = 0.2
            
            fourTopFloorGrid!.alpha = 0.2
            
        } else {
            
            fourBottomFloorGrid!.alpha = 0
            
            fourTopFloorGrid!.alpha = 0
            
        }
        
        
        
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
        
            if haveStar1 == true{
                Star1!.zPosition = -1
                
                
            }
            if haveStar2 == true{
                Star2!.zPosition = -1
                
            }
            if haveStar3 == true{
                Star3!.zPosition = -1
                
            }
            
            
            if Star1!.contains(player!.position){
                
                StarNoise()
                
                let starShrink = SKAction.resize(toWidth: 1, height: 1, duration: 0.05)
                
                let gotoSpot = SKAction.run {
                    
                    self.Star1!.position = self.StarSpot1!.position
                    
                    self.StarShade1!.position.x = self.StarSpot1!.position.x
                    self.StarShade1!.position.y = self.StarSpot1!.position.y - 8

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
            HomeScene.level5Completed = true
            passedFinishLine2 = true
            
            level5.haveStar12 = haveStar1
            level5.haveStar22 = haveStar2
            level5.haveStar32 = haveStar3
            
        
        }
        
        
            
            
            

            
            
            
             
                
            if touchingWall == false || touchingFloor == false || touchingRamp == false || touchingWall2 == false || touchingFloor2 == false || touchingRamp2 == false || touchingWall3 == false || touchingFloor3 == false || touchingRamp3 == false || touchingWall4 == false || touchingFloor4 == false || touchingRamp4 == false{
                
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
            
            
            
           
        
        
        
        
            
        
        if topBar!.contains(ramp3!.position){
            
            let rampShrink = SKAction.resize(toWidth: 20, height: 110, duration: 0.3)
            
            ramp3!.run(rampShrink)
            rampShadow3!.run(rampShrink)
            
        }
            
           if touchingWall == false || touchingFloor == false || touchingRamp == false || touchingWall2 == false || touchingFloor2 == false || touchingRamp2 == false || touchingWall3 == false || touchingFloor3 == false || touchingRamp3 == false || touchingWall4 == false || touchingFloor4 == false || touchingRamp4 == false{
                
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
        
        
            
        
            if topBar!.contains(wall!.position){
            
                let wallShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
            
                wall!.run(wallShrink)
                wallShadow!.run(wallShrink)
                
            }
        
        
        
        
            if topBar!.contains(floor!.position){
            
                let floorShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
            
                floor!.run(floorShrink)
                 floorShadow!.run(floorShrink)
            }
        
        
        if topBar!.contains(ramp!.position){
            
            let rampShrink = SKAction.resize(toWidth: 20, height: 110, duration: 0.3)
            
            ramp!.run(rampShrink)
            rampShadow!.run(rampShrink)
            
            }
        
        if topBar!.contains(wall2!.position){
        
            let wallShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
        
            wall2!.run(wallShrink)
            wallShadow2!.run(wallShrink)
            
        }
    
        if topBar!.contains(floor2!.position){
        
            let floorShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
        
            floor2!.run(floorShrink)
             floorShadow2!.run(floorShrink)
        }
    
    
    if topBar!.contains(ramp2!.position){
        
        let rampShrink = SKAction.resize(toWidth: 20, height: 110, duration: 0.3)
        
        ramp2!.run(rampShrink)
        rampShadow2!.run(rampShrink)
        
        }
        
        if topBar!.contains(wall3!.position){
        
            let wallShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
        
            wall3!.run(wallShrink)
            wallShadow3!.run(wallShrink)
            
        }
    
    
            
        
        if topBar!.contains(floor3!.position){
        
            let floorShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
        
            floor3!.run(floorShrink)
             floorShadow3!.run(floorShrink)
        }
    
    
    if topBar!.contains(ramp3!.position){
        
        let rampShrink = SKAction.resize(toWidth: 20, height: 110, duration: 0.3)
        
        ramp3!.run(rampShrink)
        rampShadow3!.run(rampShrink)
        
        }
        
        if topBar!.contains(wall4!.position){
        
            let wallShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
        
            wall4!.run(wallShrink)
            wallShadow4!.run(wallShrink)
            
        }
    
    
    
    
        if topBar!.contains(floor4!.position){
        
            let floorShrink = SKAction.resize(toWidth: 20, height: 80, duration: 0.3)
        
            floor4!.run(floorShrink)
             floorShadow4!.run(floorShrink)
        }
    
    
    if topBar!.contains(ramp4!.position){
        
        let rampShrink = SKAction.resize(toWidth: 20, height: 110, duration: 0.3)
        
        ramp4!.run(rampShrink)
        rampShadow4!.run(rampShrink)
        
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
        
        if HomeScene.level5HaveStar1 == true{
            
            Star1!.position = StarSpot1!.position
            Star1!.size = StarSpot1!.size
            StarShade1!.size = StarSpot3!.size
            
        }
        
        if HomeScene.level5HaveStar2 == true{
            
            Star2!.position = StarSpot2!.position
            Star2!.size = StarSpot2!.size
            StarShade2!.size = StarSpot3!.size
            
        }
        
        if HomeScene.level5HaveStar3 == true{
            
            Star3!.position = StarSpot3!.position
            Star3!.size = StarSpot3!.size
            StarShade3!.size = StarSpot3!.size
            
        }
        
        
        positions()
        
            if currentTime - prevScoreCalcTime2 > 1.2 {
            prevScoreCalcTime2 = currentTime
            
            
            
        }
            
        if currentTime - prevScoreCalcTime > 1 {
                prevScoreCalcTime = currentTime
                
                
                
        }
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

}

