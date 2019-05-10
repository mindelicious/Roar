//
//  CardView.swift
//  Roar
//
//  Created by Matt on 09/05/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class CardView: UIView {

    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "Bear"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .gray
        layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCard))
        addGestureRecognizer(panGesture)
    }
    
    @objc fileprivate func panCard(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .changed:
            panChanged(recognizer)
        case .ended:
            panEnded()
        default:
            ()
        }
    }
    
    fileprivate func panChanged(_ recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translation(in: nil)
        self.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
    }
    
    fileprivate func panEnded() {
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            self.transform = .identity
        }) { (_) in
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
