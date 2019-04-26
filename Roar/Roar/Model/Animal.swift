//
//  Animal.swift
//  Roar
//
//  Created by Matt on 09/03/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import Foundation
import AVFoundation

class Animal {
    let name: String
    let soundUrl: String
    let imageName: String
    var player: AVAudioPlayer?
    
    init(name: String, soundUrl: String, imageName: String) {
        self.name = name
        self.soundUrl = soundUrl
        self.imageName = imageName
    }
    // Move func to seperate file
    func playSound() {
        guard let url = Bundle.main.url(forResource: self.soundUrl, withExtension: "mp3") else { return }
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
    
}



