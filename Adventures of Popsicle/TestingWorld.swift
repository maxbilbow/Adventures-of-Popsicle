//
//  TestingWorld.swift
//  AiSpritee
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import Foundation
import SpriteKit
extension GameScene  {
    func initTestingWorld() {
        
        self.size = self.view!.bounds.size
        var shape =  self.frame
        shape.size = self.size
        
        
        self.boundingBox = SKShapeNode(rect: shape)//, centered: true)//: self.world!.scene!.size)
        let boundingBox = self.boundingBox
        boundingBox.name = "boundingBox"
//        boundingBox.position = self.world!.center
        boundingBox.strokeColor = RMColor.redColor()
        boundingBox.physicsBody = SKPhysicsBody(edgeLoopFromRect: shape)
        boundingBox.physicsBody?.restitution = 0.9
        self.scaleMode = SKSceneScaleMode.AspectFill
        self.addChild(boundingBox)
//        self.view!.autoresizesSubviews = true

        
        
        shape.size.height /= 4
        self.floor = SKShapeNode(rect: shape)
        let floor = self.floor
        floor.physicsBody = SKPhysicsBody(edgeLoopFromRect: shape)
        floor.physicsBody?.restitution = 0.9
        floor.name = "floor"
        floor.fillColor = RMColor.blackColor()
        self.addChild(floor)
        
        self.crackedGlass.hidden = true
        boundingBox.addChild(self.crackedGlass)
    
    }
}