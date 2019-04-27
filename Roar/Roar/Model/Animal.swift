//
//  Animal.swift
//  Roar
//
//  Created by Matt on 09/03/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class Animal {
    let name: String
    let soundUrl: String
    let imageName: String
   
    
    init(name: String, soundUrl: String, imageName: String) {
        self.name = name
        self.soundUrl = soundUrl
        self.imageName = imageName
    }
    
//    func playSound() {
//        guard let url = Bundle.main.url(forResource: soundUrl, withExtension: "mp3") else { return }
//        do
//        {
//            try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
//            try AVAudioSession.sharedInstance().setActive(true)
//            
//            player = try AVAudioPlayer(contentsOf: url)
//            guard let player = player else { return }
//            
//            player.play()
//        } catch let error {
//            print(error.localizedDescription)
//        }
//    }
//    func stopSound() {
//        if player != nil {
//            player?.stop()
//        }
//        
//    }
}



