//
//  CardView.swift
//  Roar
//
//  Created by Matt on 09/05/2019.
//  Copyright © 2019 mindelicious. All rights reserved.
//

import UIKit

class CardView: UIView {

    fileprivate let imageView = UIImageView(image: #imageLiteral(resourceName: "Bear"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //custom drawing code
        backgroundColor = .white
        
        addSubview(imageView)
        imageView.fillSuperview()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
