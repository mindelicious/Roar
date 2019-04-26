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
        list.append(Animal(name: "Fly", soundUrl: "Fly", imageName: "Fly"))
        list.append(Animal(name: "Frog", soundUrl: "Frog", imageName: "Frog"))
        list.append(Animal(name: "Goat", soundUrl: "Goat", imageName: "Goat"))
        list.append(Animal(name: "Horse", soundUrl: "Horse", imageName: "Horse"))
        list.append(Animal(name: "Lion", soundUrl: "Lion", imageName: "Lion"))
        list.append(Animal(name: "Monkey", soundUrl: "Monkey", imageName: "Monkey"))
        list.append(Animal(name: "Daddy", soundUrl: "Cough", imageName: "Daddy"))
    }
}
