//
//  Sound.swift
//  Roar
//
//  Created by Matt on 26/04/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import Foundation
import AVFoundation

var player : AVAudioPlayer?

func playSound(soundUrl: String) {
    guard let url = Bundle.main.url(forResource: soundUrl, withExtension: "mp3") else { return }
    do
    {
        try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
        try AVAudioSession.sharedInstance().setActive(true)
        
        player = try AVAudioPlayer(contentsOf: url)
        guard let player = player else { return }
        
        player.play()
    } catch let error {
        print(error.localizedDescription)
    }
}
func stopSound() {
    if player != nil {
        player?.stop()
    }
    
}

