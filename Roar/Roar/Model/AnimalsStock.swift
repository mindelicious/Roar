//
//  AnimalsStock.swift
//  Roar
//
//  Created by Matt on 20/04/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import Foundation

class AnimalsStock {
    
    var list = [Animal]()
    init() {
        
        let item =  Animal(name: "Bear", soundUrl: "Bear", imageName: "Bear")
        
        list.append(item)
        
        list.append(Animal(name: "Cat", soundUrl: "Cat", imageName: "Cat"))
        list.append(Animal(name: "Chicken", soundUrl: "Chicken", imageName: "Chicken"))
        list.append(Animal(name: "Cow", soundUrl: "Cow", imageName: "Cow"))
        list.append(Animal(name: "Dog", soundUrl: "Dog", imageName: "Dog"))
        list.append(Animal(name: "Donkey", soundUrl: "Donkey", imageName: "Donkey"))
        list.append(Animal(name: "Duck", soundUrl: "Duck", imageName: "Duck"))
        list.append(Animal(name: "Elephant", soundUrl: "Elephant", imageName: "Elephant"))
    }
}
