//
//  RMSWorld.swift
//  AiSpritee
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import Foundation
import SpriteKit

class RMXWorld : SKScene {
    
    var activeCamer: SKNode?
    var activeSprite: SKNode!
    
    var isLive: Bool {
        return !self.paused
    }
    
    var sprites: [RMXSprite] = []
}