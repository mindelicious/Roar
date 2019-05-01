//
//  SwipeableCardViewCard.swift
//  Roar
//
//  Created by Matt on 01/05/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class SwipeableCardViewCard: SwipeableView, NibView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
}
