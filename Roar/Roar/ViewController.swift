//
//  ViewController.swift
//  Roar
//
//  Created by Matt on 03/02/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    // let animalCardDeckView = UIView()
    @IBOutlet weak var animalView: UIImageView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var animalLabel: UILabel!
    
    var initialCenter = CGPoint()
    var initialCGRect = CGRect()
    //Configuraton
    let treshold: CGFloat = 100
    let tresholdLeft: CGFloat = -100
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientTextView()
        
        setupDummyCard()
    }
  
    
    // MARK: - PanGesture
    @IBAction func handleCard(recognizer: UIPanGestureRecognizer) {
        
        guard let card =  recognizer.view else { return }
        
        switch recognizer.state {
        case .began:
            initialCenter = card.center
            initialCGRect = card.frame
        case .changed:
            handleChanged(recognizer, card)
        case .ended:
            handleEnded(recognizer, card)
        default:
            return
        }
    }
    
    fileprivate func handleChanged(_ recognizer: UIPanGestureRecognizer, _ card: UIView) {
       let panning = recognizer.translation(in: view)
        // Converting Radian to Degree
        let degrees : CGFloat = panning.x / 20
        let angle = degrees * .pi / 180
        
        let rotationTransformation = CGAffineTransform(rotationAngle: angle)
        card.transform = rotationTransformation.translatedBy(x: panning.x, y: panning.y)
    }
    
    fileprivate func handleEnded(_ recognizer: UIPanGestureRecognizer, _ card: UIView) {
        
        let shuldDismissCard = recognizer.translation(in: view).x > treshold || recognizer.translation(in: view).x < tresholdLeft
        
        
        UIView.animate(withDuration: 0.75, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            if shuldDismissCard {
                    card.frame = CGRect(x: 1000, y: 0, width: card.frame.width, height: card.frame.height)
                
            } else {
                card.center = self.initialCenter
                card.transform = CGAffineTransform.identity
            }
           
        }) { (_) in
            // Complete animation,bringing card back
//            card.center = self.initialCenter
            card.transform = CGAffineTransform.identity
            card.frame = self.initialCGRect
        }
    }
    
}
