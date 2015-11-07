//
//  GameViewController.swift
//  Adventures of Popsicle
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import UIKit
import SpriteKit


import UIKit
import SpriteKit


extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            do {
                let sceneData = try NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe)
                let archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
                
                archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
                let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
                archiver.finishDecoding()
                return scene
            } catch {
                print(error)
                return nil
            }
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController {
    
    static var instance: GameViewController! {
        return _instance;
    }
    
    private static var _instance: GameViewController!
    
    let rollSpeed: Float = -1
    
    var moveButtonPad: UIImageView?// = RMXModels.getImage()
    var moveButton: UIView?
    var jumpButton: UIButton?
    var boomButton: UIButton?
    var topBar: UIView?
    var menuAccessBar: UIView?
    var pauseMenu: UIView?
    
    var world: GameScene?
    


    override func viewDidLoad() {
        super.viewDidLoad()
        GameViewController._instance = self
                
        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
//            scene.delegate = self
            skView.presentScene(scene)
            
            self.world = scene
        }
    }
    

    
   func print() {
        var print = "\n"
        print += "boudingBox frame: \(self.world!.boundingBox.frame.print)\n"
        //        print += "  GameView frame: \(self.world!.frame.print)\n"
        //        print += " GameView bounds: \(self.world!.bounds.print)\n"
        print += "     Scene frame: \(self.world!.scene!.frame.print)\n"
        print += "     Scene scale: \(self.world!.scene!.xScale.toData()), \(self.world!.scene!.yScale.toData())\n"
        print += "      View scale: \(self.world!.scene!.xScale.toData()), \(self.world!.scene!.yScale.toData())\n\n"
        print += "      View scale: \(self.world!.scene!.size.print)\n"
        NSLog(print)
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
        for node in self.world!.scene!.children {
            if let body = node.physicsBody {
                body.dynamic = false
//                return
            }
        }
        
//        self.world!.crackScreen()
        
        
    }
    
    
   
}
