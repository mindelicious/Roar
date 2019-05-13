//
//  CardView.swift
//  Roar
//
//  Created by Matt on 09/05/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class CardView: UIView {
  
    let imageView = UIImageView(image: #imageLiteral(resourceName: "Bear"))
    let gradientLayer = CAGradientLayer()
    let animalLabel = UILabel()
   
    fileprivate let treshold: CGFloat = 80
    
    override init(frame: CGRect) {
        super.init(frame: frame)
   
        setupGradientLayer()
        setupLayout()
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCard))
        addGestureRecognizer(panGesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapCard))
        addGestureRecognizer(tapGesture)
    }
    
    //MARK: - Setup text displayed on card
    func setupLayout() {
        
        backgroundColor = .white
        layer.cornerRadius = 10
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        imageView.fillSuperview()
        
        addSubview(animalLabel)
        animalLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor,padding: .init(top: 0, left: 0, bottom: 10, right: 0))
        animalLabel.textColor = .white
        animalLabel.font = UIFont.systemFont(ofSize: 54, weight: .medium)
        animalLabel.textAlignment = .center
    }
    
    //MARK: - Setup Gradient
    func setupGradientLayer() {
        
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.1]
        
        layer.addSublayer(gradientLayer)
    }
    
    override func layoutSubviews() {
        gradientLayer.frame = self.frame
        gradientLayer.cornerRadius = 10
    }
    
    //MARK: - UIPanGestureRecognizer
    @objc fileprivate func panCard(recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            //avoid animation go crazy when start panning
            superview?.subviews.forEach({ (subview) in
                subview.layer.removeAllAnimations()
            })
        case .changed:
            panChanged(recognizer)
        case .ended:
            panEnded(recognizer)
        default:
            ()
        }
    }
    
    fileprivate func panChanged(_ recognizer: UIPanGestureRecognizer) {
        let panning = recognizer.translation(in: self)
        let degrees : CGFloat = panning.x / 20
        let angle = degrees * .pi / 180
        
        let rotationTransformation = CGAffineTransform(rotationAngle: angle)
        self.transform = rotationTransformation.translatedBy(x: panning.x, y: panning.y)
    }
    
    fileprivate func panEnded(_ recognizer: UIPanGestureRecognizer) {
        
        let shouldDismissCard = abs(recognizer.translation(in: nil).x) > treshold
        let transitionDirection: CGFloat = recognizer.translation(in: self).x > 0 ? 1 : -1
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.1, options: .curveEaseOut, animations: {
            if shouldDismissCard {
                self.frame = CGRect(x: 600 * transitionDirection, y: 0, width: self.frame.width, height: self.frame.height)
              stopSound()
     
            } else {
                self.transform = .identity
            }
        }) { (_) in
            self.transform = .identity
            if shouldDismissCard {
                self.removeFromSuperview()
            }
        
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UITapGestureRecognizer
    @objc fileprivate func tapCard(recognizer: UITapGestureRecognizer, for card: CardView) {
        if let CardView = recognizer.view as? CardView {
        playSound(soundUrl: CardView.animalLabel.text!)
        }
        pulseCard()
    }
    
}
