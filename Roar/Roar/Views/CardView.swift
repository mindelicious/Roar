//
//  CardView.swift
//  Roar
//
//  Created by Matt on 07/02/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

extension HomeController {
    
    
    // MARK: - Gradient On a textView
    func gradientTextView() {
        
        let gradientLayer = CAGradientLayer()
        textView.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        gradientLayer.frame = textView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.clear.cgColor, UIColor.black.cgColor, UIColor.black.cgColor]
//        gradientLayer.locations = [0, 0.2, 0.2, 1]
        textView.layer.mask = gradientLayer
        
    }

}
