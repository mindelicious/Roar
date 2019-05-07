//
//  ViewController.swift
//  Roar
//
//  Created by Matt on 03/02/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit
import Foundation

class HomeController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var animalCard = AnimalCardCell()
   
    
    @IBOutlet weak var cardCollectionView: UICollectionView!
   
    
    var allAnimals = AnimalsStock()
    var allAnimalArray = [AnimalsStock]()
    var animalNumber: Int = 0
    
    let treshold: CGFloat = 80
    var initialCGRect = CGRect()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCollectionView.delegate = self
        cardCollectionView.dataSource = self
        
//        gradientTextView()
//        setupAnimalCards()
   
    }
    
    
//    func setupAnimalCards() {
//
//        if animalNumber <= allAnimals.list.count - 1 {
//
//           animalCard.animalLabel.text = allAnimals.list[animalNumber].name
//            animalCard.animalView.image = UIImage(named: "\(allAnimals.list[animalNumber].imageName)")
//
//        } else if animalNumber == allAnimals.list.endIndex {
//
//            animalCard.animalLabel.text = allAnimals.list[0].name
//            animalCard.animalView.image = UIImage(named: "\(allAnimals.list[0].imageName)")
//            animalNumber = 0
//        }
//
//    }
    
    //MARK: - UICollectiovViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allAnimals.list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: animalCard.identifier, for: indexPath) as? AnimalCardCell else {
            return UICollectionViewCell()
        }
        let animalObject = allAnimals.list[indexPath.row]
        
        cell.animalView.image = UIImage(named: "\(animalObject.imageName)")
        cell.animalLabel.text = animalObject.name
        
        //Creating Shadow and modify card
        cell.contentView.layer.cornerRadius = 8.0
        cell.contentView.layer.borderWidth = 1.0
        //border color
        cell.contentView.layer.borderColor = UIColor.black.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
        cell.layer.cornerRadius = 10.0
        cell.layer.shadowRadius = 10.0
        cell.layer.shadowOpacity = 1.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        
       
        
        return cell
    }
    
   
    

    @IBAction func handleTap(_ recognizer: UITapGestureRecognizer) {
        if recognizer.state == .ended {
//            cardView.pulseCard()
//            playSound(soundUrl: allAnimals.list[animalNumber].soundUrl)
//
            print("🍣", "trirurur")
            
            
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
        default:
            return
        }
    }
    // PanChanged
    fileprivate func panChanged(_ recognizer: UIPanGestureRecognizer, _ card: UIView) {
        let panning = recognizer.translation(in: view)
        let degrees : CGFloat = panning.x / 20
        let angle = degrees * .pi / 180
        
        let rotationTransformation = CGAffineTransform(rotationAngle: angle)
        card.transform = rotationTransformation.translatedBy(x: panning.x, y: panning.y)
        
    }
    
    // PanEnded
    fileprivate func panEnded(_ recognizer: UIPanGestureRecognizer, _ card: UIView) {
        
        let transitionDirection: CGFloat = recognizer.translation(in: view).x > 0 ? 1 : -1
        let shuldDismissCard = abs(recognizer.translation(in: view).x) > treshold
        
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            if shuldDismissCard {
                card.frame = CGRect(x: 600 * transitionDirection, y: 0, width: card.frame.width, height: card.frame.height)
                
                stopSound()
                self.animalNumber = self.animalNumber + 1
                
            } else {
             // Card going back smoothly but have a lag when want to move it again
//                card.transform = CGAffineTransform.identity
                

            }
            
        }) { (_) in
            // Complete animation,bringing card back
           
            card.transform = CGAffineTransform.identity
//            card.removeFromSuperview()
//            card.frame = self.initialCGRect
//             self.setupAnimalCards()
            
           
        }
    }
    
}

