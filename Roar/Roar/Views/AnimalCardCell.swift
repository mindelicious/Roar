//
//  AnimalCardCell.swift
//  Roar
//
//  Created by Matt on 05/05/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class AnimalCardCell: UICollectionViewCell {
    
     let identifier = "AnimalCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    @IBOutlet weak var animalView: UIImageView!
    @IBOutlet weak var animalLabel: UILabel!
    
    func setUpViews() {
        
    }
  
}
