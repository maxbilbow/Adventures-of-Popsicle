//
//  AV.swift
//  AiSpritee
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import Foundation
import AVFoundation

class RMXAudio {
    
    static let sounds: [String:AVAudioPlayer?] = [
        UserAction.BOOM.description : RMXAudio.player(RMXAudio.url("Air Reverse Burst 2", ofType: "caf")),
        UserAction.JUMP.description : RMXAudio.player(RMXAudio.url("Pop", ofType: "m4a")),
        UserAction.THROW_ITEM.description : RMXAudio.player(RMXAudio.url("Baseball Catch", ofType: "caf")),
        "Pop"  : RMXAudio.player(RMXAudio.url("Pop", ofType: "m4a")),
        "pop2" : RMXAudio.player(RMXAudio.url("pop2", ofType: "m4a")),
        "pop1" : RMXAudio.player(RMXAudio.url("pop1", ofType: "m4a")),
        "slap" : RMXAudio.player(RMXAudio.url("Slap 1", ofType: "caf"))
    ]

    
    private var soundsQueue: [AVAudioPlayer] = []
    func playAudio() {
        for sound in self.soundsQueue {
            sound.play()
        }
        self.soundsQueue.removeAll(keepCapacity: true)
    }
    
    class func url(name: String, ofType ext: String) -> NSURL? {
        return NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(name, ofType: ext)!)
    }
    
    func playSound(name: String, info: AnyObject?, volume maxVolume: Float = 1, range: Float = 500, autoPlay: Bool = true, volume: Float = 1) -> Bool {
        return false
    }
    
    class func player(url: NSURL?) -> AVAudioPlayer? {
        do {
            let player = try AVAudioPlayer(contentsOfURL: url!)
            player.prepareToPlay()
            return player
        } catch {
            print(error)
            return nil
        }
    }
    
    static let crack = RMXAudio.player(RMXAudio.url("Slap 1", ofType: "caf"))

}