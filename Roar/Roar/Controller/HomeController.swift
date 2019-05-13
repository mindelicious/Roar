//
//  ViewController.swift
//  Roar
//
//  Created by Matt on 03/02/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit
import Foundation

class HomeController: UIViewController {
    
    var animalCard = AnimalCardCell()
  
    var allAnimals = AnimalsStock()
    var allAnimalArray = [AnimalsStock]()
    var animalNumber: Int = 0
    
    
    var initialCGRect = CGRect()
    
    let cardDeckView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        cardCollectionView.delegate = self
//        cardCollectionView.dataSource = self
        
//        gradientTextView()
//        setupAnimalCards()

        setupLayout()
        setupCards()
    }
    
    func setupCards() {
        
        allAnimals.list.forEach { (animal) in
            
            let cardView = CardView(frame: .zero)
            cardView.imageView.image = UIImage(named: animal.imageName)
            cardView.animalLabel.text = animal.name
            cardDeckView.addSubview(cardView)
            cardView.fillSuperview()
         
        }
      
    }
    
    func setupLayout() {
        view.backgroundColor = .white
        view.addSubview(cardDeckView)
      
        cardDeckView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 50, left: 12, bottom: 120, right: 12))
        
        
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
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return allAnimals.list.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: animalCard.identifier, for: indexPath) as? AnimalCardCell else {
//            return UICollectionViewCell()
//        }
//        let animalObject = allAnimals.list[indexPath.row]
//
//        cell.animalView.image = UIImage(named: "\(animalObject.imageName)")
//        cell.animalLabel.text = animalObject.name
//
//        //Creating Shadow and modify card
//        cell.contentView.layer.cornerRadius = 8.0
//        cell.contentView.layer.borderWidth = 1.0
//        //border color
//        cell.contentView.layer.borderColor = UIColor.black.cgColor
//        cell.contentView.layer.masksToBounds = false
//        cell.layer.shadowColor = UIColor.gray.cgColor
//        cell.layer.shadowOffset = CGSize(width: 0, height: 1.0)
//        cell.layer.cornerRadius = 10.0
//        cell.layer.shadowRadius = 10.0
//        cell.layer.shadowOpacity = 1.0
//        cell.layer.masksToBounds = false
//        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
//
//
//
//        return cell
//    }
//
//
    
}
 
