//
//  GameScene.swift
//  Adventures of Popsicle
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import SpriteKit
import GameKit

//import CoreMotion

class GameScene: SKScene {
    
    var gvc: GameViewController!
    
    var localPlayer: GKLocalPlayer!
    
    var activeCamera: SKNode?
    var activeSprite: AnyObject!
    
    var isLive: Bool {
        return !self.paused
    }
    var boundingBox: SKShapeNode!
    var floor: SKShapeNode!
    var crackedGlass = SKSpriteNode(imageNamed: "glass-shattered-broken-cracked-1-texture-by-aaron-pate")
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        crackedGlass.frame = CGRect(x: 0, y: 0, width: 1920, height: 1080)
        
    }
    var GRAVITY: Double = 9.8
//    var gravity: CMAcceleration = CMAcceleration()
    let _hasMotion = true
    
//    let motionManager: CMMotionManager = CMMotionManager()
    
    var sprites: [RMXNode] {
        return self.children.filter({ (child) -> Bool in
            return child is RMXNode
        }) as! Array<RMXNode>
    }
    
    
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let myLabel = SKLabelNode(fontNamed:"Helvetica")
        myLabel.text = "Hello, World!";
        myLabel.fontSize = 35;
        myLabel.position = self.scene!.frame.origin// CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame));
        myLabel.position.x = self.frame.width / 2
        myLabel.position.y = self.frame.height / 4
        

        
        self.initTestingWorld()
        self.addChild(myLabel)
    }
    
    var nodeCount = 0
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.touchesBegan(touches, withEvent: event)
    }
    

    func addNodes(touches: Set<UITouch>) throws  {
        for touch in touches {
            let location: CGPoint = touch.locationInNode(self)
            let radius = CGFloat(random() % 20 + 10)
            let ball = SKShapeNode(circleOfRadius: radius)
            ball.physicsBody = SKPhysicsBody(circleOfRadius: radius)
            ball.fillColor = RMX.randomColor()
            ball.position = location
            ball.physicsBody?.restitution = 0.9
            ball.physicsBody?.friction = 0.1
            ball.physicsBody?.mass = radius * radius * PI_CG
            
            self.scene?.addChild(ball)
            ++self.nodeCount
            if self.nodeCount > 500 {
                self.crackScreen()
                nodeCount = 0
            }
        }
        
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        /* Called when a touch begins */
        
        do {
            try self.addNodes(touches)
        } catch {
            print(error)
        }
        
    }
    var lastTime:CFTimeInterval = 99999
    let crack = RMXAudio.player(RMXAudio.url("Slap 1", ofType: "caf"))
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
        
        let diff = currentTime - self.lastTime
        if diff > 0.15 {
            self.crackScreen()
        } else if diff > 0.1 {
            self.crack?.prepareToPlay()
        }
        self.lastTime = currentTime
        
        
    }
    
    func crackScreen() {
//        RMXAudio.crack?.play()
//        self.crackedGlass.hidden = false
//        NSTimer.scheduledTimerWithTimeInterval(10, target: self, selector: "resetGame", userInfo: nil, repeats: false)
    }
    
    func resetGame() {
        self.scene?.removeAllChildren()
        self.initTestingWorld()
//        self.crackedGlass.hidden = true
    }
}