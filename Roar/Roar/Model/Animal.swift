//
//  Animal.swift
//  Roar
//
//  Created by Matt on 09/03/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import Foundation
import UIKit

struct Animal {
    let name: String
    let soundUrl: String
    let imageName: String
   
    
    init(name: String, soundUrl: String, imageName: String) {
        self.name = name
        self.soundUrl = soundUrl
        self.imageName = imageName
    }
}



