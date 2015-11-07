//
//  RMXNode.swift
//  AiSpritee
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import Foundation
import SpriteKit

//protocol AiBehaviour {
//    
//}

class RMXNode : SKNode {
    //RMXObject

    var rmxID: Int? = RMX.COUNT++
    var uniqueID: String?
    var print: String {
        return "\(self.name)"
    }
    
    //RMXSprite
    var world: RMXWorld
    var timer: NSTimer!
    var aiDelegate: AnyObject?//RMXAiDelegate?
    var type: RMXSpriteType = .ABSTRACT
    var node: RMXNode {
        return self
    }
    
    var spriteLogic: [ AiBehaviour ] = []
    func validate() { }
    
    init(world: RMXWorld) { //, fileNamed name: String? = nil) {
        self.world = world
        super.init()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
 
}