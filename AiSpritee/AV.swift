//
//  AV.swift
//  AiSpritee
//
//  Created by Max Bilbow on 08/06/2015.
//  Copyright (c) 2015 Rattle Media. All rights reserved.
//

import Foundation
import AVFoundation

class RMXAudioVideo {
    
    var sounds: [String:AVAudioPlayer] = [
        UserAction.BOOM.description : RMXAudioVideo.player(RMXAudioVideo.url("Air Reverse Burst 2", ofType: "caf")),
        UserAction.JUMP.description : RMXAudioVideo.player(RMXAudioVideo.url("Pop", ofType: "m4a")),
        UserAction.THROW_ITEM.description : RMXAudioVideo.player(RMXAudioVideo.url("Baseball Catch", ofType: "caf")),
        "Pop"  : RMXAudioVideo.player(RMXAudioVideo.url("Pop", ofType: "m4a")),
        "pop2" : RMXAudioVideo.player(RMXAudioVideo.url("pop2", ofType: "m4a")),
        "pop1" : RMXAudioVideo.player(RMXAudioVideo.url("pop1", ofType: "m4a"))
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
    
    class func player(url: NSURL?) -> AVAudioPlayer {
        return AVAudioPlayer(contentsOfURL: url, error: nil)
    }

}