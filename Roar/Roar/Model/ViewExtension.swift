//
//  ViewExtension.swift
//  Roar
//
//  Created by Matt on 16/04/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func pulseCard() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
        pulse.duration = 0.3
        pulse.fromValue = 1
        pulse.toValue = 0.96
        pulse.autoreverses = true
        pulse.repeatCount = 1
        pulse.initialVelocity = -5
        pulse.damping = 0
        
        layer.add(pulse, forKey: nil)
        
    }
}
