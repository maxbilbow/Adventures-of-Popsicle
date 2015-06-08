//
//  RMXSpriteKit.swift
//  AiSpritee
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import Foundation
import SpriteKit

typealias RendererDelegate = SKSceneDelegate

#if iOS
    typealias RMColor = UIColor
    #elseif OSX
    typealias RMColor = NSColor
    #endif
typealias AiBehaviour = (SKNode!) -> Void
typealias AiCollisionBehaviour = (SKPhysicsContact) -> Void
typealias RMSceneRenderer = AnyObject
typealias RMXWorld = GameScene