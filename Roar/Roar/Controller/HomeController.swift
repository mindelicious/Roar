//
//  ViewController.swift
//  Roar
//
//  Created by Matt on 03/02/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit
import AVFoundation


class HomeController: UIViewController {
    
    // let animalCardDeckView = UIView()
    @IBOutlet weak var animalView: UIImageView!
    @IBOutlet weak var textView: UIView!
    @IBOutlet weak var animalLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    
    var initialCGPoint = CGPoint()
    var initialCGRect = CGRect()
    
    var allAnimals = AnimalsStock()
    var animalNumber: Int = 0
    
    //Configuraton
    let treshold: CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientTextView()
    
        setupAnimalCards()
//        let firstAnimal = allAnimals.list.first!
//        animalView.image  = UIImage(named: firstAnimal.imageName)
//        animalLabel.text = firstAnimal.name
        
    }
    
    func setupAnimalCards() {
        
        if animalNumber <= allAnimals.list.count - 1 {
        animalLabel.text = allAnimals.list[animalNumber].name
        animalView.image = UIImage(named: "\(allAnimals.list[animalNumber].imageName)")
        animalNumber = animalNumber + 1
       // Can i use forEach method?
//        .forEach { () in
//            animalView.image = UIImage(named: Animal.imageName)
//            animalLabel.text = Animal.name
        //        }
        } else {
            animalNumber = 0
        }
    }
    

    
    @IBAction func handleTap(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
            cardView.pulseCard()
            playSound()
        }
    }
    

    
    // MARK: - PanGesture
    @IBAction func panCard(recognizer: UIPanGestureRecognizer) {
        guard let card =  recognizer.view else { return }
        switch recognizer.state {
        case .began:
            initialCGRect = card.frame
        case .changed:
            panChanged(recognizer, card)
        case .ended:
            panEnded(recognizer, card)
            setupAnimalCards()
        default:
            return
        }
    }

    fileprivate func panChanged(_ recognizer: UIPanGestureRecognizer, _ card: UIView) {
        let panning = recognizer.translation(in: view)
        let degrees : CGFloat = panning.x / 20
        let angle = degrees * .pi / 180

        let rotationTransformation = CGAffineTransform(rotationAngle: angle)
        card.transform = rotationTransformation.translatedBy(x: panning.x, y: panning.y)
    }

    fileprivate func panEnded(_ recognizer: UIPanGestureRecognizer, _ card: UIView) {

        let transitionDirection: CGFloat = recognizer.translation(in: view).x > 0 ? 1 : -1
        let shuldDismissCard = abs(recognizer.translation(in: view).x) > treshold

        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            if shuldDismissCard {
                card.frame = CGRect(x: 600 * transitionDirection, y: 0, width: card.frame.width, height: card.frame.height)
               
            } else {
                card.transform = CGAffineTransform.identity
                
            }

        }) { (_) in
            // Complete animation,bringing card back
                        card.center = self.initialCGPoint
            card.transform = CGAffineTransform.identity
            card.frame = self.initialCGRect
            
            
            
        }
    }


}