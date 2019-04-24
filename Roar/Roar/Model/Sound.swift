//
//  PlaySound.swift
//  Roar
//
//  Created by Matt on 17/04/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import Foundation
import AVFoundation

var player = AVAudioPlayer()

func playSound() {
  
    do {
        player = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: "Bear", ofType: "mp3")!))
        player.play()
    }
    catch {
        print(error)
    }
}

func stopPlaying() {
    
    if player.isPlaying {
        player.stop()
    }
    
    }



