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
    
    var initialCGRect = CGRect()
    
    let cardDeckView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
}
 
