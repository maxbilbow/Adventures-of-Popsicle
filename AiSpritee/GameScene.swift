//
//  GameScene.swift
//  AiSpritee
//
//  Created by Max Bilbow on 03/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var gvc: GameViewController!
 
    var activeCamera: SKNode?
    var activeSprite: RMXSprite!
    
    var isLive: Bool {
        return !self.paused
    }
    var boundingBox: SKShapeNode!
    var floor: SKShapeNode!

    
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
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        /* Called when a touch begins */
        
        for touch in (touches as! Set<UITouch>) {
            let location: CGPoint = touch.locationInNode(self)
            let ball = SKShapeNode(circleOfRadius: 10)
            ball.fillColor = RMX.randomColor()
            ball.position = location

            if let body = ball.physicsBody {
                NSLog(body.description)
            } else {
                ball.physicsBody = SKPhysicsBody(circleOfRadius: 5)
            }
            self.scene?.addChild(ball)
        }
        
        /*
        for touch in (touches as! Set<UITouch>) {
            let location = touch.locationInNode(self)
            
            let sprite = SKSpriteNode(imageNamed:"Spaceship")
            
            sprite.xScale = 0.5
            sprite.yScale = 0.5
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            self.addChild(sprite)
        } */
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
}
