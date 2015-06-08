//
//  RMXSprite.swift
//  AiSpritee
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import Foundation


protocol RMXSprite : RMXObject {
    var world: RMXWorld { get }
    var timer: RMXSpriteTimer! { get }
    var aiDelegate: RMXAiDelegate? { get }
    var type: RMXSpriteType { get }
    var node: RMXNode { get }
    var spriteLogic: [ AiBehaviour ] { get }
    func validate()
}