//
//  PlaySound.swift
//  Roar
//
//  Created by Matt on 17/04/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import Foundation
import AVFoundation

var player: AVAudioPlayer?
var animal: Animal?

func playSound() {
    guard let url = Bundle.main.url(forResource: animal?.soundUrl, withExtension: "mp3") else { return }
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
