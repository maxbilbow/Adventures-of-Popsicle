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


typealias AiBehaviour = (SKNode!) -> Void
typealias AiCollisionBehaviour = (SKPhysicsContact) -> Void
typealias RMSceneRenderer = AnyObject
typealias RMXWorld = GameScene