//
//  GameViewController.swift
//  AiSpritee
//
//  Created by Max Bilbow on 03/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import UIKit
import SpriteKit
import CoreMotion

extension SKNode {
    class func unarchiveFromFile(file : String) -> SKNode? {
        if let path = NSBundle.mainBundle().pathForResource(file, ofType: "sks") {
            var sceneData = NSData(contentsOfFile: path, options: .DataReadingMappedIfSafe, error: nil)!
            var archiver = NSKeyedUnarchiver(forReadingWithData: sceneData)
            
            archiver.setClass(self.classForKeyedUnarchiver(), forClassName: "SKScene")
            let scene = archiver.decodeObjectForKey(NSKeyedArchiveRootObjectKey) as! GameScene
            archiver.finishDecoding()
            return scene
        } else {
            return nil
        }
    }
}

class GameViewController: UIViewController, SKSceneDelegate {
    

    var gravity: CMAcceleration = CMAcceleration()
    let _hasMotion = true
    
    let motionManager: CMMotionManager = CMMotionManager()
    let rollSpeed: RMFloat = -1
    
    var moveButtonPad: UIImageView?// = RMXModels.getImage()
    var moveButton: UIView?
    var jumpButton: UIButton?
    var boomButton: UIButton?
    var topBar: UIView?
    var menuAccessBar: UIView?
    var pauseMenu: UIView?

    var world: GameScene?

    var GRAVITY: Double = 9.8
    
    
    func update(currentTime: NSTimeInterval, forScene scene: SKScene) {
        if let motion = self.motionManager.deviceMotion {
            scene.physicsWorld.gravity.dx = CGFloat(motion.gravity.x * self.GRAVITY)
            scene.physicsWorld.gravity.dy = CGFloat(motion.gravity.y * self.GRAVITY)
            
        }
        if let m = self.motionManager.accelerometerData {
//            scene.physicsWorld.gravity.dx += CGFloat(m.acceleration.x)
//            scene.physicsWorld.gravity.dy += CGFloat(m.acceleration.y)
        }
        if let m = self.motionManager.gyroData {
//            scene.physicsWorld.gravity.dx += CGFloat(m.acceleration.x)
//            scene.physicsWorld.gravity.dy += CGFloat(m.acceleration.y)
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if _hasMotion {
            self.motionManager.startAccelerometerUpdates()
            self.motionManager.startDeviceMotionUpdates()
            self.motionManager.startGyroUpdates()
//            self.motionManager.startMagnetometerUpdates()
        }

        
        if let scene = GameScene.unarchiveFromFile("GameScene") as? GameScene {
            // Configure the view.
            let skView = self.view as! SKView
            skView.showsFPS = true
            skView.showsNodeCount = true
            
            /* Sprite Kit applies additional optimizations to improve rendering performance */
            skView.ignoresSiblingOrder = true
            
            /* Set the scale mode to scale to fit the window */
            scene.scaleMode = .AspectFill
            scene.delegate = self
            skView.presentScene(scene)
            
            self.world = scene
        }
    }

    override func shouldAutorotate() -> Bool {
        return true
    }

    
    override func supportedInterfaceOrientations() -> Int {
        if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
            return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
        } else {
            return Int(UIInterfaceOrientationMask.All.rawValue)
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
    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
//        self.print()
//        println()
//        println(self.world!.scene!.description)
//        println()
//        println(self.world!.description)
//        println()
//        println(self.world?.contentScaleFactor.description)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
}
